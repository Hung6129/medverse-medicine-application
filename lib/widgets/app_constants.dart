class AppConstants {
  // Test URL
  static const String BASE_URL =
      "https://drugbank.vn/services/drugbank/api/public/thuoc";
  static const String BASE_URL_TYPEAHEAD =
      "https://drugbank.vn/services/drugbank/api/public/thuoc?tenThuoc=";
  static const String POPULAR_PRODUCT_URI = "?tenThuoc=ok&size=5";
}

// DrugDB URL
class ApiConstants {
  static const String PRODUCT =
      "http://192.168.1.4:8080/products/id?productId=PID000001";
  static const String POPULAR_TOP_10 =
      "http://192.168.1.4:8080/products/name?name=Paramettes%20Syrup";
}
