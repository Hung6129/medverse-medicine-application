import 'package:medverse_mobile_app/models/drug_bank_db/favorite_list_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/pill_identifiter_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_name.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:medverse_mobile_app/utils/config.dart';
import '/utils/database_sqlite_connection.dart';

final FirebaseAnalytics firebaseAnalytics = Config.firebaseAnalytics;

// void _logSerchTerm(String keyword) async {
//   await firebaseAnalytics.logMedicineSearch(productName: keyword);
// }

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
      var db = await DatabaseSqliteConnection.drugBankAccess();
      // _logSerchTerm(keyword);

      List<Map<String, dynamic>> allRows = await db.query('products',
          where: 'product_name LIKE ?', whereArgs: ['%$keyword%']);

      return List.generate(
        allRows.length,
        (i) {
          return ProductName(
            product_id: allRows[i]['product_id'].toString(),
            product_name: allRows[i]['product_name'].toString(),
            product_code: allRows[i]['product_code'].toString(),
          );
        },
      );
    }
  }
}

class PillIdentifierResult {
  Future<List<PillIdentifierModel>> getDrugByIdentifier(
      String imprint, String color, String shape, String size) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        // "SELECT * FROM pilL_data_detail where pill_shape like ${shape == null ? '%%' : '%$shape%'} and pill_size like ${size == null ? '%%' : '%$size%'}  and pill_colors like ${color == null ? '%$color%' : '%$color%'} and pill_imprints like '%$imprint%'");

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

class GetDetailData {
  Future<List<ProductModel>> getDrugDetail(String productID) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT product_id,  product_name,product_labeller,product_code,product_route,product_dosage,product_strength,product_approved,product_otc,product_generic,product_country,drug_description,drug_state,drug_indication,pharmacodynamics,mechanism,toxicity,metabolism,half_life,route_of_elimination,clearance FROM products inner join drugs on drugs.drugbank_id = products.drugbank_id WHERE product_id = '$productID'");
    print(maps.length);
    return List.generate(
      maps.length,
      (i) {
        return ProductModel(
          product_id: maps[i]['product_id'].toString(),
          product_name: maps[i]['product_name'].toString(),
          product_labeller: maps[i]['product_labeller'].toString(),
          product_code: maps[i]['product_code'].toString(),
          product_route: maps[i]['product_route'].toString(),
          product_dosage: maps[i]['product_dosage'].toString(),
          product_strength: maps[i]['product_strength'].toString(),
          product_approved: maps[i]['product_approved'].toString(),
          product_otc: maps[i]['product_otc'].toString(),
          product_generic: maps[i]['product_generic'].toString(),
          product_country: maps[i]['product_country'].toString(),
          drug_description: maps[i]['drug_description'].toString(),
          drug_state: maps[i]['drug_state'].toString(),
          drug_indication: maps[i]['drug_indication'].toString(),
          pharmacodynamics: maps[i]['pharmacodynamics'].toString(),
          mechanism: maps[i]['mechanism'].toString(),
          toxicity: maps[i]['toxicity'].toString(),
          metabolism: maps[i]['metabolism'].toString(),
          half_life: maps[i]['half_life'].toString(),
          route_of_elimination: maps[i]['route_of_elimination'].toString(),
          clearance: maps[i]['clearance'].toString(),
        );
      },
    );
  }
}

class SetToFavoriteList {
  static Future setToFavoriteList(String productID, String savedTime) async {
    var db = await DatabaseSqliteConnection.drugBankAccess();
    return await db.rawQuery(
        'insert into favorite_drug values ("$productID","$savedTime")');
  }
}

class GetFavoriteList {
  static Future<List<FavoriteList>> getFavoriteList() async {
    var db = await DatabaseSqliteConnection.drugBankAccess();

    List<Map<String, dynamic>> allRows =
        await db.rawQuery('Select * from favorite_drug');

    return List.generate(
      allRows.length,
      (i) {
        return FavoriteList(
          productID: allRows[i]['productID'].toString(),
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
 
  //  product_name,product_labeller,product_code,product_route,product_dosage,product_strength,product_approved,product_otc,product_generic,product_country,drug_description,drug_state,drug_indication,pharmacodynamics,mechanism,toxicity,metabolism,half_life,route_of_elimination,clearance
  // maps.map() ProductModel(
  //        product_id:maps['pill_data_id'].toString(),
  //  drugbank_id:
  //  product_name:
  //  product_labeller:
  //  product_code:
  //  product_route:
  //  product_dosage:
  //  product_strength:
  //  product_approved:
  //  product_otc:
  //  product_generic:
  //  product_country:
  //  drug_description:
  //  drug_state:
  //  drug_indication:
  //  pharmacodynamics:
  //  mechanism:
  //  toxicity:
  //  metabolism:
  //  half_life:
  //  route_of_elimination:
  //  clearance:
  //   );
