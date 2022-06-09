import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '/models/drug_bank_db/pill_identifiter_model.dart';
import '/widgets/indicators.dart';
import '../../../../services/service_data.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';

class PillIdentifierListResult extends StatefulWidget {
  final String query1;
  final String query2;
  final String query3;
  final String query4;
  final String query5;

  const PillIdentifierListResult({
    Key key,
    this.query1,
    this.query2,
    this.query3,
    this.query4,
    this.query5,
  }) : super(key: key);

  @override
  State<PillIdentifierListResult> createState() =>
      _PillIdentifierListResultState();
}

class _PillIdentifierListResultState extends State<PillIdentifierListResult> {
  /// link to asset
  String assetImage = "assets/image/300_imagesrxnav/";

  /// set list
  List<PillIdentifierModel> dataList;

  /// get list
  Future<List<PillIdentifierModel>> _getAll() async {
    dataList = await PillIdentifierResult().getDrugByIdentifier(
      widget.query1,
      widget.query2,
      widget.query3,
      widget.query4,
    );
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Tìm kiếm nâng cao',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            __title(),
            __listData(),
          ],
        ),
      ),
    );
  }

  /// Title
  Widget __title() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(Dimensions.height10),
        child: AppText(
            color: Palette.textNo,
            size: Dimensions.font18,
            fontWeight: FontWeight.normal,
            text:
                "Kết quả ${widget.query1} ${widget.query2} ${widget.query3} ${widget.query4}"),
      ),
    );
  }

  /// Queried list data
  Widget __listData() {
    return FutureBuilder<List<PillIdentifierModel>>(
      future: _getAll(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var data = snapshot.data[index];
              return Container(
                height: Dimensions.height30 * 6,
                margin: EdgeInsets.only(
                  // top: Dimensions.height10,
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                  bottom: Dimensions.height10,
                ),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 15,
                    lightSource: LightSource.top,
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: Dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage(assetImage + data.pill_file_name),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppText(
                                text: data.pill_colors,
                                size: Dimensions.font14,
                              ),
                              AppText(
                                text: data.pill_imprints,
                                size: Dimensions.font14,
                              ),
                              AppText(
                                text: data.pill_shape,
                                size: Dimensions.font14,
                              ),
                              AppText(
                                text: data.pill_size,
                                size: Dimensions.font14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        if (snapshot.hasError) {
          return AppText(
            text: "Có lỗi gì đó đã xảy ra",
          );
        } else {
          return circularProgress(context);
        }
      },
    );
  }
}
