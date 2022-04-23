import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';

import '../../pages/nav-items/home/bloc/home_screen_bloc.dart';
import '/services/service_data.dart';
import '/theme/palette.dart';
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
  final TextEditingController _typeAheadController = TextEditingController();
  var _box = Hive.box("search-cache");
  String _selectedDrug;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
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
              return TypeHead.getTypeAhead(pattern);
            },
            itemBuilder: (context, Map<String, dynamic> suggestion) {
              return ListTile(
                title: AppTextTitle(
                    text: suggestion["productName"],
                    color: Colors.black54,
                    size: Dimensions.font18,
                    fontWeight: FontWeight.normal),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (Map<String, dynamic> suggestion) {
              _typeAheadController.text = suggestion["productName"];
              print(_typeAheadController.text);
              // BlocProvider.of<HomeScreenBloc>(context)
              //   ..add(
              //     OnTapEvent(
              //       context: context,
              //       product: suggestion as ProductModel,
              //     ),
              //   );
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Hãy chọn nhập và chọn một tên thuốc bất kì';
              }
            },
            onSaved: (value) {
              this._selectedDrug = value;
            },
          ),
        ],
      ),
    );
  }
}
