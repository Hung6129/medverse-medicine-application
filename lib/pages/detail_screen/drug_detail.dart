import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;
import '../../models/drug_bank_db/product_model.dart';
import '../../services/service_data.dart';
import '../../theme/palette.dart';
import '../../utils/validation.dart';
import '../../widgets/app_text.dart';
import '../../widgets/dimension.dart';
import '../../widgets/rich_text_cus.dart';
import 'drug_detail.dart';

class DrugDetails extends StatefulWidget {
  final String drugData;

  DrugDetails({
    Key key,
    this.drugData,
  }) : super(key: key);

  @override
  _DrugDetailsState createState() => _DrugDetailsState();
}
Future<ProductModel> postApi;

DateTime now = DateTime.now();

int secondsSinceEpoch = now.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
var date = DateTime.fromMillisecondsSinceEpoch(secondsSinceEpoch * 1000);

class _DrugDetailsState extends State<DrugDetails> {
  bool _isAdded = false;
  @override
  void initState() {
    super.initState();
    print(date);

    if (mounted) {
      CheckDrugById.checkDrugInFav(widget.drugData).then((value) {
        if (value == 1) {
          _isAdded = true;
        } else {
          _isAdded = false;
        }
      });
    }
  }

  /// Get current time day
  String formatTime = DateFormat.yMd().add_Hm().format(now);
  // Test images
  String imagesFav = "assets/images/drugs_pill/300.jpg";

  // Show Dialog

  List<ProductModel> dataList;
  Future<List<ProductModel>> _getAll() async {
    dataList = await GetDetailData().getDrugDetail(widget.drugData);
    print(dataList.length);
    return dataList;
  }

  __trans(String text) async {
    final translator = GoogleTranslator();
    await translator.translate(text, from: 'en', to: 'vi');
  }

  @override
  Widget build(BuildContext context) {
    __trans("hello");

    /// Sliver app bar for product name
    Widget __sliverAppBarProductName(ProductModel data) {
      return SliverAppBar(
        toolbarHeight: Dimensions.height60,
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
            padding: EdgeInsets.only(
              left: Dimensions.height10,
              right: Dimensions.height10,
            ),
            child: Center(
              child: AppText(
                text: data.product_name,
                color: Palette.mainBlueTheme,
                size: Dimensions.font24,
                fontWeight: FontWeight.w500,
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
      );
    }

    /// Sliver
    Widget __sliverAppBarDetail(ProductModel data) {
      print('Product Id: ' + data.product_id);
      print('Product name: ' + data.product_name);
      var rnd = new Random();
      var next = rnd.nextDouble() * 1000000;
      while (next < 100000) {
      next *= 10;
      }
      var requestId = next.toInt().toString() + data.product_id;
      print(requestId);

      return SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(
            left: Dimensions.width10,
            right: Dimensions.width10,
            top: Dimensions.height10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product
              RichTextCus(text1: "Labeller:", text2: data.product_labeller),
              RichTextCus(text1: "Route:", text2: data.product_route), //d
              RichTextCus(text1: "Dosage:", text2: data.product_dosage), //d
              RichTextCus(text1: "Strength:", text2: data.product_strength), //d
              RichTextCus(text1: "Country:", text2: data.product_country),
              RichTextCus(text1: "Code:", text2: data.product_code), //d
              RichTextCus(text1: "Generic:", text2: data.product_generic), //d
              RichTextCus(text1: "Approved:", text2: data.product_approved), //d
              RichTextCus(text1: "Otc:", text2: data.product_otc), //d
              Divider(
                endIndent: Dimensions.width10,
                indent: Dimensions.width10,
                thickness: 3,
              ),
              // Drug
              RichTextCus(text1: "Description:", text2: data.drug_description),
              RichTextCus(text1: "State:", text2: data.drug_state),
              RichTextCus(text1: "Indication:", text2: data.drug_indication),
              RichTextCus(
                  text1: "Pharmacodynamics:", text2: data.pharmacodynamics),
              RichTextCus(text1: "Mechanism:", text2: data.mechanism),
              RichTextCus(text1: "Toxicity:", text2: data.toxicity),
              RichTextCus(text1: "Metabolism:", text2: data.metabolism),
              RichTextCus(text1: "Half_life:", text2: data.half_life),
              RichTextCus(
                  text1: "Route of elimination:",
                  text2: data.route_of_elimination),
              RichTextCus(text1: "Clearance:", text2: data.clearance),
            ],
          ),
        ),
      );
    }

    /// Bottom app bar
    Widget __bottomApp(ProductModel productModel, String savedTime) {
      return BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: Palette.textNo.withOpacity(0.3),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    if (_isAdded == false) {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.success(
                          message: "Đã thêm vào danh sách yêu thích thành công",
                        ),
                      );
                      await SetToFavoriteList.setToFavoriteList(
                          productModel.product_id, savedTime);
                      setState(() {
                        _isAdded = true;
                      });
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: AppText(text: "Bỏ lưu"),
                              content: AppText(
                                  text:
                                      "Gỡ thuốc này ra khỏi danh sách yêu thích ?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: AppText(
                                      text: "Huỷ", color: Palette.warningColor),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: AppText(
                                    text: "Gỡ lưu",
                                    color: Palette.grey,
                                  ),
                                  onPressed: () async {
                                    await DeleteItemInFavList.deleteItems(
                                        productModel.product_id);
                                    setState(() {
                                      _isAdded = false;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    }
                  },
                  icon: _isAdded == true
                      ? Icon(
                          CupertinoIcons.heart_solid,
                          size: Dimensions.icon28,
                          color: Palette.warningColor,
                        )
                      : Icon(
                          CupertinoIcons.heart,
                          size: Dimensions.icon28,
                          color: Palette.warningColor,
                        )),
            ],
          ),
        ),
      );
    }

    return FutureBuilder(
      future: _getAll(),
      builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          var info = snapshot.data[0];
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                __sliverAppBarProductName(info),
                __sliverAppBarDetail(info),
              ],
            ),
            bottomNavigationBar: __bottomApp(info, formatTime),
          );
        } else {
          return circularProgress(context);
        }
      },
    );
  }

  /// Post information to API
  Future<ProductModel> postDrug(String timestamp, String requestId, String productId, String productName) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'timestamp': timestamp,
        'requestId': requestId,
        'productId': productId,
        'productName': productName,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
