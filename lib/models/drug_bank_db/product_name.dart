class ProductName {
  String product_id;

  String product_name;

  String product_labeller;

  ProductName({
    this.product_id,
    this.product_name,
    this.product_labeller,
  });

  ProductName.fromJson(dynamic json) {
    product_id = json['product_id'];

    product_name = json['product_name'];

    product_labeller = json['product_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['productID'] = this.product_id;

    data['productName'] = this.product_name;

    data['productLabeller'] = this.product_labeller;

    return data;
  }
}
