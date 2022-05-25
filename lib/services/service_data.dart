import 'package:medverse_mobile_app/models/drug_bank_db/pill_identifiter_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_name.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/database_sqlite_connection.dart';

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
/// Search data by name
class DatabaseProvider {
  /// Get database's name
  static const String drugBank = "drugbank.sqlite3";

  /// Access to SQLite path
  static Future<Database> drugBankAccess() async {
    String databasePath = join(await getDatabasesPath(), drugBank);
    return openDatabase(databasePath);
  }
}

class TypeAhead2 {
  static Future<List<ProductName>> searchName(String keyword) async {
    if (keyword.isEmpty) {
      return <ProductName>[];
    } else {
      var db = await DatabaseProvider.drugBankAccess();

      List<Map<String, dynamic>> allRows = await db.query('products',
          where: 'product_name LIKE ?', whereArgs: ['%$keyword%']);

      List<ProductName> listData =
          allRows.map((product) => ProductName.fromJson(product)).toList();

      return listData;
    }
  }
}

class PillIdentifierResult {
  Future<List<PillIdentifierModel>> getDrug() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM pilL_data_detail where pill_colors like '%ORANGE,WHITE%'");
    print("70 " + maps.length.toString());
    print(maps[0]);
    return List.generate(
      maps.length,
      (i) {
        return PillIdentifierModel(
          pill_data_id: maps[i]['pill_data_id'].toString(),
          pill_file_name: maps[i]['pill_file_name'].toString(),
          pill_overview: maps[i]['pill_overview'].toString(),
          pill_shape: maps[i]['pill_shape'].toString(),
          pill_size: maps[i]['pill_size'].toString(),
          pill_colors: maps[i]['pill_colors'].toString(),
          pill_imprints: maps[i]['pill_imprints'].toString(),
        );
      },
    );
  }
}

/// Get a list of popular item in api
// class PopularData {
//   static Future<List<ProductModel>> getPopular() async {
//     try {
//       var response =
//           await http.get(Uri.parse(Constants.PRODUCT_POPULAR_TOP_10));
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

// /// Typeahead search call api
// List<ProductModel> data = [];

// class TypeHead {
//   static Future<List<ProductModel>> getTypeAhead(String query) async {
//     if (query.isEmpty) {
//       return data;
//     }
//     http.Response resTypeAhead =
//         await http.get(Uri.parse(Constants.PRODUCTNAME_TYPE_AHEAD + query));
//     List<ProductModel> suggestion = [];
//     if (resTypeAhead.statusCode == 200) {
//       Iterable listTypeAhead = json.decode(resTypeAhead.body);
//       suggestion = List<ProductModel>.from(
//         listTypeAhead.map(
//           (e) => ProductModel.fromJson(e),
//         ),
//       );
//     } else {
//       print('Request failed with status: ${resTypeAhead.statusCode}.');
//     }
//     return suggestion;
//   }
// }

// class PillIdentifierData {
//   static Future<List<PillIdentifierModel>> getPillIdentifierData(String input) async {
//     try {
//       var response =
//           await http.get(Uri.parse(Constants.PILL_IDENTIFIER_SIZE + input));
//       if (response.statusCode == 200) {
//         List listTrend = json.decode(response.body) as List;
//         return listTrend.map((e) => PillIdentifierModel.fromJson(e)).toList();
//       } else {
//         throw Exception("Failed to fetch data");
//       }
//     } catch (e) {
//       throw Exception("No Internet Connection");
//     }
//   }
// }
