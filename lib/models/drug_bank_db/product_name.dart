class ProductName {
  String product_id;
  String product_name;
  String product_code;

  ProductName({
    this.product_id,
    this.product_name,
    this.product_code,
  });

  ProductName.fromJson(dynamic json) {
    product_id = json['product_id'];
    product_name = json['product_name'];
    product_code = json['product_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.product_id;
    data['productName'] = this.product_name;
    data['productCode'] = this.product_code.toString();

    return data;
  }
}