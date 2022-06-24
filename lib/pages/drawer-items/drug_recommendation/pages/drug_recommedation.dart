import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_name_api.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import '../../../../widgets/app_text.dart';
import '../../../nav-items/home/bloc/home_screen_bloc.dart';
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
    super.initState();
    data = __getAllData();
  }

  Widget __recentSearch() {
    return FutureBuilder(
      future: data,
      builder: (context, AsyncSnapshot<List<ProductNameApi>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularProgress(context);
        } else if (snapshot.data == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Empty-list.png"),
            ],
          );
        } else if (snapshot.hasData) {
          var data = snapshot.data;
          return SingleChildScrollView(
            child: Container(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2.0,
                    margin:
                        new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Palette.mainBlueTheme.withOpacity(0.6)),
                      child: ListTile(
                        // contentPadding: EdgeInsets.symmetric(
                        //     horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: Dimensions.width10),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.white))),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )),
                        title: Text(
                          data[index].productName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.line_horizontal_3,
                              size: Dimensions.icon16,
                              // color: Palette.textNo,
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Text(
                              "Gợi ý cho bạn",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  // color: Palette.textNo,
                                  ),
                            )
                          ],
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            print(snapshot.data[index].productID);
                            BlocProvider.of<HomeScreenBloc>(context)
                              ..add(
                                OnTapEvent(
                                  context: context,
                                  navigateData: snapshot.data[index].productID,
                                ),
                              );
                          },
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white, size: Dimensions.icon28),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
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
      body: __recentSearch());
}
