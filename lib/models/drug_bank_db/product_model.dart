class ProductModel {
  String productID;
  String drugbankID;
  String productName;
  String productLabeller;
  String productCode;
  String productRoute;
  String productStrength;
  String productdosage;
  String approved;
  String otc;
  String generic;
  String country;

  ProductModel({
    this.productID,
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
    this.country,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    drugbankID = json['drugbankID'];
    productName = json['productName'];
    productLabeller = json['productLabeller'];
    productCode = json['productCode'];
    productRoute = json['productRoute'];
    productStrength = json['productStrength'];
    productdosage = json['productdosage'];
    approved = json['approved'];
    otc = json['otc'];
    generic = json['generic'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['drugbankID'] = this.drugbankID;
    data['productName'] = this.productName;
    data['productLabeller'] = this.productLabeller;
    data['productCode'] = this.productCode;
    data['productRoute'] = this.productRoute;
    data['productStrength'] = this.productStrength;
    data['productdosage'] = this.productdosage;
    data['approved'] = this.approved;
    data['otc'] = this.otc;
    data['generic'] = this.generic;
    data['country'] = this.country;
    return data;
  }
}
