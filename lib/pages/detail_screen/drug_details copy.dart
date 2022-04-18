import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/drug_bank_db/product.dart';
import '../../theme/palette.dart';
import '../../widgets/app_text_title.dart';
import '../../widgets/dimension.dart';
import '../../widgets/rich_text_cus.dart';

class DrugDetailsTest extends StatefulWidget {
  final ProductDB drugData;
  DrugDetailsTest({
    Key key,
    this.drugData,
  }) : super(key: key);

  @override
  _DrugDetailsTestState createState() => _DrugDetailsTestState();
}

class _DrugDetailsTestState extends State<DrugDetailsTest> {
  String imagesFav = "assets/images/drugs_pill/300.jpg";
  String article =
      "Nghiên cứu mới của Harvard Business School chỉ ra rằng chế độ làm việc hybrid lý tưởng là khi người lao động chỉ cần đến văn phòng từ 1 đến 2 ngày. Điều này giúp nhân viên có được sự linh hoạt và cân bằng giữa công việc-cuộc sống cá nhân, nhưng đồng thời cũng không làm họ cảm thấy tách biệt với đồng nghiệp.Điểm sáng của nghiên cứu này ở chỗ, họ đã dựa trên kết quả công việc của nhân viên thay vì chỉ kết luận dựa trên sở thích làm việc cá nhân. Trong cuộc thử nghiệm này, những người chỉ dành 1-2 ngày đến công ty có hiệu suất làm việc tốt nhất.Tuy nhiên, theo như Giáo sư Nick Bloom của Đại học Stanford, đồng tác giả của nghiên cứu, thì vẫn chưa có sự thống nhất giữa số ngày ở nhà và ngày đi làm giữa nhân viên và sếp. Vậy nên, mô hình này hoạt động tốt nhất khi nhân viên cùng đi làm vào một ngày nhất định trong tuần.Theo Bloomberg, từ góc nhìn của những người quản lý, họ nhận thấy các nhân viên thường xuyên làm việc ở nhà gặp nhiều bất lợi hơn so với nhân viên ở công ty. Họ cũng cảm thấy khó tin tưởng những nhân viên mà mình không gặp và cảm thấy không thể hỗ trợ nhân viên được nhiều như khi được làm việc trực tiếp.Nghiên cứu mới của Harvard Business School chỉ ra rằng chế độ làm việc hybrid lý tưởng là khi người lao động chỉ cần đến văn phòng từ 1 đến 2 ngày. Điều này giúp nhân viên có được sự linh hoạt và cân bằng giữa công việc-cuộc sống cá nhân, nhưng đồng thời cũng không làm họ cảm thấy tách biệt với đồng nghiệp.Điểm sáng của nghiên cứu này ở chỗ, họ đã dựa trên kết quả công việc của nhân viên thay vì chỉ kết luận dựa trên sở thích làm việc cá nhân. Trong cuộc thử nghiệm này, những người chỉ dành 1-2 ngày đến công ty có hiệu suất làm việc tốt nhất.Tuy nhiên, theo như Giáo sư Nick Bloom của Đại học Stanford, đồng tác giả của nghiên cứu, thì vẫn chưa có sự thống nhất giữa số ngày ở nhà và ngày đi làm giữa nhân viên và sếp. Vậy nên, mô hình này hoạt động tốt nhất khi nhân viên cùng đi làm vào một ngày nhất định trong tuần.Theo Bloomberg, từ góc nhìn của những người quản lý, họ nhận thấy các nhân viên thường xuyên làm việc ở nhà gặp nhiều bất lợi hơn so với nhân viên ở công ty. Họ cũng cảm thấy khó tin tưởng những nhân viên mà mình không gặp và cảm thấy không thể hỗ trợ nhân viên được nhiều như khi được làm việc trực tiếp";

  @override
  Widget build(BuildContext context) {
    var info = widget.drugData;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            // title: Icon(CupertinoIcons.arrow_left_circle_fill),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                padding: EdgeInsets.only(top: 5, bottom: Dimensions.height10),
                child: Center(
                  child: AppTextTitle(
                    text: info.productName,
                    color: Palette.textNo,
                    size: Dimensions.font24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                width: double.maxFinite,
              ),
            ),
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
                  RichTextCus(text1: "Bào chế:", text2: info.approved),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  print("tapped");
                  // FavDrugModel data = FavDrugModel(
                  //   productName: info.productName,
                  //   approved: info.approved,
                  //   country: info.country,
                  //   drugbankID: info.drugbankID,
                  //   generic: info.generic,
                  //   otc: info.otc,
                  //   productCode: info.productCode,
                  //   productID: info.productID,
                  //   productLabeller: info.productLabeller,
                  //   productRoute: info.productRoute,
                  //   productStrength: info.productStrength,
                  //   productdosage: info.productdosage,
                  // );
                  // _box.add(data);
                  // Fluttertoast.showToast(
                  //   msg: 'Lưu thành công',
                  //   backgroundColor: Palette.activeButton,
                  // );
                },
                icon: Icon(
                  CupertinoIcons.heart,
                  color: Palette.redTheme,
                  size: Dimensions.icon24,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("tapped x2");
                },
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
