import 'package:hive/hive.dart';

part 'saved_drug_list_model.g.dart';

@HiveType(typeId: 0)
class SavedDrugListModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String tenThuoc;

  SavedDrugListModel({
    this.id,
    this.tenThuoc,
  });
}
