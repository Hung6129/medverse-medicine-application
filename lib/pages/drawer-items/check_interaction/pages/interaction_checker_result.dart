import 'dart:convert';
import 'package:flutter/material.dart';
import '/models/drug_bank_db/check_interaction_model.dart';
import '/utils/app_text_theme.dart';
import '/widgets/indicators.dart';
import '/utils/constants.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';
import 'package:http/http.dart' as http;

class InteractionCheckerResult extends StatefulWidget {
  final String id1;
  final String id2;
  final String name1;
  final String name2;

  InteractionCheckerResult({
    Key key,
    this.id1,
    this.id2,
    this.name1,
    this.name2,
  }) : super(key: key);

  @override
  State<InteractionCheckerResult> createState() =>
      _InteractionCheckerResultState();
}

class _InteractionCheckerResultState extends State<InteractionCheckerResult> {
  String txt1 = 'Miễn trừ trách nhiệm: ';
  String txt2 =
      'Thông tin được cung cấp trong ứng dụng Nhận dạng Thuốc và Tìm kiếm Thuốc chỉ dành cho mục đích giáo dục chứ không phải để điều trị hoặc chẩn đoán bất kỳ tình trạng sức khỏe nào.';
  String txt3 =
      'Nhà xuất bản, tác giả hoặc bất kỳ nhà cung cấp dữ liệu bên thứ ba nào được liên kết với ứng dụng này không có bất kỳ trách nhiệm nào đối với việc sử dụng thông tin được cung cấp trong ứng dụng này. Không có đảm bảo nào được đưa ra về tính hiệu quả, hiệu suất hoặc độ chính xác của thông tin được cung cấp trong ứng dụng hoặc bởi bất kỳ nguồn dữ liệu bên thứ ba nào.';

  Future<CheckInteractionModel> data;

  Future<CheckInteractionModel> fetchDetailInteraction() async {
    final response = await http.get(Uri.parse(Constants.BASE_URL +
        Constants.INTERACTION_CHECKER +
        "firstID=${widget.id1}&secondID=${widget.id2}"));
    if (response.statusCode == 200) {
      // print(response.body);
      return CheckInteractionModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    data = fetchDetailInteraction();
  }

  /// Products need to check
  Widget __get2ProductName(String data1, String data2) {
    return Container(
      child: AppText(
        text: "$data1 + $data2 ",
        size: Dimensions.font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget __getInteractionDetail() {
      return FutureBuilder(
        future: data,
        builder: (context, AsyncSnapshot<CheckInteractionModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset("assets/images/loading.png"),
                circularProgress(context),
              ],
            ));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Nodata-cuate.png"),
                  AppText(
                    text: "Không tìm thấy kết quả",
                    color: Palette.warningColor,
                    fontWeight: FontWeight.bold,
                  )
                ],
              );
            } else if (snapshot.hasData) {
              var infor = snapshot.data;
              return Column(
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/icons/ResultFoundIcon.png',
                    width: 100,
                  ),
                  Text(
                    'Tương kỵ tìm thấy',
                    style: MobileTextTheme().interactionResult,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                    decoration: BoxDecoration(
                      color: Palette.whiteText,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      boxShadow: [
                        BoxShadow(
                          color: Palette.blueGrey,
                          offset: const Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 3.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            __get2ProductName(widget.name1, widget.name2),
                            SizedBox(height: 10.0),
                            AppText(
                              size: 15.0,
                              text: infor.interactionDescription,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        txt1,
                        style: MobileTextTheme().introContentFont,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        txt2,
                        style: MobileTextTheme().introContentFont,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        txt3,
                        style: MobileTextTheme().introContentFont,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                ],
              );
            }
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/error_image.png"),
              AppText(
                text: "Đã có lỗi gì đó xảy ra",
                color: Palette.warningColor,
              )
            ],
          ));
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: AppText(
          text: 'Kiểm tra tương kỵ',
          size: Dimensions.font20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: __getInteractionDetail(),
    );
  }
}
