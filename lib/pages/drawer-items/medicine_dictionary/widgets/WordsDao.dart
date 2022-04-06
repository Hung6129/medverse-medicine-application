import '/pages/drawer-items/medicine_dictionary/widgets/DatabaseHelper.dart';
import '/models/dictionary_model.dart';

class WordsDao {


  /// Call all data in database
  Future<List<Dictionary>> allWords() async {
    /// Call database and access to database
    var db = await DatabaseHelper.databaseAccess();

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
    var db = await DatabaseHelper.databaseAccess();

    /// Query keyword in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM glossary WHERE wordEnglish like '%$searchWord%' or wordVietnamese like '%$searchWord%'");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Dictionary(row["word_id"], row["wordEnglish"], row["wordVietnamese"]);
    });
  }
}