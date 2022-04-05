import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '/services/service_data.dart';
import '/theme/palette.dart';
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';

class TypeAheadSearchBar extends StatefulWidget {
  const TypeAheadSearchBar({Key key}) : super(key: key);

  @override
  _TypeAheadSearchBarState createState() => _TypeAheadSearchBarState();
}

class _TypeAheadSearchBarState extends State<TypeAheadSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
      decoration: BoxDecoration(
        color: Palette.textNo.withAlpha(10),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Nhập tên thuốc bất kì...",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await typeAhead.getTypeAhead(pattern);
              },
              itemBuilder: (context, Map<String, dynamic> suggestion) {
                return suggestion.isEmpty
                    ? AppTextTitle(
                        text: "----------",
                        color: Colors.black54,
                        size: 20,
                        fontWeight: FontWeight.bold)
                    : ListTile(
                        title: AppTextTitle(
                            text: suggestion['tenThuoc'],
                            color: Colors.black54,
                            size: Dimensions.font18,
                            fontWeight: FontWeight.normal),
                      );
              },
              onSuggestionSelected: (suggestion) {
                print("tapped");
              },
            ),
          ),
        ],
      ),
    );
  }
}
