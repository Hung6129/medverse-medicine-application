import 'package:flutter/material.dart';

import 'package:medverse_mobile_app/widgets/header.dart';
import '/models/test/saved_drug_list_model.dart';
import '/theme/palette.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/widgets/rich_text_cus.dart';

class DrugDetailSaved extends StatelessWidget {
  final SavedDrugListModel drugData;

  // var _box = Hive.box<SavedDrugListModel>("savedList");

  DrugDetailSaved({
    Key key,
    this.drugData,
  }) : super(key: key);

  String imagesFav = "assets/images/drugs_pill/300.jpg";

  @override
  Widget build(BuildContext context) {
    var info = drugData;
    return Scaffold(
      appBar: appBarMain(titleText: ""),
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
            child: AppTextTitle(
                text: drugData.tenThuoc.toString(),
                color: Palette.mainBlueTheme,
                size: Dimensions.font34,
                fontWeight: FontWeight.w500),
          ),

          // drug information
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTextCus(text1: "ID:", text2: info.id.toString()),
                // RichTextCus(text1: "Đóng gói", text2: info.dongGoi.toString()),
                // RichTextCus(
                //     text1: "Phân loại:", text2: info.phanLoai.toString()),
                // RichTextCus(
                //     text1: "Hoạt chất:", text2: info.hoatChat.toString()),
                // RichTextCus(
                //     text1: "Địa chỉ sx:", text2: info.diaChiSx.toString()),
                // RichTextCus(
                //     text1: "Địa chỉ đk:", text2: info.diaChiDk.toString()),
                // RichTextCus(text1: "Tà dược:", text2: info.taDuoc.toString()),
                // RichTextCus(text1: "Nước sx:", text2: info.nuocSx.toString()),
                // RichTextCus(
                //     text1: "Đợt phê duyệt:",
                //     text2: info.dotPheDuyet.toString()),
                // AppText(
                //     text: "Hình ảnh cho thuốc " + info.tenThuoc.toString(),
                //     color: Palette.mainBlueTheme,
                //     fontWeight: FontWeight.normal,
                //     size: Dimensions.font18),
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
                    text: "Xem thêm về thành phần của ${drugData.tenThuoc}",
                    color: Palette.mainBlueTheme,
                    size: Dimensions.font18,
                    fontWeight: FontWeight.normal)
              ],
            ),
          )
        ],
      )),
    );
  }
}
