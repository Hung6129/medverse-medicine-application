import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/check_interaction_model.dart';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import '../../../../utils/constants.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import '../../../../theme/palette.dart';
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
  Future<CheckInteractionModel> data;
  Future<CheckInteractionModel> fetchDetailInteraction() async {
    final response = await http.get(Uri.parse(Constants.BASE_URL +
        Constants.INTERACTION_CHECKER +
        "firstID=${widget.id1}&secondID=${widget.id2}"));
    if (response.statusCode == 200) {
      print(response.body);
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
      padding: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.height20,
          right: Dimensions.height20),
      child: AppText(
        text: "Tương kỵ của thuốc $data1 và $data2 ",
        size: Dimensions.font18,
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
                AppText(
                  text: "Đang tải dữ liệu",
                  color: Palette.mainBlueTheme,
                )
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
                  __get2ProductName(widget.name1, widget.name2),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        left: Dimensions.height20,
                        right: Dimensions.height20),
                    child: AppText(text: infor.interactionDescription),
                  )
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
        title: Text(
          'Kết quả tương kỵ',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: __getInteractionDetail(),
    );
  }
}
