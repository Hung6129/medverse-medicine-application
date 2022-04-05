// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_drug_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedDrugListModelAdapter extends TypeAdapter<SavedDrugListModel> {
  @override
  final int typeId = 0;

  @override
  SavedDrugListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedDrugListModel(
      id: fields[0] as String,
      tenThuoc: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedDrugListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tenThuoc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedDrugListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
