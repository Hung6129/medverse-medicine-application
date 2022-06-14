class ProductNameApiFast {
  String productID;
  String name;

  ProductNameApiFast({this.productID, this.name});

  ProductNameApiFast.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['name'] = this.name;

    return data;
  }
}
