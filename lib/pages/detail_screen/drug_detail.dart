import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:http/http.dart' as http;
import '../../models/drug_bank_db/product_model.dart';
import '../../services/service_data.dart';
import '../../theme/palette.dart';

import '../../widgets/app_text.dart';
import '../../widgets/dimension.dart';
import '../../widgets/rich_text_cus.dart';

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

class _DrugDetailsState extends State<DrugDetails> {
  /// Get current time day
  String formatTime = DateFormat.yMd().add_Hm().format(now);
  // Test images
  String imagesFav = "assets/images/drugs_pill/300.jpg";

  Future<ProductModel> fetchDetailData() async {
    final response = await http.get(
        Uri.parse(Constants.BASE_URL + Constants.ID_SEARCH + widget.drugData));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  bool _isAdded = false;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      CheckDrugById.checkDrugInFav(widget.drugData).then((value) {
        if (value == 1) {
          _isAdded = true;
        } else {
          _isAdded = false;
        }
      });
    }
    postApi = fetchDetailData();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              data.productName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Palette.mainBlueTheme,
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
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
              RichTextCus(text1: "Labeller:", text2: data.productLabeller),
              RichTextCus(text1: "Route:", text2: data.productRoute), //d
              RichTextCus(text1: "Dosage:", text2: data.productdosage), //d
              RichTextCus(text1: "Strength:", text2: data.productStrength), //d
              RichTextCus(text1: "Country:", text2: data.country),
              RichTextCus(text1: "Code:", text2: data.productCode), //d
              RichTextCus(text1: "Generic:", text2: data.generic), //d
              RichTextCus(text1: "Approved:", text2: data.approved), //d
              RichTextCus(text1: "Otc:", text2: data.otc), //d
              Divider(
                endIndent: Dimensions.width10,
                indent: Dimensions.width10,
                thickness: 3,
              ),
              // Drug
              RichTextCus(text1: "Description:", text2: data.drugDescription),
              RichTextCus(text1: "State:", text2: data.drugState),
              RichTextCus(text1: "Indication:", text2: data.drugIndication),
              RichTextCus(text1: "Pharmacodynamics:", text2: data.drugPharmaco),
              RichTextCus(text1: "Mechanism:", text2: data.drugMechan),
              RichTextCus(text1: "Toxicity:", text2: data.drugToxicity),
              RichTextCus(text1: "Metabolism:", text2: data.drugMetabolism),
              RichTextCus(text1: "Half_life:", text2: data.drugHalflife),
              RichTextCus(
                  text1: "Route of elimination:", text2: data.drugElimination),
              RichTextCus(text1: "Clearance:", text2: data.drugClearance),
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
                          productModel.productID, savedTime);
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
                                        productModel.productID);
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
      future: postApi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var info = snapshot.data;
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
}
