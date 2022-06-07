import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import '../../../../widgets/app_text.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';

class DrugRecommendation extends StatefulWidget {
  const DrugRecommendation({Key key}) : super(key: key);

  @override
  State<DrugRecommendation> createState() => _DrugRecommendationState();
}

class _DrugRecommendationState extends State<DrugRecommendation> {
  List<String> data;
  Future<List<String>> __getAllData() async {
    data = SaveHistorySearch.getProductName();
    print(data.length);
    return data;
  }

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
      body: Container()
      // FutureBuilder(
      //   future: __getAllData(),
      //   builder: (ctx, snapshot) {
      //     if (snapshot.hasData) {
      //       return SingleChildScrollView(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             ListView.builder(
      //               physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemCount: snapshot.data.length,
      //               itemBuilder: (context, index) => GestureDetector(
      //                 onTap: () {},
      //                 child: Container(
      //                   margin: EdgeInsets.only(
      //                     top: Dimensions.height10,
      //                     left: Dimensions.width20,
      //                     right: Dimensions.width20,
      //                     bottom: Dimensions.height10,
      //                   ),
      //                   child: Row(
      //                     children: [
      //                       //Images section
      //                       Container(
      //                         width: Dimensions.itemsSizeImgHeight,
      //                         height: Dimensions.itemsSizeImgHeight,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.only(
      //                             topLeft:
      //                                 Radius.circular(Dimensions.radius20),
      //                             bottomLeft:
      //                                 Radius.circular(Dimensions.radius20),
      //                           ),
      //                           image: DecorationImage(
      //                             fit: BoxFit.cover,
      //                             image: AssetImage(imagesFav),
      //                           ),
      //                         ),
      //                       ),

      //                       //Text container
      //                       Expanded(
      //                         child: Container(
      //                           height: Dimensions.itemsSizeImgHeight,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                               topRight:
      //                                   Radius.circular(Dimensions.radius20),
      //                               bottomRight:
      //                                   Radius.circular(Dimensions.radius20),
      //                             ),
      //                             color: Colors.white,
      //                           ),
      //                           child: Padding(
      //                             padding: EdgeInsets.only(
      //                               left: Dimensions.width10,
      //                             ),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.center,
      //                               children: [
      //                                 AppText(
      //                                   text: snapshot.data[index],
      //                                   color: Palette.textNo,
      //                                   size: Dimensions.font20,
      //                                   fontWeight: FontWeight.normal,
      //                                 ),
      //                                 SizedBox(
      //                                   height: Dimensions.height10,
      //                                 ),
      //                                 AppText(
      //                                   text: "Trị nhức đầu",
      //                                   color: Palette.textNo,
      //                                   size: Dimensions.font16,
      //                                   fontWeight: FontWeight.normal,
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       );
      //     } else {
      //       return circularProgress(context);
      //     }
      //   },
      // ),
      );
}
