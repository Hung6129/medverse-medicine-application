import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _DrugDetailsState extends State<DrugDetails> {
  // Test images
  String imagesFav = "assets/images/drugs_pill/300.jpg";

  // Icon checker setup
  // Widget getIcons(String id) {
  //   if (_box.containsKey(id)) {
  //     return Icon(CupertinoIcons.heart_fill, color: Colors.red);
  //   } else {
  //     return Icon(CupertinoIcons.heart, color: Colors.red);
  //   }
  // }

  // Show Dialog
  showAlertDialog(BuildContext context, String id) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Huỷ"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Bỏ lưu"),
      onPressed: () {
        // _box.delete(id);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(""),
      content: Text("Bạn có chắc muốn bỏ lưu thuốc này ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Heart on tap evnent
  // onFavoriteTap(String id) {
  //   if (_box.containsKey(id)) {
  //     showAlertDialog(this.context, id);
  //   } else {
  //     var info = widget.drugData;
  //     FavDrugModel data = FavDrugModel(
  //       productName: info.productName,
  //       approved: info.approved,
  //       country: info.country,
  //       drugbankID: info.drugbankID,
  //       generic: info.generic,
  //       otc: info.otc,
  //       productCode: info.productCode,
  //       productID: info.productID,
  //       productLabeller: info.productLabeller,
  //       productRoute: info.productRoute,
  //       productStrength: info.productStrength,
  //       productdosage: info.productdosage,
  //       productImage: info.productImage,
  //       drugClearance: info.drugClearance,
  //       drugDescription: info.drugDescription,
  //       drugElimination: info.drugElimination,
  //       drugHalflife: info.drugHalflife,
  //       drugIndication: info.drugIndication,
  //       drugMechan: info.drugMechan,
  //       drugMetabolism: info.drugMetabolism,
  //       drugName: info.drugName,
  //       drugPharmaco: info.drugPharmaco,
  //       drugState: info.drugState,
  //       drugToxicity: info.drugToxicity,
  //       // savedTime: DateTime.now().toString(),
  //     );
  //     _box.put(info.productID, data);
  //     Fluttertoast.showToast(
  //       msg: 'Lưu thành công',
  //       backgroundColor: Palette.activeButton,
  //     );
  //   }
  // }

  List<ProductModel> dataList;
  Future<List<ProductModel>> _getAll() async {
    dataList = await GetDetailData().getDrugDetail(widget.drugData);
    print(dataList.length);
    return dataList;
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
              RichTextCus(text1: "Labeller:", text2: data.product_labeller), //d
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

    return Scaffold(
      body: FutureBuilder(
        future: _getAll(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            var info = snapshot.data[0];
            return CustomScrollView(
              slivers: [
                __sliverAppBarProductName(info),
                __sliverAppBarDetail(info),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
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
              // ValueListenableBuilder(
              //   valueListenable: _box.listenable(),
              //   builder: (context, Box<FavDrugModel> box, _) {
              //     return IconButton(
              //       onPressed: () => onFavoriteTap(info.productID),
              //       icon: getIcons(info.productID),
              //     );
              //   },
              // ),
              IconButton(
                onPressed: () {
                  print("tapped x2");
                },
                icon: Icon(
                  CupertinoIcons.share,
                  size: Dimensions.icon28,
                  color: Palette.mainBlueTheme,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("tapped x3");
                },
                icon: Icon(
                  CupertinoIcons.exclamationmark_bubble_fill,
                  size: Dimensions.icon28,
                  color: Palette.starRating,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
