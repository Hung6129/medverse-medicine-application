import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_name_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  // String imagesFav = "assets/image/300_imagesrxnav/";

  /// Get list images
  // final List<String> imgList = [
  //   "00093-7286-89_RXNAVIMAGE10_D62FEB6F.jpg",
  //   "00093-7290-56_RXNAVIMAGE10_A73953CA.jpg",
  //   "00093-7306-06_RXNAVIMAGE10_BC42DE66.jpg",
  //   "00093-7393-98_RXNAVIMAGE10_32391918.jpg",
  //   "69097-0123-03_NLMIMAGE10_8D4EC6D6.jpg",
  //   "69238-1251-06_NLMIMAGE10_FE50FF27.jpg",
  //   "99207-0467-30_NLMIMAGE10_C11D60AB.jpg",
  //   "76439-0102-50_NLMIMAGE10_3A3D9D0C.jpg",
  // ];
  // final List<String> imgName = [
  //   'Levetiracetam 500 MG Oral Tablet',
  //   'Raloxifene Hydrochloride 60 MG Oral Tablet',
  //   'celecoxib 50 MG Oral Capsule',
  //   'Fosinopril Sodium 20 MG Oral Tablet',
  //   'topiramate 50 MG Oral Tablet',
  //   'Estradiol 1 MG / norethindrone ',
  //   '24 HR Minocycline 105 MG Extended ',
  //   'Cephalexin 500 MG Oral Capsule',
  // ];

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

  List<String> list;
  @override
  Widget build(BuildContext context) {
    /// Loading Shimmer Popular
    // Widget __loadingPoShimmer() {
    //   return Container(
    //     padding: EdgeInsets.only(left: 20),
    //     height: Dimensions.pageView,
    //     width: double.maxFinite,
    //     child: ListView.builder(
    //       itemCount: 5,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Shimmer(
    //           child: Container(
    //             margin: EdgeInsets.only(right: 20, top: 10),
    //             width: 250,
    //             decoration: BoxDecoration(
    //               color: Palette.grey300,
    //               borderRadius: BorderRadius.circular(
    //                 Dimensions.radius20,
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }

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
                  return TypeAheadByNameFast.getTypeAheadByName(pattern);
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
                  // print("tapped " + suggestion['productName']);
                  // print("tappedx2 " + suggestion['productId']);
                  BlocProvider.of<HomeScreenBloc>(context)
                    ..add(
                      OnTapEvent(
                        context: context,
                        navigateData: suggestion['productId'],
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
    // Widget __carouseSlider() {
    //   return CarouselSlider.builder(
    //     itemCount: imgList.length,
    //     options: CarouselOptions(
    //       autoPlayAnimationDuration: Duration(seconds: 3),
    //       autoPlayCurve: Curves.linearToEaseOut,
    //       aspectRatio: 16 / 10,
    //       enlargeCenterPage: true,
    //       autoPlay: true,
    //     ),
    //     itemBuilder: (ctx, index, realIdx) {
    //       return Stack(
    //             children: [
    //               Container(
    //                 height: Dimensions.pageViewContainer,
    //                 margin: EdgeInsets.only(
    //                   left: Dimensions.width10,
    //                   right: Dimensions.width10,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(Dimensions.radius30),
    //                   color: index.isEven
    //                       ? Palette.mainBlueTheme
    //                       : Palette.pastel2,
    //                   image: DecorationImage(
    //                     image: AssetImage(imagesFav + imgList[index]),
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.bottomCenter,
    //                 child: Container(
    //                   margin: EdgeInsets.only(
    //                     left: Dimensions.width30,
    //                     right: Dimensions.width30,
    //                   ),
    //                   decoration: BoxDecoration(
    //                     borderRadius:
    //                         BorderRadius.circular(Dimensions.radius20),
    //                     color: Colors.white,
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Color(0xFFe8e8e8),
    //                         blurRadius: 5.0,
    //                         offset: Offset(0, 5),
    //                       ),
    //                       BoxShadow(
    //                         color: Colors.white,
    //                         offset: Offset(-5, 0),
    //                       ),
    //                       BoxShadow(
    //                         color: Colors.white,
    //                         offset: Offset(5, 0),
    //                       ),
    //                     ],
    //                   ),
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(
    //                         top: 3, bottom: 8, left: 8, right: 8),
    //                     child: AppText(
    //                       text: imgName[index],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ) ??
    //           __loadingPoShimmer();
    //     },
    //   );
    // }

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
                // List function
                __listFunIcon(),

                // List popular product
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // __title(),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    // __carouseSlider(),
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
