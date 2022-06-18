import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medverse_mobile_app/models/drug_bank_db/product_name_api_fast.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import '../models/drug_bank_db/favorite_list_model_w_name.dart';
import '../models/drug_bank_db/product_name_api.dart';
import '/models/drug_bank_db/pill_identifiter_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/utils/database_sqlite_connection.dart';

class SendData {
  sendingId(String id) {
    return http.post(
      Uri.parse(Constants.BASE_URL + Constants.SEND_DATA + id),
    );
  }
}

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
        switch (resData.statusCode) {
          case 403:
            throw (resData.statusCode.toString() +
                " Truy cập đang bị chặn, vui lòng thử lại sau");
          case 404: //Resource Not Found
            throw (resData.statusCode.toString() +
                " Không tìm thấy, vui lòng thử cách khác");
          case 500:
            throw (resData.statusCode.toString() +
                " Truy cập vào hệ thống đang gặp vấn đề, vui lòng thử lại sau"); //Internal Server Error
          case 502:
            throw (resData.statusCode.toString() +
                " Kết nối tới hệ thống đang bị lỗi, vui lòng thử lại sau");
          case 503:
            throw (resData.statusCode.toString() +
                " Hệ thống đang bị lỗi, vui lòng thử lại sau");
          default:
            throw (resData.statusCode.toString() + "Đã có lỗi gì đó xảy ra!");
        }
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

class TypeAheadByNameFast {
  static Future<List<Map<String, String>>> getTypeAheadByName(
      String input) async {
    http.Response resData = await http.get(
        Uri.parse(Constants.BASE_URL + Constants.NAME_SEARCH_FAST + input));
    List<ProductNameApiFast> suggest = [];
    if (resData.statusCode == 200) {
      Iterable listData = json.decode(resData.body);
      suggest = List<ProductNameApiFast>.from(
          listData.map((e) => ProductNameApiFast.fromJson(e)));
    } else {
      switch (resData.statusCode) {
        case 403: //Forbidden
          throw (resData.statusCode.toString() +
              "Truy cập đang bị chặn, vui lòng thử lại sau");
        case 404: //Resource Not Found
          throw (resData.statusCode.toString() +
              "Không tìm thấy, vui lòng thử cách khác");
        case 500:
          throw (resData.statusCode.toString() +
              "Truy cập vào hệ thống đang gặp vấn đề, vui lòng thử lại sau"); //Internal Server Error
        case 502:
          throw (resData.statusCode.toString() +
              "Kết nối tới hệ thống đang bị lỗi, vui lòng thử lại sau");
        case 503:
          throw (resData.statusCode.toString() +
              "Hệ thống đang bị lỗi, vui lòng thử lại sau");
        default:
          throw (resData.statusCode.toString() + "Đã có lỗi gì đó xảy ra!");
      }
    }
    return Future.value(suggest
        .map((e) => {
              'productName': e.name,
              'productId': e.productID,
            })
        .toList());
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
        'SELECT productID,product_name,product_labeller,savedTime FROM favorite_drug inner join products on products.product_id = favorite_drug.productID');

    return List.generate(
      allRows.length,
      (i) {
        return FavoriteListWName(
          productID: allRows[i]['productID'].toString(),
          product_name: allRows[i]['product_name'].toString(),
          product_labeller: allRows[i]['product_labeller'].toString(),
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
    // print(maps);
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
