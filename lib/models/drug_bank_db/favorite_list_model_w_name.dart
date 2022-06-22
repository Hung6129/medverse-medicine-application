class FavoriteListWName {
  String productID;
  String product_name;
  String product_labeller;
  String savedTime;
  FavoriteListWName({
    this.productID,
    this.product_name,
    this.product_labeller,
    this.savedTime,
  });

  // FavoriteListWName.fromJson(dynamic json) {
  //   productID = json['productID'];
  //   product_name = json['product_name'];
  //   savedTime = json['savedTime'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['productID'] = this.productID;
  //   data['product_name'] = this.product_name;
  //   data['savedTime'] = this.savedTime;
  //   return data;
  // }
}
