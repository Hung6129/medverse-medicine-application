import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import '/services/service_data.dart';
import '/widgets/app_text_title.dart';
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
  String _selectedDrug;
  List<String> addedItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addedItems.clear();
  }

  // Add to list function
  void __addItemToList(String value) {
    setState(() {
      addedItems.insert(0, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Kiểm tra tương kị thuốc',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              child: AppText(
                text:
                    "Bắt đầu nhập tên loại thuốc và chọn loại thuốc phù hợp nhất từ danh sách gợi ý. Lặp lại quy trình để thêm nhiều loại thuốc. Sau khi danh sách của bạn hoàn tất, bạn có thể kiểm tra các tương tác ngay lập tức.",
                size: Dimensions.font18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
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
                                  onPressed: () {
                                    print(_typeAheadController.text);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.search,
                                    color: Palette.mainBlueTheme,
                                  ),
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
                          itemBuilder:
                              (context, Map<String, dynamic> suggestion) {
                            return ListTile(
                              title: AppTextTitle(
                                  text: suggestion["productName"],
                                  color: Colors.black54,
                                  size: Dimensions.font18,
                                  fontWeight: FontWeight.normal),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          onSuggestionSelected:
                              (Map<String, dynamic> suggestion) {
                            _typeAheadController.text =
                                suggestion["productName"];
                            print(_typeAheadController.text);
                            __addItemToList(_typeAheadController.text);
                          },
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Hãy chọn nhập và chọn một tên thuốc bất kì';
                          //   }
                          // },
                          onSaved: (value) {
                            this._selectedDrug = value;
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // List Box Items
                  Container(
                    color: Palette.blueGrey,
                    height: Dimensions.height60,
                    width: 300,
                    child: ListView.builder(
                      itemCount: addedItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(),
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.clear),
                                Container(
                                  child: AppTextTitle(
                                    text: addedItems[index],
                                    size: Dimensions.font18,
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),

                  // Add to list
                  // Container(
                  //   width: 350,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Palette.grey300),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       String addValue = this._typeAheadController.text;
                  //       setState(() {
                  //         addedItems.add(addValue);
                  //       });
                  //     },
                  //     child: AppText(
                  //       text: "Thêm",
                  //       color: Palette.mainBlueTheme,
                  //       size: 20,
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  //   ),
                  // ),

                  SizedBox(height: 20),

                  // Check Interaction
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
                            builder: (context) => InteractionCheckerResult(),
                          ),
                        );
                      },
                      child: AppText(
                        text: "Kiểm tra tương kỵ",
                        color: Palette.whiteText,
                        size: 20,
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
