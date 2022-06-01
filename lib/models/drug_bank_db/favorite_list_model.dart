class FavoriteList {
  String productID;
  String savedTime;
  FavoriteList({
    this.productID,
    this.savedTime,
  });

  FavoriteList.fromJson(dynamic json) {
    productID = json['productID'];
    savedTime = json['savedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['savedTime'] = this.savedTime;
    return data;
  }
}
