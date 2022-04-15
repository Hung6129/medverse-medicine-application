import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medverse_mobile_app/controller/cubit/search_cache/search_cache_cubit.dart';
import 'package:medverse_mobile_app/models/test/drugs_product_test.dart';

import 'package:medverse_mobile_app/services/service_data.dart';

import '../pages/detail_screen/drug_details.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';

class TypeAheadSearchBar extends StatefulWidget {
  final String searchKeyWord;
  TypeAheadSearchBar({Key key, this.searchKeyWord}) : super(key: key);

  @override
  _TypeAheadSearchBarState createState() => _TypeAheadSearchBarState();
}

class _TypeAheadSearchBarState extends State<TypeAheadSearchBar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  drugProductTest db;
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedDrug;

  @override
  void initState() {
    super.initState();
  }

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
                      borderSide: BorderSide(color: Palette.mainBlueTheme),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimensions.radius20),
                      ),
                      borderSide:
                          BorderSide(width: 3, color: Palette.mainBlueTheme),
                    ),
                    labelText: 'Hôm nay bạn muốn tìm thuốc gì?'),
              ),
              suggestionsCallback: (String pattern) {
                return typeAhead.getTypeAhead(pattern);
              },
              itemBuilder: (context, Map<String, dynamic> suggestion) {
                return ListTile(
                  title: AppTextTitle(
                      text: suggestion['productName'],
                      color: Colors.black54,
                      size: Dimensions.font18,
                      fontWeight: FontWeight.normal),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (Map<String, dynamic> suggestion) {
                this._typeAheadController.text = suggestion['productName'];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DrugDetails(drugData: suggestion['productName'])),
                );
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Hãy chọn nhập và chọn một tên thuốc bất kì';
                }
              },
              onSaved: (value) => this._selectedDrug = value,
            ),
          ],
        ),
      ),
    );
  }
}
