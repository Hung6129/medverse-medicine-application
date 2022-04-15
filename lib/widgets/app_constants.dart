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
  static const String TYPE_AHEAD =
      "http://192.168.56.1:8080/products/name?name=";
  static const String POPULAR_TOP_10 =
      "http://192.168.56.1:8080/products/name?name=hung";
}
