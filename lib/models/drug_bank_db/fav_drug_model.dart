import 'package:hive/hive.dart';
part 'fav_drug_model.g.dart';

@HiveType(typeId: 1)
class FavDrugModel {
  @HiveField(0)
  String productID;
  @HiveField(1)
  String drugbankID;
  @HiveField(2)
  String productName;
  @HiveField(3)
  String productLabeller;
  @HiveField(4)
  String productCode;
  @HiveField(5)
  String productRoute;
  @HiveField(6)
  String productStrength;
  @HiveField(7)
  String productdosage;
  @HiveField(8)
  String approved;
  @HiveField(9)
  String otc;
  @HiveField(10)
  String generic;
  @HiveField(11)
  String country;
  @HiveField(12)
  String productImage;
  @HiveField(13)
  String drugName;
  @HiveField(14)
  String drugDescription;
  @HiveField(15)
  String drugState;
  @HiveField(16)
  String drugIndication;
  @HiveField(17)
  String drugPharmaco;
  @HiveField(18)
  String drugMechan;
  @HiveField(19)
  String drugToxicity;
  @HiveField(20)
  String drugMetabolism;
  @HiveField(21)
  String drugHalflife;
  @HiveField(22)
  String drugElimination;
  @HiveField(23)
  String drugClearance;

  FavDrugModel({
    this.productID,
    this.drugbankID,
    this.productName,
    this.productLabeller,
    this.productImage,
    this.productCode,
    this.productRoute,
    this.productStrength,
    this.productdosage,
    this.approved,
    this.otc,
    this.generic,
    this.country,
    this.drugName,
    this.drugDescription,
    this.drugState,
    this.drugIndication,
    this.drugPharmaco,
    this.drugMechan,
    this.drugToxicity,
    this.drugMetabolism,
    this.drugHalflife,
    this.drugElimination,
    this.drugClearance,
  });
}
