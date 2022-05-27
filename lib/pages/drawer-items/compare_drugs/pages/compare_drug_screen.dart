import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../../services/service_data.dart';
import '/pages/drawer-items/compare_drugs/pages/compare_result.dart';
import '/utils/app_text_theme.dart';
import '../../../../widgets/app_text.dart';
import '/widgets/dimension.dart';
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

  /// Intro text
  String introText =
      "Xem cách các loại thuốc của bạn xếp chồng lên nhau. Xem các so sánh song song về việc sử dụng thuốc, tác dụng phụ, tương tác thuốc, phân loại, tính khả dụng chung và hơn thế nữa.";

  /// Select text
  String selectText =
      "Bắt đầu gõ tên một loại thuốc. Một danh sách các gợi ý sẽ xuất hiện sau đó vui lòng chọn từ danh sách.";
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
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                color: Palette.textNo.withAlpha(10),
              ),
              child: Column(
                children: [
                  /// Intro
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: AppText(
                        text: introText,
                        color: Palette.mainBlueTheme,
                        size: Dimensions.font18,
                      ),
                    ),
                  ),

                  /// Compare box
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
                        /// Input
                        Form(
                          key: this._formKey,
                          child: TypeAheadFormField(
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
                                  labelText: 'Nhập thuốc bạn muốn so sánh'),
                            ),
                            onSuggestionSelected: ( suggestion) {
                              if (addedItemsList.length == 2) {
                                print("cannot add");
                              }
                              _typeAheadController.text =
                                  suggestion.productName;
                              print(_typeAheadController.text);
                              __addItemToList(_typeAheadController.text);
                            },
                            itemBuilder: (context,  suggestion) {
                              return ListTile(
                                title: AppText(
                                    text: suggestion.productName,
                                    color: Colors.black54,
                                    size: Dimensions.font16,
                                    fontWeight: FontWeight.normal),
                              );
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            suggestionsCallback: (String pattern) {
                              return TypeAhead2.searchName(pattern);
                            },
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),

                        /// List Box Items
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.grey[100],
                          ),
                          child: addedItemsList.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AppText(
                                    text: selectText,
                                    size: Dimensions.font14,
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: addedItemsList.length,
                                  itemBuilder: (context, index) {
                                    return Chip(
                                      deleteIconColor: Colors.white,
                                      backgroundColor: Palette.mainBlueTheme
                                          .withOpacity(0.7),
                                      label: AppText(
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

                        /// Compare btn
                        Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Palette.mainBlueTheme,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CompareResult()),
                              );
                              // if (addedItemsList.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: AppText(
                              //         text: "Chọn 2 thuốc để kiểm tra tương kỵ",
                              //       ),
                              //       duration: Duration(seconds: 4),
                              //       action: SnackBarAction(
                              //         label: "Thêm",
                              //         onPressed: () => focusNode.requestFocus(),
                              //       ),
                              //     ),
                              //   );
                              // } else {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           InteractionCheckerResult(
                              //               name1: addedItemsList[0],
                              //               name2: addedItemsList[1]),
                              //     ),
                              //   );
                              // }
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
    );
  }
}
