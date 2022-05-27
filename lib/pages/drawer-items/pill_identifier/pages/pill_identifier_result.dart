import 'package:medverse_mobile_app/models/drug_bank_db/pill_identifiter_model.dart';

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
  ///
  String assetImage = "assets/image/300_imagesrxnav/";

  ///
  List<PillIdentifierModel> dataList;

  ///
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
    /// Title
    Widget __title() {
      return Container(
        padding: EdgeInsets.all(Dimensions.height15),
        child: AppText(
            color: Palette.textNo,
            size: Dimensions.font20,
            fontWeight: FontWeight.normal,
            text:
                "Kết quả ${widget.query1} ${widget.query2} ${widget.query3} ${widget.query4}"),
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
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        //images section
                        Container(
                          width: Dimensions.pillIdentifierW,
                          height: Dimensions.pillIdentifierH,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              // fit: BoxFit.cover,
                              image: AssetImage(assetImage +
                                  snapshot.data[index].pill_file_name),
                            ),
                          ),
                        ),

                        // Text container
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.only(
                              //   topRight: Radius.circular(Dimensions.radius20),
                              //   bottomRight: Radius.circular(Dimensions.radius20),
                              // ),
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: snapshot.data[index].pill_overview,
                                color: Palette.textNo,
                                size: Dimensions.font18,
                                fontWeight: FontWeight.normal,
                              ),
                              AppText(
                                text: snapshot.data[index].pill_imprints,
                                color: Palette.textNo,
                                size: Dimensions.font14,
                                fontWeight: FontWeight.normal,
                              ),
                              AppText(
                                text: snapshot.data[index].pill_colors,
                                color: Palette.textNo,
                                size: Dimensions.font14,
                                fontWeight: FontWeight.normal,
                              ),
                              AppText(
                                text: snapshot.data[index].pill_size,
                                color: Palette.textNo,
                                size: Dimensions.font14,
                                fontWeight: FontWeight.normal,
                              ),
                              AppText(
                                text: snapshot.data[index].pill_shape,
                                color: Palette.textNo,
                                size: Dimensions.font16,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height15)
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
          children: [__title(), __listData()],
        ),
      ),
    );
  }
}
