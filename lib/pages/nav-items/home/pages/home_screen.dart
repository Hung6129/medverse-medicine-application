import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/trend_list_images.dart';
import '../../../../models/drug_bank_db/recent_search_model.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/awesome_dialog.dart';
import '/pages/nav-items/home/bloc/home_screen_bloc.dart';
import '/services/service_data.dart';
import '/widgets/header.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '/widgets/dimension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/navigation_drawer_widget.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Example images
  String imagesFav = "assets/image/300_imagesrxnav/";

  /// Set search value
  String _selectedDrugs;

  /// Set form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Set texteditcontroller
  final TextEditingController _typeAheadController = TextEditingController();

  /// Future variables
  Future<List<TrendListImage>> listTrendImages;
  Future<List<RecentSearchModel>> listRecentData;

  /// fetch trending data
  Future<List<TrendListImage>> fetchTrendData() async {
    final response = await http
        .get(Uri.parse(Constants.BASE_URL + Constants.TREND_LIST_IMAGES));
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      return list.map((e) => TrendListImage.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  /// fetch recent search data
  Future<List<RecentSearchModel>> fetchRecentdData() async {
    final response =
        await http.get(Uri.parse(Constants.BASE_URL + Constants.RECENT_DATA));
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      print(list.length);
      return list.map((e) => RecentSearchModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    listTrendImages = fetchTrendData();
    listRecentData = fetchRecentdData();
  }

  double _height;
  double _width;

  _sendingData(String id) async {
    await SendData().sendingId(id);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    /// Loading Shimmer Popular
    Widget __loadingPoShimmer() {
      return Container(
        padding: EdgeInsets.only(left: 20),
        height: 200,
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer(
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 10),
                width: 150,
                decoration: BoxDecoration(
                  color: Palette.grey300,
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius20,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    /// Title
    Widget __titleTrend() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: AppText(
            text: "Xu hướng tìm kiếm theo mùa",
            size: Dimensions.font18,
            color: Palette.mainBlueTheme,
            fontWeight: FontWeight.bold,
          ));
    }

    /// Title
    Widget __titleRecent() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: AppText(
            text: "Tìm kiếm nhiều nhất",
            size: Dimensions.font18,
            color: Palette.mainBlueTheme,
            fontWeight: FontWeight.bold,
          ));
    }

    /// Search bar
    Widget __searchBar() {
      return Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height10,
          right: Dimensions.height30,
          left: Dimensions.height30,
          bottom: Dimensions.height10,
        ),
        child: Form(
          key: this._formKey,
          child: Column(
            children: [
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  autocorrect: true,
                  controller: this._typeAheadController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (this._formKey.currentState.validate()) {}
                        },
                        icon: Icon(
                          CupertinoIcons.search,
                          color: Palette.mainBlueTheme,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius20),
                        ),
                        borderSide: BorderSide(color: Palette.mainBlueTheme),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius20),
                        ),
                        borderSide:
                            BorderSide(width: 3, color: Palette.mainBlueTheme),
                      ),
                      labelStyle: TextStyle(
                          fontSize: Dimensions.font14,
                          color: Palette.mainBlueTheme),
                      labelText: 'Nhập thuốc mà bạn muốn tìm'),
                ),
                suggestionsCallback: (String pattern) {
                  if (pattern == null ||
                      pattern.trim().isEmpty ||
                      pattern.length == 0) {
                    return [];
                  } else {
                    return TypeAheadByNameFast.getTypeAheadByName(pattern);
                  }
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: AppText(
                      text: suggestion['productName'],
                      color: Colors.black54,
                      size: Dimensions.font14,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) async {
                  BlocProvider.of<HomeScreenBloc>(context)
                    ..add(
                      OnTapEvent(
                        context: context,
                        navigateData: suggestion['productId'],
                      ),
                    );
                  await _sendingData(suggestion['productId']);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Mời bạn nhập tên thuốc';
                  }
                  return null;
                },
                onSaved: (value) => this._selectedDrugs = value,
              ),
            ],
          ),
        ),
      );
    }

    /// Build carouse slider
    Widget __carouseSlider() {
      return FutureBuilder(
        future: listTrendImages,
        builder: (context, AsyncSnapshot<List<TrendListImage>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return __loadingPoShimmer();
          } else if (snapshot.data == null) {
            return Container(
              child: __loadingPoShimmer(),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            return CarouselSlider.builder(
              itemCount: data.length,
              options: CarouselOptions(
                autoPlayAnimationDuration: Duration(seconds: 3),
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              itemBuilder: (ctx, index, realIdx) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: _width / 2.5,
                                  child: Text(
                                    data[index].pillOverviewData,
                                    style: TextStyle(
                                      fontSize: Dimensions.font14,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: _width / 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Palette.pastel4,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            imagesFav + data[index].rxnavImageFilename,
                            fit: BoxFit.cover,
                            height: _height / 4,
                            width: _width / 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      );
    }

    Widget __recentSearch() {
      return FutureBuilder(
        future: listRecentData,
        builder: (context, AsyncSnapshot<List<RecentSearchModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return __loadingPoShimmer();
          } else if (snapshot.data == null) {
            return Container(
              child: __loadingPoShimmer(),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            return Container(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2.0,
                    margin:
                        new EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Palette.mainBlueThemesec.withOpacity(0.6)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: Dimensions.width10),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        title: Text(
                          data[index].productname,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data[index].productlabeller,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              data[index].productroute,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              data[index].productdosage,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            print(snapshot.data[index].productId);
                            BlocProvider.of<HomeScreenBloc>(context)
                              ..add(
                                OnTapEvent(
                                  context: context,
                                  navigateData: snapshot.data[index].productId,
                                ),
                              );
                          },
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white, size: Dimensions.icon28),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      );
    }

    /// list navigator icon
    Widget __listIcon() {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/pill-identifier");
                  },
                  child: Image.asset(
                    'assets/images/pillidentifier-icon.png',
                    height: _height / 12,
                    width: _width / 12,
                  ),
                ),
                Flexible(
                  child: AppText(
                    text: "Tìm kiếm",
                    size: Dimensions.font14,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/compare-drug");
                    },
                    child: Image.asset(
                      'assets/images/compare-icon.png',
                      height: _height / 12,
                      width: _width / 12,
                    )),
                Flexible(
                  child: Text(
                    "So sánh",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/interaction-checker");
                    },
                    child: Image.asset(
                      'assets/images/interaction-icon.png',
                      height: _height / 12,
                      width: _width / 12,
                    )),
                Flexible(
                  child: Text(
                    "Tương kỵ",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/bmi");
                    },
                    child: Image.asset(
                      'assets/images/bmi-icon.png',
                      height: _height / 12,
                      width: _width / 12,
                    )),
                Flexible(
                  child: Text(
                    "BMI",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/drug-index");
                  },
                  child: Image.asset(
                    'assets/images/index-icon.png',
                    height: _height / 12,
                    width: _width / 12,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Mục lục",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/health-profile");
                  },
                  child: Image.asset(
                    'assets/images/healthprofile-icon.png',
                    height: _height / 12,
                    width: _width / 12,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Hồ sơ",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/report-images");
                  },
                  child: Image.asset(
                    'assets/images/report-icon.png',
                    height: _height / 12,
                    width: _width / 12,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Báo cáo",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/dictionary");
                  },
                  child: Image.asset(
                    'assets/images/dictionary-icon.png',
                    height: _height / 12,
                    width: _width / 12,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Từ điển",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    /// Build body
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: const NavigationDrawerWidget(),
          appBar: appBarMain(titleText: "Trang chủ"),
          body: SingleChildScrollView(
            // physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Search bar
                __searchBar(),
                //Test
                __listIcon(),
                Divider(),
                // List popular product
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    __titleTrend(),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    __carouseSlider(),
                  ],
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    __titleRecent(),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    __recentSearch()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          headerAnimationLoop: false,
          animType: AnimType.TOPSLIDE,
          showCloseIcon: true,
          closeIcon: const Icon(Icons.close_fullscreen_outlined),
          title: 'Thoát',
          desc: 'Bạn có chắc muốn thoát ứng dụng?',
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            SystemNavigator.pop();
          },
        ).show();
      },
    );
  }
}
