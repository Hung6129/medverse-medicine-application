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

  String idMaping;

  @override
  Widget build(BuildContext context) {
    /// Title
    Widget __title() {
      return Container(
        padding: EdgeInsets.all(Dimensions.height10),
        child: AppText(
            color: Palette.textNo,
            size: Dimensions.font18,
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
                  width: 200,
                  color: Palette.grey300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 280,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              assetImage + snapshot.data[index].pill_file_name,
                            ),
                          ),
                        ),
                      ),
                      AppText(
                        text: snapshot.data[index].pill_colors,
                        color: Palette.textNo,
                        size: Dimensions.font16,
                        fontWeight: FontWeight.normal,
                      ),
                      AppText(
                        text: snapshot.data[index].pill_overview,
                        color: Palette.textNo,
                        size: Dimensions.font14,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return AppText(
                text: "Có lỗi gì đó đã xảy ra",
              );
            } else {
              return circularProgress(context);
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
