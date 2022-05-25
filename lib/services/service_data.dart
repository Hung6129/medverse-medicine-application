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

      print(listData.map((e) => e.product_name));

      print("54" + listData.length.toString());

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
    String n1 = 'pill_data_id';
    String n2 = 'pill_file_name';
    String n3 = 'pill_overview';
    String n4 = 'pill_shape';
    String n5 = 'pill_size';
    String n6 = 'pill_colors';
    String n7 = 'pill_imprints';
    return List.generate(maps.length, (i) {
      return PillIdentifierModel(
        pillDataId: maps[i][n1].toString(),
        pillImage: maps[i][n2].toString(),
        pillInfo: maps[i][n3].toString(),
        pillShape: maps[i][n4].toString(),
        pillSize: maps[i][n5].toString(),
        pillColors: maps[i][n6].toString(),
        pillImprints: maps[i][n7].toString(),
      );
    });
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
