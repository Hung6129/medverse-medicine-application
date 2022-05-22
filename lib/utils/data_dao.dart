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

  /// Get all drugs that start with the letter M
  Future<List<DrugModel>> getDrugM(int m) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = m;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'm%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter N
  Future<List<DrugModel>> getDrugN(int n) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = n;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'n%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter O
  Future<List<DrugModel>> getDrugO(int o) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = o;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'o%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter P
  Future<List<DrugModel>> getDrugP(int p) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = p;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'p%' ORDER BY product_name limit ?, 20",
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

  // Get all drugs that start with the letter Q
  Future<List<DrugModel>> getDrugQ(int q) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = q;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'q%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter R
  Future<List<DrugModel>> getDrugR(int r) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = r;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'r%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter S
  Future<List<DrugModel>> getDrugS(int s) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = s;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 's%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter T
  Future<List<DrugModel>> getDrugT(int t) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = t;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 't%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter U
  Future<List<DrugModel>> getDrugU(int u) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = u;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'u%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter V
  Future<List<DrugModel>> getDrugV(int v) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = v;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'v%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter W
  Future<List<DrugModel>> getDrugW(int w) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = w;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'w%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter X
  Future<List<DrugModel>> getDrugX(int x) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = x;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'x%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter Y
  Future<List<DrugModel>> getDrugY(int y) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = y;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'y%' ORDER BY product_name limit ?, 20",
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

  /// Get all drugs that start with the letter Z
  Future<List<DrugModel>> getDrugZ(int z) async {
    /// Call database and access to database
    var db = await DatabaseSqliteConnection.drugBankAccess();
    int position = z;

    /// Query all data in databaseOM
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT DISTINCT product_name, product_labeller FROM products WHERE lower(product_name) LIKE 'z%' ORDER BY product_name limit ?, 20",
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
