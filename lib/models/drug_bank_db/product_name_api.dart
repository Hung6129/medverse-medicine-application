class ProductNameApi {
  String productID;
  String productName;
  String drugbankID;

  ProductNameApi({this.productID, this.productName, this.drugbankID});

  ProductNameApi.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    productName = json['productName'];
    drugbankID = json['drugbankID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['productName'] = this.productName;
    data['drugbankID'] = this.drugbankID;
    return data;
  }
}
