import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../widgets/app_text.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';

class DrugRecommendation extends StatefulWidget {
  const DrugRecommendation({Key key}) : super(key: key);

  @override
  State<DrugRecommendation> createState() => _DrugRecommendationState();
}

class _DrugRecommendationState extends State<DrugRecommendation> {
  // Loading Shimmer Recommended
  String imagesFav = "assets/images/drugs_pill/300.jpg";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Gợi ý thuốc',
            style: MobileTextTheme().appBarStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // bloc.add(
                    //   OnTapEvent(
                    //     context: context,
                    //     product: dataRe[index],
                    //   ),
                    // );
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
                              topLeft: Radius.circular(Dimensions.radius20),
                              bottomLeft: Radius.circular(Dimensions.radius20),
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
                                topRight: Radius.circular(Dimensions.radius20),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text: "Thuốc nhức đầu",
                                    color: Palette.textNo,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  AppText(
                                    text: "Trị nhức đầu",
                                    color: Palette.textNo,
                                    size: Dimensions.font16,
                                    fontWeight: FontWeight.normal,
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
            ],
          ),
        ),
      );
}
