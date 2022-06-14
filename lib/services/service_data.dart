import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medverse_mobile_app/utils/constants.dart';
import '../models/drug_bank_db/favorite_list_model_w_name.dart';
import '../models/drug_bank_db/product_name_api.dart';
import '/models/drug_bank_db/pill_identifiter_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/utils/database_sqlite_connection.dart';

class TypeAheadByName {
  static Future<List<Map<String, String>>> getTypeAheadByName(
      String input) async {
    if (input.isEmpty) {
      return <Map<String, String>>[];
    } else {
      http.Response resData = await http
          .get(Uri.parse(Constants.BASE_URL + Constants.NAME_SEARCH + input));
      List<ProductNameApi> suggest = [];
      if (resData.statusCode == 200) {
        Iterable listData = json.decode(resData.body);
        suggest = List<ProductNameApi>.from(
            listData.map((e) => ProductNameApi.fromJson(e)));
      } else {
        throw ('Request failed with status: ${resData.statusCode}.');
      }
      return Future.value(suggest
          .map((e) => {
                'productName': e.productName,
                'productId': e.productID,
                'drugId': e.drugbankID
              })
          .toList());
    }
  }
}

class DatabaseProvider {
  /// Get database's name
  static const String drugBank = "drugbank.sqlite3";

  /// Access to SQLite path
  static Future<Database> drugBankAccess() async {
    String databasePath = join(await getDatabasesPath(), drugBank);
    return openDatabase(databasePath);
  }
}

/// Favorite function
class SetToFavoriteList {
  static Future setToFavoriteList(String productID, String savedTime) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();
    return await db.rawQuery(
        'insert into favorite_drug values ("$productID","$savedTime")');
  }
}

class GetFavoriteList {
  static Future<List<FavoriteListWName>> getFavoriteList() async {
    var db = await DatabaseSqliteConnection.drugBankAccess();

    List<Map<String, dynamic>> allRows = await db.rawQuery(
        'SELECT productID,product_name,savedTime FROM favorite_drug inner join products on products.product_id = favorite_drug.productID');

    return List.generate(
      allRows.length,
      (i) {
        return FavoriteListWName(
          productID: allRows[i]['productID'].toString(),
          product_name: allRows[i]['product_name'].toString(),
          savedTime: allRows[i]['savedTime'].toString(),
        );
      },
    );
  }
}

class DeleteItemInFavList {
  static Future deleteItems(String id) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();
    return await db
        .rawQuery("delete from favorite_drug where productID ='$id'");
  }
}

class CheckDrugById {
  static Future<int> checkDrugInFav(String id) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();
    var x = await db.rawQuery(
        "SELECT productID FROM favorite_drug where productID like '%$id%'");
    if (x.isEmpty) {
      return 0;
    } else {
      return 1;
    }
  }
}

/// Medicine Functions
class PillIdentifierResult {
  Future<List<PillIdentifierModel>> getDrugByIdentifier(
      String imprint, String color, String shape, String size) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM pilL_data_detail where pill_shape like '%$shape%' and pill_size like '%$size%'  and pill_colors like '%$color%' and pill_imprints like '%$imprint%'");
    print(maps);
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
