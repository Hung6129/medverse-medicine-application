import 'package:medverse_mobile_app/models/drug_bank_db/drug_model.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import 'package:medverse_mobile_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Get a list of recommended item in api
class RecommenedData {
  static Future<List<ProductModel>> getRecommened() async {
    try {
      var response =
          await http.get(Uri.parse(Constants.PRODUCT_RECOMMENDED_TOP_10));
      if (response.statusCode == 200) {
        List listTrend = json.decode(response.body) as List;
        return listTrend.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception("No Internet Connection");
    }
  }
}

/// Get a list of popular item in api
class PopularData {
  static Future<List<ProductModel>> getPopular() async {
    try {
      var response =
          await http.get(Uri.parse(Constants.PRODUCT_POPULAR_TOP_10));
      if (response.statusCode == 200) {
        List listTrend = json.decode(response.body) as List;
        return listTrend.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception("No Internet Connection");
    }
  }
}

/// Get product drug infor
class ProductDrugInfoService {
  static Future<List<ProductDrugModel>> getProductDrugInfo() async {
    try {
      var response = await http.get(Uri.parse(Constants.PRODUCT_DRUG_INFOR));
      if (response.statusCode == 200) {
        List listTrend = json.decode(response.body) as List;
        return listTrend.map((e) => ProductDrugModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      print(Constants.PRODUCT_DRUG_INFOR);
      throw Exception("No Internet Connection");
    }
  }
}

/// Typeahead search call api
List<Map<String, dynamic>> data = [];

class TypeHead {
  static Future<List<Map<String, dynamic>>> getTypeAhead(String query) async {
    if (query.isEmpty && query.length < 2) {
      print("Hãy nhập ít nhất 3 kí tự");
      return Future.value(data);
    }
    http.Response resTypeAhead =
        await http.get(Uri.parse(Constants.PRODUCTNAME_TYPE_AHEAD + query));
    List<ProductModel> suggestion = [];
    if (resTypeAhead.statusCode == 200) {
      Iterable listTypeAhead = json.decode(resTypeAhead.body);
      suggestion = List<ProductModel>.from(
        listTypeAhead.map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    } else {
      print('Request failed with status: ${resTypeAhead.statusCode}.');
    }
    return Future.value(suggestion.map((e) => {"productName": e}).toList());
    // Future.value(
    // suggestion.map((e) => {'productName': e.productName}).toList());
  }
}
