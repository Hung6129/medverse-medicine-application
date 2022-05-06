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
      productImage: fields[12] as String,
      productCode: fields[4] as String,
      productRoute: fields[5] as String,
      productStrength: fields[6] as String,
      productdosage: fields[7] as String,
      approved: fields[8] as String,
      otc: fields[9] as String,
      generic: fields[10] as String,
      country: fields[11] as String,
      drugName: fields[13] as String,
      drugDescription: fields[14] as String,
      drugState: fields[15] as String,
      drugIndication: fields[16] as String,
      drugPharmaco: fields[17] as String,
      drugMechan: fields[18] as String,
      drugToxicity: fields[19] as String,
      drugMetabolism: fields[20] as String,
      drugHalflife: fields[21] as String,
      drugElimination: fields[22] as String,
      drugClearance: fields[23] as String,
      // savedTime: fields[24] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavDrugModel obj) {
    writer
      ..writeByte(25)
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
      ..write(obj.country)
      ..writeByte(12)
      ..write(obj.productImage)
      ..writeByte(13)
      ..write(obj.drugName)
      ..writeByte(14)
      ..write(obj.drugDescription)
      ..writeByte(15)
      ..write(obj.drugState)
      ..writeByte(16)
      ..write(obj.drugIndication)
      ..writeByte(17)
      ..write(obj.drugPharmaco)
      ..writeByte(18)
      ..write(obj.drugMechan)
      ..writeByte(19)
      ..write(obj.drugToxicity)
      ..writeByte(20)
      ..write(obj.drugMetabolism)
      ..writeByte(21)
      ..write(obj.drugHalflife)
      ..writeByte(22)
      ..write(obj.drugElimination)
      ..writeByte(23)
      ..write(obj.drugClearance);
    // ..writeByte(24)
    // ..write(obj.savedTime);
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
