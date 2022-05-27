import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '/models/drug_bank_db/product_name.dart';
import '/pages/nav-items/home/bloc/home_screen_bloc.dart';
import '/services/service_data.dart';
import '/widgets/header.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '/widgets/dimension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/navigation_drawer_widget.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Set search value
  String _selectedDrugs;

  /// Set form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Set texteditcontroller
  final TextEditingController _typeAheadController = TextEditingController();

  /// Example images
  String imagesFav = "assets/image/300_imagenlm/";

  /// Get list images
  final List<String> imgList = [
    "00009-0331-02_NLMIMAGE10_070803D0.jpg",
    "00173-0393-40_NLMIMAGE10_8918C4B6.jpg",
    "68462-0147-01_NLMIMAGE10_6D3536D9.jpg",
    "69097-0857-05_NLMIMAGE10_BC4FDE0E.jpg",
    "69097-0123-03_NLMIMAGE10_8D4EC6D6.jpg",
    "69238-1251-06_NLMIMAGE10_FE50FF27.jpg",
    "99207-0467-30_NLMIMAGE10_C11D60AB.jpg",
    "76439-0102-50_NLMIMAGE10_3A3D9D0C.jpg",
  ];

  /// init
  @override
  void initState() {
    super.initState();
  }

  /// Maps icon and name
  var imagesIcon = {
    Icon(
      CupertinoIcons.doc_text_search,
      color: Palette.textNo,
      size: Dimensions.icon28,
    ): AppText(
      text: "Tìm kiếm",
      size: Dimensions.font14,
      color: Palette.textNo,
    ),
    Icon(
      CupertinoIcons.command,
      size: Dimensions.icon28,
      color: Palette.textNo,
    ): AppText(
      text: "So sánh",
      size: Dimensions.font14,
      color: Palette.textNo,
    ),
    Icon(
      CupertinoIcons.drop_triangle_fill,
      size: Dimensions.icon28,
      color: Palette.textNo,
    ): AppText(
      text: "Tương kỵ",
      size: Dimensions.font14,
      color: Palette.textNo,
    ),
    Icon(
      CupertinoIcons.profile_circled,
      size: Dimensions.icon28,
      color: Palette.textNo,
    ): AppText(
      text: "Hồ sơ",
      color: Palette.textNo,
      size: Dimensions.font14,
    ),
  };

  @override
  Widget build(BuildContext context) {
    /// Loading Shimmer Popular
    Widget __loadingPoShimmer() {
      return Container(
        padding: EdgeInsets.only(left: 20),
        height: Dimensions.pageView,
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer(
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 10),
                width: 250,
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
    Widget __title() {
      return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: AppText(
            text: "Xu hướng tìm kiếm",
            size: Dimensions.font20,
            color: Palette.pastel1,
            fontWeight: FontWeight.bold,
          ));
    }

    /// Search bar
    Widget __searchBar() {
      return Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height20,
          right: Dimensions.height30,
          left: Dimensions.height30,
          bottom: Dimensions.height20,
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
                      labelText: 'Hôm nay bạn muốn tìm thuốc gì?'),
                ),
                suggestionsCallback: (String pattern) {
                  return TypeAhead2.searchName(pattern);
                },
                itemBuilder: (context, ProductName suggestion) {
                  return ListTile(
                    title: AppText(
                      text: suggestion.product_name +
                          "-" +
                          suggestion.product_code,
                      color: Colors.black54,
                      size: Dimensions.font14,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (ProductName suggestion) {
                  print("tapped");
                  BlocProvider.of<HomeScreenBloc>(context)
                    ..add(
                      OnTapEvent(
                        context: context,
                        navigateData: suggestion.product_id,
                      ),
                    );
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

    /// Build list function icon
    Widget __listFunIcon() {
      return Padding(
        padding: EdgeInsets.only(bottom: Dimensions.height10),
        child: Container(
          width: double.maxFinite,
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagesIcon.keys.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 20, top: 10, bottom: 10),
                child: Container(
                  width: 100,
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      switch (index) {
                        case 0:
                          Navigator.pushNamed(context, "/pill-identifier");
                          break;
                        case 1:
                          Navigator.pushNamed(context, "/compare-drug");
                          break;
                        case 2:
                          Navigator.pushNamed(context, "/interaction-checker");
                          break;
                        case 3:
                          Navigator.pushNamed(context, "/health-profile");
                          break;
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imagesIcon.keys.elementAt(index),
                        imagesIcon.values.elementAt(index),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    /// Build carouse slider
    Widget __carouseSlider() {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          child: CarouselSlider.builder(
            itemCount: imgList.length,
            options: CarouselOptions(
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayCurve: Curves.linearToEaseOut,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Container(
                    // margin: EdgeInsets.only(right: 20, top: 10),
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(imagesFav + imgList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ) ??
                  __loadingPoShimmer();
            },
          ),
        ),
      );
    }

    /// Build body
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const NavigationDrawerWidget(),
        appBar: appBarMain(titleText: "Trang chủ"),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // Search bar
              __searchBar(),
              // List function
              __listFunIcon(),

              // List popular product
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  __title(),
                  __carouseSlider(),
                ],
              ),
            ],
          ),
        ),
      ),
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: AppText(text: "Thoát"),
                content: AppText(text: "Bạn muốn thoát ứng dụng?"),
                actions: <Widget>[
                  FlatButton(
                    child: AppText(text: "Thoát", color: Palette.warningColor),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  FlatButton(
                    child: AppText(
                      text: "Huỷ",
                      color: Palette.grey,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
    );
  }
}
