import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '/models/drug_bank_db/product_model.dart';
import '../../../../services/service_data.dart';
import '../../../../widgets/app_text_title.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';
import 'interaction_checker_result.dart';

class InteractionChecker extends StatefulWidget {
  const InteractionChecker({Key key}) : super(key: key);

  @override
  _InteractionCheckerState createState() => _InteractionCheckerState();
}

class _InteractionCheckerState extends State<InteractionChecker> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Kiểm tra tương kỵ thuốc',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Intro
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              child: AppText(
                text:
                    "Bắt đầu nhập tên loại thuốc và chọn loại thuốc phù hợp nhất từ danh sách gợi ý. Lặp lại quy trình để thêm nhiều loại thuốc. Sau khi danh sách của bạn hoàn tất, bạn có thể kiểm tra các tương tác ngay lập tức.",
                size: Dimensions.font18,
                fontWeight: FontWeight.normal,
              ),
            ),

            /// Input Box
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: Palette.grey300.withOpacity(0.5),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Palette.grey300.withOpacity(0.5),
                    offset: Offset(5, 5),
                  ),
                  BoxShadow(
                    color: Palette.grey300.withOpacity(0.5),
                    offset: Offset(-5, 5),
                  ),
                ],
              ),
              // padding: EdgeInsets.all(Dimensions.height25),
              child: Column(
                children: [
                  // Text field box
                  Form(
                    key: this._formKey,
                    child: Column(
                      children: [
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
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
                                  borderSide:
                                      BorderSide(color: Palette.mainBlueTheme),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius20),
                                  ),
                                  borderSide: BorderSide(
                                      width: 3, color: Palette.mainBlueTheme),
                                ),
                                labelText: 'Nhập thuốc bạn muốn kiểm tra'),
                          ),
                          suggestionsCallback: (String pattern) {
                            return TypeHead.getTypeAhead(pattern);
                          },
                          itemBuilder: (context, ProductModel suggestion) {
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
                          onSuggestionSelected: (ProductModel suggestion) {
                            if (addedItemsList.length == 2) {
                              print("cannot add");
                            }
                            _typeAheadController.text = suggestion.productName;
                            print(_typeAheadController.text);
                            __addItemToList(_typeAheadController.text);
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.height10,
                  ),

                  // List Box Items
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.grey[100],
                    ),
                    child: ListView.builder(
                      itemCount: addedItemsList.length,
                      itemBuilder: (context, index) {
                        return Chip(
                          deleteIconColor: Colors.white,
                          backgroundColor:
                              Palette.mainBlueTheme.withOpacity(0.7),
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
                        String addValue = this._typeAheadController.text;
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

                  // Check Interaction btn
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AppText(
                                text: "Chọn 2 thuốc để kiểm tra tương kỵ",
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InteractionCheckerResult(
                                  name1: addedItemsList[0],
                                  name2: addedItemsList[1]),
                            ),
                          );
                        }
                      },
                      child: AppText(
                        text: "Kiểm tra tương kỵ",
                        color: Palette.whiteText,
                        size: Dimensions.font20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
