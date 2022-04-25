class ProductModel {
  String productID;
  String drugbankID;
  String productName;
  String productLabeller;
  String productImage;
  String productCode;
  String productRoute;
  String productStrength;
  String productdosage;
  String approved;
  String otc;
  String generic;
  String country;
  String drugName;
  String drugDescription;
  String drugState;
  String drugIndication;
  String drugPharmaco;
  String drugMechan;
  String drugToxicity;
  String drugMetabolism;
  String drugHalflife;
  String drugElimination;
  String drugClearance;

  ProductModel(
      {this.productID,
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
      this.drugClearance});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    drugbankID = json['drugbankID'];
    productName = json['productName'];
    productLabeller = json['productLabeller'];
    productLabeller = json['productImages'];
    productCode = json['productCode'];
    productRoute = json['productRoute'];
    productStrength = json['productStrength'];
    productdosage = json['productdosage'];
    approved = json['approved'];
    otc = json['otc'];
    generic = json['generic'];
    country = json['country'];
    drugName = json['drugName'];
    drugDescription = json['drugDescription'];
    drugState = json['drugState'];
    drugIndication = json['drugIndication'];
    drugPharmaco = json['drugPharmaco'];
    drugMechan = json['drugMechan'];
    drugToxicity = json['drugToxicity'];
    drugMetabolism = json['drugMetabolism'];
    drugHalflife = json['drugHalflife'];
    drugElimination = json['drugElimination'];
    drugClearance = json['drugClearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['drugbankID'] = this.drugbankID;
    data['productName'] = this.productName;
    data['productLabeller'] = this.productLabeller;
    data['productLabeller'] = this.productImage;
    data['productCode'] = this.productCode;
    data['productRoute'] = this.productRoute;
    data['productStrength'] = this.productStrength;
    data['productdosage'] = this.productdosage;
    data['approved'] = this.approved;
    data['otc'] = this.otc;
    data['generic'] = this.generic;
    data['country'] = this.country;
    data['drugbank_ID'] = this.drugbankID;
    data['drugName'] = this.drugName;
    data['drugDescription'] = this.drugDescription;
    data['drugState'] = this.drugState;
    data['drugIndication'] = this.drugIndication;
    data['drugPharmaco'] = this.drugPharmaco;
    data['drugMechan'] = this.drugMechan;
    data['drugToxicity'] = this.drugToxicity;
    data['drugMetabolism'] = this.drugMetabolism;
    data['drugHalflife'] = this.drugHalflife;
    data['drugElimination'] = this.drugElimination;
    data['drugClearance'] = this.drugClearance;
    return data;
  }
}
