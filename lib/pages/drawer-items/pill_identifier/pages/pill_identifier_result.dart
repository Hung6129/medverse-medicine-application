import '../../../../widgets/app_text_title.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';

class PillIdentifierListResult extends StatefulWidget {
  final String query1;
  final String query2;
  final String query3;
  final String query4;
  final String query5;

  const PillIdentifierListResult({
    Key key,
    this.query1,
    this.query2,
    this.query3,
    this.query4,
    this.query5,
  }) : super(key: key);

  @override
  State<PillIdentifierListResult> createState() =>
      _PillIdentifierListResultState();
}

class _PillIdentifierListResultState extends State<PillIdentifierListResult> {
  String img300 = "assets/images/drugs_pill/300.jpg";
  String img600 = "assets/images/drugs_pill/600.jpg";
  var data = {
    "Nabumetone": "assets/images/drugs_pill/002282029.jpg",
    "NAC": "assets/images/drugs_pill/005550972.jpg",
    "Nadolol": "assets/images/drugs_pill/005550973.jpg",
    "Naloxone": "assets/images/drugs_pill/493480042.jpg",
    "Naltrexone": "assets/images/drugs_pill/521520215.jpg",
    "Namenda": "assets/images/drugs_pill/634810629.jpg",
    "Naprosyn": "assets/images/drugs_pill/646790936_PB.jpg",
    "Naproxen": "assets/images/drugs_pill/646790937_PB.jpg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Tìm kiếm nâng cao',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Intro
            Container(
              padding: EdgeInsets.all(Dimensions.height15),
              child: AppText(
                  color: Palette.textNo,
                  size: Dimensions.font20,
                  fontWeight: FontWeight.normal,
                  text:
                      "Kết quả ${widget.query1} ${widget.query2} ${widget.query3} ${widget.query4} ${widget.query5}"),
            ),

            // List of sorted
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      //images section
                      Container(
                        width: Dimensions.pillIdentifierW,
                        height: Dimensions.pillIdentifierH,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                          color: Palette.p1,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(data.values.elementAt(index)),
                          ),
                        ),
                      ),

                      // Text container
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(
                          //   topRight: Radius.circular(Dimensions.radius20),
                          //   bottomRight: Radius.circular(Dimensions.radius20),
                          // ),
                          color: Palette.grey300,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextTitle(
                              text: data.keys.elementAt(index),
                              color: Palette.textNo,
                              size: Dimensions.font20,
                              fontWeight: FontWeight.normal,
                            ),
                            AppText(
                              text: data.keys.elementAt(index),
                              color: Palette.textNo,
                              size: Dimensions.font16,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height15)
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
}
