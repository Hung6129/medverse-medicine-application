import '/models/drug_model.dart';
import '/pages/drawer-items/test_image_from_sqlite/widgets/call_database.dart';

class SearchDao {


  /// Call all data in database
  Future<List<DrugModel>> allWords() async {
    /// Call database and access to database
    var db = await CallDatabase.databaseAccess();

    /// Query all data in database
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM drugs");
    print(maps);

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return DrugModel(row["drug_state"]);
    });
  }
}