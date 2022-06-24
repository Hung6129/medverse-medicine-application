class RecentSearchModel {
  String productname;
  String productlabeller;
  String productdosage;
  String productroute;
  String drugbankId;
  String productId;
  String count;

  RecentSearchModel(
      {this.productname,
      this.productlabeller,
      this.productdosage,
      this.productroute,
      this.drugbankId,
      this.productId,
      this.count});

  RecentSearchModel.fromJson(Map<String, dynamic> json) {
    productname = json['productname'];
    productlabeller = json['productlabeller'];
    productdosage = json['productdosage'];
    productroute = json['productroute'];
    drugbankId = json['drugbank_id'];
    productId = json['product_id'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productname'] = this.productname;
    data['productlabeller'] = this.productlabeller;
    data['productdosage'] = this.productdosage;
    data['productroute'] = this.productroute;
    data['drugbank_id'] = this.drugbankId;
    data['product_id'] = this.productId;
    data['count'] = this.count;
    return data;
  }
}
