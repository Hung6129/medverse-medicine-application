import 'package:flutter/cupertino.dart';

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
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    /*Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>
                              DetailsScreen(hotel: hotelscreen,),));*/
                  },
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 8.0)
                      ],
                    ),
                    child: Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage(
                                    assetImage +
                                        snapshot.data[index].pill_file_name,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data[index].pill_overview,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Imprint: ' + snapshot.data[index].pill_imprints,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Màu sắc: ' + snapshot.data[index].pill_colors,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Hình dạng: ' + snapshot.data[index].pill_shape,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Kích cỡ: ' + snapshot.data[index].pill_size,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
      },
    );
  }
}
