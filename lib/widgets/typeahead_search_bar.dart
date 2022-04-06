import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medverse_mobile_app/services/service_data.dart';

class TypeAheadSearchBar extends StatefulWidget {
  const TypeAheadSearchBar({Key key}) : super(key: key);

  @override
  _TypeAheadSearchBarState createState() => _TypeAheadSearchBarState();
}

class _TypeAheadSearchBarState extends State<TypeAheadSearchBar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedDrug;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height20,
          right: Dimensions.height30,
          left: Dimensions.height30,
          bottom: Dimensions.height20,
        ),
        child: Column(
          children: <Widget>[
            //search bar
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: this._typeAheadController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20)),
                          borderSide: BorderSide(color: Palette.mainBlueTheme)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20)),
                          borderSide: BorderSide(
                              width: 3, color: Palette.mainBlueTheme)),
                      labelText: 'Hôm nay bạn muốn tìm thuốc gì?')),
              suggestionsCallback: (pattern) {
                return typeAhead.getTypeAhead(pattern);
              },
              itemBuilder: (context, Map<String, dynamic> suggestion) {
                return ListTile(
                  title: AppTextTitle(
                      text: suggestion['tenThuoc'],
                      color: Colors.black54,
                      size: Dimensions.font18,
                      fontWeight: FontWeight.normal),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (Map<String, dynamic> suggestion) {
                this._typeAheadController.text = suggestion['tenThuoc'];
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Hãy chọn nhập và chọn một tên thuốc bất kì';
                }
              },
              onSaved: (value) => this._selectedDrug = value,
            ),

            //search btn
            TextButton(
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Palette.mainBlueTheme,
                ),
                child: Center(
                  child: AppText(
                      text: "Tìm kiếm",
                      color: Palette.p1,
                      size: Dimensions.font18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                if (this._formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  // print("tapped");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(AS
                  //       builder: (context) =>
                  //           DrugDetails(drugData: _selectedDrug)),
                  // );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Palette.mainBlueTheme,
                      content: AppText(
                        text: ' ${this._selectedDrug}',
                        color: Palette.p1,
                        fontWeight: FontWeight.normal,
                        size: Dimensions.font18,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
