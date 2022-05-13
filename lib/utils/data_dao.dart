import '/utils/database_sqlite_connection.dart';
import '/models/dictionary_model.dart';
import '/models/drug_model.dart';

class DataDao {
  /// Call all data in Glossary database
  Future<List<Dictionary>> allWords() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.glossaryAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM glossary");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Dictionary(row["word_id"], row["wordEnglish"], row["wordVietnamese"]);
    });
  }

  /// Call data by using search keyword in database
  Future<List<Dictionary>> searchWord(String searchWord) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.glossaryAccess();

    /// Query keyword in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM glossary WHERE wordEnglish like '%$searchWord%' or wordVietnamese like '%$searchWord%'");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Dictionary(row["word_id"], row["wordEnglish"], row["wordVietnamese"]);
    });
  }

  /// Call all data in database
  Future<List<DrugModel>> getDrugs() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM products");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["product_name"]);
    });
  }
}