import 'package:hive/hive.dart';
part 'fav_drug_model.g.dart';

@HiveType(typeId: 0)
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

  FavDrugModel(
      {this.productID,
      this.drugbankID,
      this.productName,
      this.productLabeller,
      this.productCode,
      this.productRoute,
      this.productStrength,
      this.productdosage,
      this.approved,
      this.otc,
      this.generic,
      this.country});

  // FavDrugModel.fromJson(Map<String, dynamic> json) {
  //   productID = json['productID'];
  //   drugbankID = json['drugbankID'];
  //   productName = json['productName'];
  //   productLabeller = json['productLabeller'];
  //   productCode = json['productCode'];
  //   productRoute = json['productRoute'];
  //   productStrength = json['productStrength'];
  //   productdosage = json['productdosage'];
  //   approved = json['approved'];
  //   otc = json['otc'];
  //   generic = json['generic'];
  //   country = json['country'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['productID'] = this.productID;
  //   data['drugbankID'] = this.drugbankID;
  //   data['productName'] = this.productName;
  //   data['productLabeller'] = this.productLabeller;
  //   data['productCode'] = this.productCode;
  //   data['productRoute'] = this.productRoute;
  //   data['productStrength'] = this.productStrength;
  //   data['productdosage'] = this.productdosage;
  //   data['approved'] = this.approved;
  //   data['otc'] = this.otc;
  //   data['generic'] = this.generic;
  //   data['country'] = this.country;
  //   return data;
  // }
}
