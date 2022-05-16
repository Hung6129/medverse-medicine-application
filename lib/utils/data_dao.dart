import '/utils/database_sqlite_connection.dart';
import '/models/dictionary_model.dart';
import '/models/drug_model.dart';

class DataDao {
  /// Call all data in Glossary database
  Future<List<Dictionary>> allWords() async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.glossaryAccess();

    /// Query all data in database
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM glossary");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Dictionary(
          row["word_id"], row["wordEnglish"], row["wordVietnamese"]);
    });
  }

  /// Call data by using search keyword in database
  Future<List<Dictionary>> searchWord(String searchWord) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.glossaryAccess();

    /// Query keyword in database
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM glossary WHERE wordEnglish like '%$searchWord%' or wordVietnamese like '%$searchWord%'");

    return List.generate(
      maps.length,
      (index) {
        var row = maps[index];
        return Dictionary(
            row["word_id"], row["wordEnglish"], row["wordVietnamese"]);
      },
    );
  }

  /// Get all drugs that start with the letter A
  Future<List<DrugModel>> getDrugA(int a) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = a;

    /// Query all data in database
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'a%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
      (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter B
  Future<List<DrugModel>> getDrugB(int b) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = b;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'b%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
      (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter C
  Future<List<DrugModel>> getDrugC(int c) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = c;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'c%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
      (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter D
  Future<List<DrugModel>> getDrugD(int d) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = d;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'd%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
      (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter E
  Future<List<DrugModel>> getDrugE(int e) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = e;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'e%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter F
  Future<List<DrugModel>> getDrugF(int f) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = f;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'f%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter G
  Future<List<DrugModel>> getDrugG(int g) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = g;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'g%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter H
  Future<List<DrugModel>> getDrugH(int h) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = h;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'h%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter I
  Future<List<DrugModel>> getDrugI(int i) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = i;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'i%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter J
  Future<List<DrugModel>> getDrugJ(int j) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = j;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'j%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter K
  Future<List<DrugModel>> getDrugK(int k) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = k;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'k%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }

  /// Get all drugs that start with the letter L
  Future<List<DrugModel>> getDrugL(int l) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = l;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'l%' ORDER BY product_name limit ?, 20",
      [position],
    );
    print(maps);

    return List.generate(
      maps.length,
          (index) {
        var row = maps[index];
        return DrugModel(
          row["product_name"],
          row["product_labeller"],
        );
      },
    );
  }
}
