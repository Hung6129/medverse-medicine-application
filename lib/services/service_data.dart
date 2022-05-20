import 'package:medverse_mobile_app/models/drug_bank_db/pill_identifiter_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:medverse_mobile_app/utils/database_sqlite_connection.dart';
import 'dart:convert';

import '../models/drug_bank_db/product_name.dart';

/// Get a list of recommended item in api
// class RecommenedData {
//   static Future<List<ProductModel>> getRecommened() async {
//     try {
//       var response =
//           await http.get(Uri.parse(Constants.PRODUCT_RECOMMENDED_TOP_10));
//       if (response.statusCode == 200) {
//         List listTrend = json.decode(response.body) as List;
//         return listTrend.map((e) => ProductModel.fromJson(e)).toList();
//       } else {
//         throw Exception("Failed to fetch data");
//       }
//     } catch (e) {
//       throw Exception("No Internet Connection");
//     }
//   }
// }
class TypeAhead2 {

  static Future<List<ProductName>> searchName(String keyword) async {

    if (keyword.isEmpty) {

      return <ProductName>[];

    } else {

      var db = await DatabaseSqliteConnection.drugBankAccess();

      List<Map<String, dynamic>> allRows = await db.query('products',

          where: 'product_name LIKE ?', whereArgs: ['%$keyword%']);

      List<ProductName> listData =

      allRows.map((product) => ProductName.fromJson(product)).toList();

/*      print(listData.map((e) => e.product_name));

      print("54" + listData.length.toString());

      return listData;*/
      return List.generate(allRows.length, (i) {
        return ProductName(
          product_name: allRows[i]['product_name'],
          product_id: allRows[i]['product_id'],
          product_labeller: allRows[i]['product_labeller'],
        );
      });

    }

  }}

/// Get a list of popular item in api
class PopularData {
  static Future<List<ProductModel>> getPopular() async {
    try {
      var response =
          await http.get(Uri.parse(Constants.PRODUCT_POPULAR_TOP_10));
      if (response.statusCode == 200) {
        List listTrend = json.decode(response.body) as List;
        return listTrend.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception("No Internet Connection");
    }
  }
}

/// Typeahead search call api
List<ProductModel> data = [];

class TypeHead {
  static Future<List<ProductModel>> getTypeAhead(String query) async {
    if (query.isEmpty) {
      return data;
    }
    http.Response resTypeAhead =
        await http.get(Uri.parse(Constants.PRODUCTNAME_TYPE_AHEAD + query));
    List<ProductModel> suggestion = [];
    if (resTypeAhead.statusCode == 200) {
      Iterable listTypeAhead = json.decode(resTypeAhead.body);
      suggestion = List<ProductModel>.from(
        listTypeAhead.map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    } else {
      print('Request failed with status: ${resTypeAhead.statusCode}.');
    }
    return suggestion;
  }
}

class PillIdentifierData {
  static Future<List<PillIdentifierModel>> getPillIdentifierData(String input) async {
    try {
      var response =
          await http.get(Uri.parse(Constants.PILL_IDENTIFIER_SIZE + input));
      if (response.statusCode == 200) {
        List listTrend = json.decode(response.body) as List;
        return listTrend.map((e) => PillIdentifierModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception("No Internet Connection");
    }
  }
}
