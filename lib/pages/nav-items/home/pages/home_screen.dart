import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/widgets/appbar.dart';
import 'package:medverse_mobile_app/widgets/header.dart';
import 'package:medverse_mobile_app/widgets/typeahead_search_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../widgets/list_function.dart';
import '../../../detail_screen/drug_details.dart';
import '/controller/cubit/drugs_data/drugs_data_cubit.dart';
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
  Future<void> _refreshData(DrugsDataCubit cubit) async {
    try {
      await cubit.getRecommendedDrugs(isRefresh: true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  String imagesFav = "assets/images/drugs_pill/300.jpg";

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DrugsDataCubit>(context).getRecommendedDrugs();
    final cubit = BlocProvider.of<DrugsDataCubit>(context);
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: appBarMain(titleText: "Trang chủ"),
      body: RefreshIndicator(
        backgroundColor: Palette.p1,
        onRefresh: () {
          return _refreshData(cubit);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // search bar
              TypeAheadSearchBar(),

              // list function
              ListIconFunction(),

              // recommended title
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: AppText(
                  text: "Đề xuất cho bạn",
                  size: Dimensions.font16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),

              // list recommended drugs
              BlocBuilder<DrugsDataCubit, DrugsDataState>(
                builder: (context, state) {
                  if (state is DrugsDataLoaded) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.drugs.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrugDetails(drugData: cubit.drugs[index])),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10,
                          ),
                          child: Row(
                            children: [
                              //images section
                              Container(
                                width: Dimensions.itemsSizeImgHeight,
                                height: Dimensions.itemsSizeImgHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.radius20),
                                    bottomLeft:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(imagesFav),
                                  ),
                                ),
                              ),

                              //text container
                              Expanded(
                                child: Container(
                                  height: Dimensions.itemsSizeImgHeight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
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
                                          text: cubit.drugs[index].tenThuoc,
                                          color: Palette.textNo,
                                          size: Dimensions.font20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        AppText(
                                          text: cubit.drugs[index].baoChe,
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
                    );
                  } else if (state is DrugsDataLoading) {
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
                                color: Palette.blueGrey,
                              )),
                            ),

                            //text container
                            Expanded(
                              child: Container(
                                height: Dimensions.itemsSizeTextIconHeight - 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                  ),
                                  child: Shimmer(
                                      child: Container(
                                    color: Palette.blueGrey,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return AppTextTitle(
                        text: "Something went wrong",
                        color: Colors.black45,
                        size: Dimensions.font18,
                        fontWeight: FontWeight.w500);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
