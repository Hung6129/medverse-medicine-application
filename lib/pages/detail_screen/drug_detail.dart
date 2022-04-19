import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import '../../models/drug_bank_db/fav_drug_model.dart';
import '../../models/drug_bank_db/product_model.dart';
import '../../theme/palette.dart';
import '../../widgets/app_text_title.dart';
import '../../widgets/dimension.dart';
import '../../widgets/rich_text_cus.dart';
import 'package:translator/translator.dart';

class DrugDetails extends StatefulWidget {
  final ProductModel drugData;
  DrugDetails({
    Key key,
    this.drugData,
  }) : super(key: key);

  @override
  _DrugDetailsState createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  var _box = Hive.box<FavDrugModel>("fav-list");

  String imagesFav = "assets/images/drugs_pill/300.jpg";
  String article =
      "New research from Harvard Business School shows that the ideal hybrid working mode is when workers only need to go to the office for 1 to 2 days. This helps employees have flexibility and work-life balance, but at the same time does not make them feel separate from their colleagues. The highlight of this study is that they are based on employee performance rather than just drawing conclusions based on personal work preferences. In this test, people who only spent 1-2 days at work performed the best. However, according to Stanford University professor Nick Bloom, co-author of the study, there is not yet. the consistency between the number of days at home and the day at work between employees and bosses. So, this model works best when employees go to work together on a certain day of the week. According to Bloomberg, from the perspective of managers, they find that employees who often work from home have a lot of problems. more disadvantageous than employees in the company. They also find it hard to trust employees they don't meet and feel unable to support them as much as they can when working face-to-face.";
  // String output;
  // _translator(String data) {
  //   final translator = GoogleTranslator();
  //   var result = translator.translate(data, from: "en", to: "vi");
  //   print(result.toString());
  //   return result.toString();
  // }

  @override
  Widget build(BuildContext context) {
    var info = widget.drugData;
    // _translator(info.approved);
    // _translator(info.productName);
    // _translator(info.productStrength);
    // _translator(info.productdosage);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height60,
            // title: Icon(CupertinoIcons.arrow_left_circle_fill),
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(20),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(Dimensions.radius20),
            //         topRight: Radius.circular(Dimensions.radius20),
            //       ),
            //     ),
            //     padding: EdgeInsets.all(Dimensions.height20),
            //     child: Center(
            //       child: AppTextTitle(
            //         text: info.productName,
            //         color: Palette.textNo,
            //         size: Dimensions.font24,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //     width: double.maxFinite,
            //   ),
            // ),
            pinned: true,
            backgroundColor: Palette.mainBlueTheme,
            expandedHeight: Dimensions.imagesViewHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                imagesFav,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextCus(
                    text1: "Bào chế:",
                    text2: "",
                  ),
                  RichTextCus(text1: "Đóng gói", text2: info.productLabeller),
                  RichTextCus(text1: "Phân loại:", text2: info.productRoute),
                  RichTextCus(text1: "Hoạt chất:", text2: info.productdosage),
                  RichTextCus(
                      text1: "Địa chỉ sx:", text2: info.productStrength),
                  RichTextCus(text1: "Đợt phê duyệt:", text2: info.otc),
                  RichTextCus(text1: "Đợt phê duyệt:", text2: article),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 0.5, color: Palette.textNo.withOpacity(0.3)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  size: Dimensions.icon28,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("tapped x2");
                },
                icon: Icon(
                  CupertinoIcons.share,
                  size: Dimensions.icon28,
                  color: Palette.mainBlueTheme,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("tapped x3");
                },
                icon: Icon(
                  CupertinoIcons.exclamationmark_bubble_fill,
                  size: Dimensions.icon28,
                  color: Palette.starRating,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
