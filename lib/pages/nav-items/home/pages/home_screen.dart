import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/pages/nav-items/home/bloc/home_screen_bloc.dart';
import '/widgets/header.dart';
import '/widgets/typeahead_search_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '/widgets/list_function.dart';
import '../../../detail_screen/drug_detail.dart';
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
                  TypeAheadSearchBar(),
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
