class ProductNameApi {
  String productID;
  String productName;
  String productCode;

  ProductNameApi({this.productID, this.productName, this.productCode});

  ProductNameApi.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    productName = json['productName'];
    productCode = json['productCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['productName'] = this.productName;
    data['productCode'] = this.productCode;
    return data;
  }
}
