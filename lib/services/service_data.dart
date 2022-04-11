import '/models/test/drugs_product_test.dart';
import '/widgets/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Get a list of data item in api
class RecommenedData {
  static Future<List<drugProductTest>> getRecommened() async {
    try {
      var response = await http.get(Uri.parse(AppConstants.BASE_URL+AppConstants.POPULAR_PRODUCT_URI));
      if (response.statusCode == 200) {
        List listTrend = json.decode(response.body) as List;
        return listTrend.map((e) => drugProductTest.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception("No Internet Connection");
    }
  }
}

List<Map<String, dynamic>> data = [];

/// Typeahead search call api
class typeAhead {
  static Future<List<Map<String, dynamic>>> getTypeAhead(String query) async {
    if (query.isEmpty || query.length < 2) {
      print("Hãy nhập ít nhất 3 kí tự");
      return Future.value(data);
    }
    http.Response resTypeAhead =
        await http.get(Uri.parse(AppConstants.BASE_URL_TYPEAHEAD + query));
    List<drugProductTest> suggestion = [];
    if (resTypeAhead.statusCode == 200) {
      Iterable listTypeAhead = json.decode(resTypeAhead.body);
      suggestion = List<drugProductTest>.from(
          listTypeAhead.map((e) => drugProductTest.fromJson(e)));
    } else {
      print('Request failed with status: ${resTypeAhead.statusCode}.');
    }
    return Future.value(
        suggestion.map((e) => {'tenThuoc': e.tenThuoc}).toList());
  }
}
