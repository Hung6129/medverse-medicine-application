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

  /// Call data by using search keyword in database
  Future<List<DrugModel>> searchIndexDrugs(String searchWord) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.glossaryAccess();

    /// Query keyword in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs WHERE drug_state like '%$searchWord%'");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }

  /// Call all data in database
  Future<List<DrugModel>> getDrugs() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs WHERE drug_state LIKE 'a%'");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }

  /// Get all drugs that start with the letter A
  Future<List<DrugModel>> getDrugA() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs WHERE drug_state LIKE 'l%'");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }

  /// Get all drugs that start with the letter B
  Future<List<DrugModel>> getDrugB() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs WHERE drug_state LIKE 's%'");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }

  /// Get all drugs that start with the letter B
  Future<List<DrugModel>> getDrugC() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs WHERE drug_state LIKE 'c%'");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }

  /// Get all drugs that start with the letter B
  Future<List<DrugModel>> getDrugD() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs WHERE drug_state LIKE 'd%'");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }
}