import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medverse_mobile_app/models/drug_bank_db/compare_drug_model.dart';
import 'package:medverse_mobile_app/widgets/dimension.dart';
import '../../../../utils/constants.dart';
import '/widgets/indicators.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CompareResult extends StatefulWidget {
  final String query1;
  final String query2;

  const CompareResult({
    Key key,
    this.query1,
    this.query2,
  }) : super(key: key);

  @override
  State<CompareResult> createState() => _CompareResultState();
}

class _CompareResultState extends State<CompareResult> {
  /// set list
  Future<List<CompareDrugModel>> dataList;

  /// get list
  Future<List<CompareDrugModel>> fetchDetailData() async {
    final response = await http.get(Uri.parse(Constants.BASE_URL +
        Constants.DRUG_COMPARE +
        "productId1=${widget.query1}&productId2=${widget.query2}"));
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      print("35" + widget.query1 + widget.query2);
      print("36" + list.length.toString());
      print("37" + list.toString());
      return list.map((e) => CompareDrugModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    dataList = fetchDetailData();
  }

  double _height;
  double _width;

  TableRow __subTableTitle(String title) {
    return TableRow(
        decoration: BoxDecoration(color: Palette.mainBlueTheme),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: title, size: Dimensions.font18, color: Colors.white),
              ],
            ),
          ),
          Column(
            children: [],
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    Widget __getCompareDetail() {
      return FutureBuilder(
        future: dataList,
        builder: (context, AsyncSnapshot<List<CompareDrugModel>> snapshot) {
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
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(Dimensions.height10),
                  child: Table(
                    children: [
                      TableRow(
                          children: List.generate(
                        infor.length,
                        (index) => Column(
                          children: [
                            AppText(
                              text: infor[index].drugName,
                              size: Dimensions.font20,
                              color: Palette.mainBlueTheme,
                            ),
                          ],
                        ),
                      )),
                      __subTableTitle("Mô tả"),
                      TableRow(
                          children: List.generate(
                        infor.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                infor[index].drugDescription,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )),
                      __subTableTitle("Chất thuốc"),
                      TableRow(
                          children: List.generate(
                        infor.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                infor[index].drugState,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )),
                      __subTableTitle("Chỉ định"),
                      TableRow(
                          children: List.generate(
                        infor.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                infor[index].drugIndication,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )),
                      __subTableTitle("Dược lực"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugPharmaco,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      __subTableTitle("Cơ chế"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugMechan,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      __subTableTitle("Độc tính"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugToxicity,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      __subTableTitle("Chuyển hoá chất thuốc"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugMetabolism,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      __subTableTitle("Thời gian bán huỷ"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugHalflife,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      __subTableTitle("Đào thải"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugElimination,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      __subTableTitle("Độ thanh thải"),
                      TableRow(
                        children: List.generate(
                          infor.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  infor[index].drugClearance,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
          'So sánh',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: __getCompareDetail(),
    );
  }
}
