import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/fav_drug_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product.dart';
import 'package:translator/translator.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/widgets/rich_text_cus.dart';

class DrugDetails extends StatefulWidget {
  final ProductDB drugData;

  DrugDetails({
    Key key,
    this.drugData,
  }) : super(key: key);

  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  var _box = Hive.box<FavDrugModel>("fav-list");
  String imagesFav = "16571-0402-50_NLMIMAGE10_903AC856.jpg";
  String article =
      "Nghiên cứu mới của Harvard Business School chỉ ra rằng chế độ làm việc hybrid lý tưởng là khi người lao động chỉ cần đến văn phòng từ 1 đến 2 ngày. Điều này giúp nhân viên có được sự linh hoạt và cân bằng giữa công việc-cuộc sống cá nhân, nhưng đồng thời cũng không làm họ cảm thấy tách biệt với đồng nghiệp.Điểm sáng của nghiên cứu này ở chỗ, họ đã dựa trên kết quả công việc của nhân viên thay vì chỉ kết luận dựa trên sở thích làm việc cá nhân. Trong cuộc thử nghiệm này, những người chỉ dành 1-2 ngày đến công ty có hiệu suất làm việc tốt nhất.Tuy nhiên, theo như Giáo sư Nick Bloom của Đại học Stanford, đồng tác giả của nghiên cứu, thì vẫn chưa có sự thống nhất giữa số ngày ở nhà và ngày đi làm giữa nhân viên và sếp. Vậy nên, mô hình này hoạt động tốt nhất khi nhân viên cùng đi làm vào một ngày nhất định trong tuần.Theo Bloomberg, từ góc nhìn của những người quản lý, họ nhận thấy các nhân viên thường xuyên làm việc ở nhà gặp nhiều bất lợi hơn so với nhân viên ở công ty. Họ cũng cảm thấy khó tin tưởng những nhân viên mà mình không gặp và cảm thấy không thể hỗ trợ nhân viên được nhiều như khi được làm việc trực tiếp.";
  String articalTranslated = "";

  _translated(String data) {
    var translator = GoogleTranslator();
    translator.translate(data, from: 'vi', to: 'en').then((value) {
      articalTranslated = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var info = widget.drugData;
    _translated(info.productdosage);
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
                text: widget.drugData.productName,
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
                RichTextCus(text1: "Bào chế:", text2: info.approved),
                RichTextCus(text1: "Đóng gói", text2: info.productLabeller),
                RichTextCus(text1: "Phân loại:", text2: info.productRoute),
                RichTextCus(text1: "Hoạt chất:", text2: info.productName),
                RichTextCus(text1: "Địa chỉ sx:", text2: info.productName),
                RichTextCus(text1: "Địa chỉ đk:", text2: info.productName),
                RichTextCus(text1: "Tà dược:", text2: info.productName),
                RichTextCus(text1: "Nước sx:", text2: info.productName),
                RichTextCus(text1: "Đợt phê duyệt:", text2: info.otc),
                AppText(
                    text: "Hình ảnh cho thuốc " + info.productName,
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
                ExpandablePanel(
                  header: AppTextTitle(
                      text:
                          "Xem thêm về thành phần của ${widget.drugData.productName}",
                      color: Palette.mainBlueTheme,
                      size: Dimensions.font18,
                      fontWeight: FontWeight.normal),
                  collapsed: Text(
                    article,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    article,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: Dimensions.height45,
          ),
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
                  FavDrugModel data = FavDrugModel(
                    productName: info.productName,
                    approved: info.approved,
                    country: info.country,
                    drugbankID: info.drugbankID,
                    generic: info.generic,
                    otc: info.otc,
                    productCode: info.productCode,
                    productID: info.productID,
                    productLabeller: info.productLabeller,
                    productRoute: info.productRoute,
                    productStrength: info.productStrength,
                    productdosage: info.productdosage,
                  );
                  _box.add(data);
                  Fluttertoast.showToast(
                    msg: 'Lưu thành công',
                    backgroundColor: Palette.activeButton,
                  );
                },
                icon: Icon(
                  CupertinoIcons.heart,
                  color: Palette.redTheme,
                  size: Dimensions.icon24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.share,
                  size: Dimensions.icon24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
