import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_name_api.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import '../../../../widgets/app_text.dart';
import '/widgets/dimension.dart';
import '/theme/palette.dart';

class DrugRecommendation extends StatefulWidget {
  const DrugRecommendation({Key key}) : super(key: key);

  @override
  State<DrugRecommendation> createState() => _DrugRecommendationState();
}

class _DrugRecommendationState extends State<DrugRecommendation> {
  Future<List<ProductNameApi>> data;
  Future<List<ProductNameApi>> __getAllData() async {
    final response = await http.get(Uri.parse(Constants.BASE_URL +
        Constants.DRUG_RECOMMENDED_WITH_DRUGID +
        "DB00006"));
    if (response.statusCode == 200) {
      List list = json.decode(response.body) as List;
      return list.map((e) => ProductNameApi.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = __getAllData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: AppText(
            text: 'Gợi ý thuốc',
            size: Dimensions.font20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: data,
          builder: (ctx, AsyncSnapshot<List<ProductNameApi>> snapshot) {
            if (snapshot.hasData) {
              var listData = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listData.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.only(
                              top: Dimensions.height10,
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height10,
                            ),
                            child: AppText(
                              text: listData[index].productName,
                            )),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return circularProgress(context);
            }
          },
        ),
      );
}
