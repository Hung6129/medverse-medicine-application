import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/fav_drug_model.dart';

import 'package:medverse_mobile_app/widgets/header.dart';
import '../../widgets/app_text.dart';
import '/theme/palette.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/widgets/rich_text_cus.dart';

class FavDrugDetail extends StatelessWidget {
  final FavDrugModel drugData;

  var _box = Hive.box<FavDrugModel>("fav-list");

  FavDrugDetail({
    Key key,
    this.drugData,
  }) : super(key: key);

  String imagesFav = "assets/images/drugs_pill/300.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            '',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // details drug title
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  left: Dimensions.width10,
                  right: Dimensions.width10),
              alignment: Alignment.center,
              child: AppText(
                  text: drugData.productName,
                  color: Palette.mainBlueTheme,
                  size: Dimensions.font32,
                  fontWeight: FontWeight.w500),
            ),
            // drug information
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  left: Dimensions.width10,
                  top: Dimensions.height10,
                  right: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextCus(text1: "Bào chế:", text2: drugData.approved),
                  RichTextCus(
                      text1: "Đóng gói", text2: drugData.productLabeller),
                  RichTextCus(
                      text1: "Phân loại:", text2: drugData.productRoute),
                  RichTextCus(
                      text1: "Hoạt chất:", text2: drugData.productStrength),
                  RichTextCus(text1: "Địa chỉ sx:", text2: drugData.drugbankID),
                  RichTextCus(
                      text1: "Địa chỉ đk:", text2: drugData.productName),
                  RichTextCus(text1: "Tà dược:", text2: drugData.productName),
                  RichTextCus(text1: "Nước sx:", text2: drugData.productName),
                  RichTextCus(text1: "Đợt phê duyệt:", text2: drugData.otc),
                  AppText(
                      text: "Hình ảnh cho thuốc " + drugData.productName,
                      color: Palette.mainBlueTheme,
                      fontWeight: FontWeight.normal,
                      size: Dimensions.font18),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imagesFav),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imagesFav),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imagesFav),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imagesFav),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  AppTextTitle(
                      text:
                          "Xem thêm về thành phần của ${drugData.productName}",
                      color: Palette.mainBlueTheme,
                      size: Dimensions.font18,
                      fontWeight: FontWeight.normal)
                ],
              ),
            )
          ],
        )),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 0.5, color: Palette.textNo.withOpacity(0.3)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: 'Xoá thành công',
                      backgroundColor: Palette.redTheme,
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.delete_solid,
                    color: Palette.redTheme,
                    size: Dimensions.icon24,
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     CupertinoIcons.share,
                //     size: Dimensions.icon24,
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
