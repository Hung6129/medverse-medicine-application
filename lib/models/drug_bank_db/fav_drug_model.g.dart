// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_drug_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavDrugModelAdapter extends TypeAdapter<FavDrugModel> {
  @override
  final int typeId = 0;

  @override
  FavDrugModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavDrugModel(
      productID: fields[0] as String,
      drugbankID: fields[1] as String,
      productName: fields[2] as String,
      productLabeller: fields[3] as String,
      productCode: fields[4] as String,
      productRoute: fields[5] as String,
      productStrength: fields[6] as String,
      productdosage: fields[7] as String,
      approved: fields[8] as String,
      otc: fields[9] as String,
      generic: fields[10] as String,
      country: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavDrugModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.productID)
      ..writeByte(1)
      ..write(obj.drugbankID)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.productLabeller)
      ..writeByte(4)
      ..write(obj.productCode)
      ..writeByte(5)
      ..write(obj.productRoute)
      ..writeByte(6)
      ..write(obj.productStrength)
      ..writeByte(7)
      ..write(obj.productdosage)
      ..writeByte(8)
      ..write(obj.approved)
      ..writeByte(9)
      ..write(obj.otc)
      ..writeByte(10)
      ..write(obj.generic)
      ..writeByte(11)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavDrugModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
