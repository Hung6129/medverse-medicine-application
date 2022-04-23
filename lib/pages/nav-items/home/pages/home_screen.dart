import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/pages/nav-items/home/bloc/home_screen_bloc.dart';
import '../../../../services/service_data.dart';
import '/widgets/header.dart';
import '../../../../widgets/typeahead/typeahead_search_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '/widgets/list_function.dart';
import '/widgets/app_text_title.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedDrug;
// Example images
  String imagesFav = "assets/images/drugs_pill/300.jpg";

// Loading Shimmer Popular
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

// Loading Shimmer Recommended
  Widget __loadingReShimmer() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10,
        ),
        child: Row(
          children: [
            //images section
            Container(
              width: Dimensions.itemsSizeImgHeight - 30,
              height: Dimensions.itemsSizeImgHeight - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
              ),
              child: Shimmer(
                  child: Container(
                color: Palette.grey300,
              )),
            ),

            //text container
            Expanded(
              child: Container(
                height: Dimensions.height45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                  ),
                  child: Shimmer(
                      child: Container(
                    color: Palette.grey300,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// TypeAhead Bar
  Widget __getTypeAhead() {
    return Form(
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
                      print(_typeAheadController.text);
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
              return TypeHead.getTypeAhead(pattern);
            },
            itemBuilder: (context, Map<String, dynamic> suggestion) {
              return ListTile(
                title: AppTextTitle(
                    text: suggestion["productName"],
                    color: Colors.black54,
                    size: Dimensions.font18,
                    fontWeight: FontWeight.normal),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (Map<String, dynamic> suggestion) {
              _typeAheadController.text = suggestion["productName"];
              print(_typeAheadController.text);
              // BlocProvider.of<HomeScreenBloc>(context)
              //   ..add(
              //     OnTapEvent(
              //       context: context,
              //       product: suggestion as ProductModel,
              //     ),
              //   );
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Hãy chọn nhập và chọn một tên thuốc bất kì';
              }
            },
            onSaved: (value) {
              this._selectedDrug = value;
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc()..add(LoadingEvent()),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<HomeScreenBloc>(context);
          var dataRe = bloc.drugReTop10;
          var dataPo = bloc.drugPoTop10;
          return Scaffold(
            drawer: const NavigationDrawerWidget(),
            appBar: appBarMain(titleText: "Trang chủ"),
            body: RefreshIndicator(
              onRefresh: () async {
                bloc.add(RefeshingEvent());
              },
              child: SingleChildScrollView(
                child: Column(children: [
                  // Search bar
                  Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        right: Dimensions.height30,
                        left: Dimensions.height30,
                        bottom: Dimensions.height20,
                      ),
                      child: __getTypeAhead()),
                  // List function
                  ListIconFunction(),

                  // List popular product
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: AppText(
                          text: "Xu hướng tìm kiếm",
                          size: Dimensions.font20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      state is LoadingSucessState
                          ? Container(
                              padding: EdgeInsets.only(left: 20),
                              height: Dimensions.pageView,
                              width: double.maxFinite,
                              child: ListView.builder(
                                itemCount: dataPo.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      bloc.add(
                                        OnTapEvent(
                                          context: context,
                                          product: dataPo[index],
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 20, top: 10),
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(imagesFav),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : __loadingPoShimmer()
                    ],
                  ),

                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  // List recommended product
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          child: AppText(
                            text: "Đề xuất cho bạn",
                            size: Dimensions.font20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      state is LoadingSucessState
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: dataRe.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  bloc.add(
                                    OnTapEvent(
                                      context: context,
                                      product: dataRe[index],
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: Dimensions.height10,
                                    left: Dimensions.width20,
                                    right: Dimensions.width20,
                                    bottom: Dimensions.height10,
                                  ),
                                  child: Row(
                                    children: [
                                      //Images section
                                      Container(
                                        width: Dimensions.itemsSizeImgHeight,
                                        height: Dimensions.itemsSizeImgHeight,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                Dimensions.radius20),
                                            bottomLeft: Radius.circular(
                                                Dimensions.radius20),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(imagesFav),
                                          ),
                                        ),
                                      ),

                                      //Text container
                                      Expanded(
                                        child: Container(
                                          height: Dimensions.itemsSizeImgHeight,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                  Dimensions.radius20),
                                              bottomRight: Radius.circular(
                                                  Dimensions.radius20),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: Dimensions.width10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppTextTitle(
                                                  text:
                                                      dataRe[index].productName,
                                                  color: Palette.textNo,
                                                  size: Dimensions.font20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                                AppText(
                                                  text: dataRe[index]
                                                      .productLabeller,
                                                  color: Palette.textNo,
                                                  size: Dimensions.font16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : __loadingReShimmer()
                    ],
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
