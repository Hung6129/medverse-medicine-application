import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medverse_mobile_app/controller/cubit/search_cache/search_cache_cubit.dart';

import 'package:medverse_mobile_app/services/service_data.dart';

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
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedDrug;

  @override
  void initState() {
    super.initState();
    _typeAheadController.text =
        widget.searchKeyWord == null ? "" : widget.searchKeyWord;
    BlocProvider.of<SearchCacheCubit>(context).populateSearchHistory();
  }

// function to send search keyword to cubit
  Future<void> _updateSearchCache(
      String searchKeyword, SearchCacheCubit cacheCubit) async {
    await cacheCubit.updateSearchHistory(searchKeyword);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCacheCubit>(context);
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
                controller: this._typeAheadController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _updateSearchCache(_typeAheadController.text, cubit);
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
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return 'Hãy chọn nhập và chọn một tên thuốc bất kì';
              //   }
              // },
              onSaved: (value) => this._selectedDrug = value,
            ),
            BlocBuilder<SearchCacheCubit, SearchCacheState>(
              builder: (context, state) {
                if (state is SearchCacheLoaded) {
                  return historyList(cubit.searchHistory,
                      (String searchString) {
                    setState(() {
                      _typeAheadController.text = searchString;
                    });
                    _updateSearchCache(searchString, cubit);
                  });
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget historyList(Queue<String> searchHistory, Function callback) {
    return Column(
      children: [
        for (int search = 0; search < searchHistory.length; search++)
          Container(
            height: 50,
            child: Row(
              children: [
                Icon(CupertinoIcons.square_list_fill),
                Container(
                  child: Text(
                    searchHistory.elementAt(search),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
