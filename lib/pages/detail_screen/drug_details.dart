import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '/models/test/saved_drug_list_model.dart';
import '/models/test/drugs_product_test.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/widgets/rich_text_cus.dart';

class DrugDetails extends StatefulWidget {
  final drugProductTest drugData;

  DrugDetails({
    Key key,
    this.drugData,
  }) : super(key: key);

  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  var _box = Hive.box<SavedDrugListModel>("savedList");

  String imagesFav = "16571-0402-50_NLMIMAGE10_903AC856.jpg";

  void onFavoritePress(int index, SavedDrugListModel data) {
    if (_box.containsKey(index)) {
      _box.delete(index);
      return;
    }
    _box.put(index, data);
  }

  Widget getIcon(int index) {
    if (_box.containsKey(index)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  @override
  Widget build(BuildContext context) {
    var info = widget.drugData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Trang chi tiết thuốc',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                SavedDrugListModel data =
                    SavedDrugListModel(id: info.id, tenThuoc: info.tenThuoc);
                // onFavoritePress(data.id, data);
                _box.add(data);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: AppText(
                      text: "Luu thanh cong",
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                  backgroundColor: Palette.mainBlueTheme,
                ));
              },
              icon: Icon(
                Icons.favorite,
                color: Palette.red,
              )),
          // details drug title
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
                top: Dimensions.height10,
                left: Dimensions.width10,
                right: Dimensions.width10),
            alignment: Alignment.center,
            child: AppText(
                text: widget.drugData.tenThuoc.toString(),
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
                RichTextCus(text1: "Bào chế:", text2: info.baoChe.toString()),
                RichTextCus(text1: "Đóng gói", text2: info.dongGoi.toString()),
                RichTextCus(
                    text1: "Phân loại:", text2: info.phanLoai.toString()),
                RichTextCus(
                    text1: "Hoạt chất:", text2: info.hoatChat.toString()),
                RichTextCus(
                    text1: "Địa chỉ sx:", text2: info.diaChiSx.toString()),
                RichTextCus(
                    text1: "Địa chỉ đk:", text2: info.diaChiDk.toString()),
                RichTextCus(text1: "Tà dược:", text2: info.taDuoc.toString()),
                RichTextCus(text1: "Nước sx:", text2: info.nuocSx.toString()),
                RichTextCus(
                    text1: "Đợt phê duyệt:",
                    text2: info.dotPheDuyet.toString()),
                AppText(
                    text: "Hình ảnh cho thuốc " + info.tenThuoc.toString(),
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
                          image: AssetImage(
                              "assets/images/drugs_pill/" + imagesFav),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/drugs_pill/" + imagesFav),
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
                          image: AssetImage(
                              "assets/images/drugs_pill/" + imagesFav),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/drugs_pill/" + imagesFav),
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
                        "Xem thêm về thành phần của ${widget.drugData.tenThuoc}",
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