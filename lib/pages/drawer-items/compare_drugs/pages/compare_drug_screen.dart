import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import '../../../../widgets/app_text.dart';
import '../../check_interaction/pages/interaction_checker_result.dart';
import '/services/service_data.dart';
import '/widgets/dimension.dart';
import '/models/drug_bank_db/product_model.dart';
import '/widgets/app_text_title.dart';
import '/pages/drawer-items/compare_drugs/pages/compare_result.dart';
import '/theme/palette.dart';

class CompareDrug extends StatefulWidget {
  const CompareDrug({Key key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<CompareDrug> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Editing controller
  final TextEditingController _typeAheadController = TextEditingController();

  FocusNode focusNode;

  // String _selectedDrug;
  List<String> addedItemsList = [];

  // Add to list function
  void __addItemToList(String value) {
    if (addedItemsList.length == 2) {
      addedItemsList.removeLast();
      setState(() {
        addedItemsList.insert(0, value);
      });
    } else {
      setState(() {
        addedItemsList.insert(0, value);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'So sánh thuốc',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                color: Palette.textNo.withAlpha(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Xem tác dụng của chúng sẽ như thế nào khi dùng chung',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/compare-hero-bg.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    width: 340,
                    decoration: BoxDecoration(
                      color: Palette.whiteText,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      boxShadow: [
                        BoxShadow(
                          color: Palette.blueGrey,
                          offset: const Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 3.0,
                        ),
                      ],
                      border: Border.all(
                        color: Palette.blueGrey,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: this._formKey,
                          child: Column(
                            children: [
                              TypeAheadFormField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  focusNode: focusNode,
                                  autocorrect: true,
                                  controller: this._typeAheadController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(CupertinoIcons.clear),
                                        onPressed: () {
                                          _typeAheadController.clear();
                                        },
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius20),
                                        ),
                                        borderSide: BorderSide(
                                            color: Palette.mainBlueTheme),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius20),
                                        ),
                                        borderSide: BorderSide(
                                          width: 3,
                                          color: Palette.mainBlueTheme,
                                        ),
                                      ),
                                      labelText:
                                          'Nhập thuốc bạn muốn tìm kiếm'),
                                ),
                                onSuggestionSelected:
                                    (ProductModel suggestion) {
                                  if (addedItemsList.length == 2) {
                                    print("cannot add");
                                  }
                                  _typeAheadController.text =
                                      suggestion.productName;
                                  print(_typeAheadController.text);
                                  __addItemToList(_typeAheadController.text);
                                },
                                itemBuilder:
                                    (context, ProductModel suggestion) {
                                  return ListTile(
                                    title: AppTextTitle(
                                        text: suggestion.productName,
                                        color: Colors.black54,
                                        size: Dimensions.font18,
                                        fontWeight: FontWeight.normal),
                                  );
                                },
                                transitionBuilder:
                                    (context, suggestionsBox, controller) {
                                  return suggestionsBox;
                                },
                                suggestionsCallback: (String pattern) {
                                  return TypeHead.getTypeAhead(pattern);
                                },
                              ),
                              SizedBox(height: Dimensions.height10),
                              // List Box Items
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.grey[100],
                                ),
                                child: ListView.builder(
                                  itemCount: addedItemsList.length,
                                  itemBuilder: (context, index) {
                                    return Chip(
                                      deleteIconColor: Colors.white,
                                      backgroundColor: Palette.mainBlueTheme
                                          .withOpacity(0.7),
                                      label: AppTextTitle(
                                        text: addedItemsList[index],
                                        color: Colors.white,
                                        size: Dimensions.font20,
                                      ),
                                      deleteIcon: Icon(
                                        CupertinoIcons.multiply,
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          addedItemsList.removeAt(index);
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: Dimensions.height10),
                              // Add to list
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Palette.grey300),
                                child: TextButton(
                                  onPressed: () {
                                    String addValue =
                                        this._typeAheadController.text;
                                    setState(() {
                                      addedItemsList.add(addValue);
                                    });
                                  },
                                  child: AppText(
                                    text: "Thêm",
                                    color: Palette.mainBlueTheme,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(height: Dimensions.height10),

                              /// Check Interaction btn
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Palette.mainBlueTheme,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (addedItemsList.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: AppText(
                                            text:
                                                "Chọn 2 thuốc để kiểm tra tương kỵ",
                                          ),
                                          duration: Duration(seconds: 4),
                                          action: SnackBarAction(
                                            label: "Thêm",
                                            onPressed: () =>
                                                focusNode.requestFocus(),
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InteractionCheckerResult(
                                                  name1: addedItemsList[0],
                                                  name2: addedItemsList[1]),
                                        ),
                                      );
                                    }
                                  },
                                  child: AppText(
                                    text: "So sánh",
                                    color: Palette.whiteText,
                                    size: Dimensions.font20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "So sánh phổ biến",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    "So sánh các loại thuốc hàng đầu theo tình trạng y tế, tác dụng phụ, xếp hạng và đánh giá.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CompareResult(),
                    ),
                  );
                },
                child: new Text("Tylenol và Paranol"),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
