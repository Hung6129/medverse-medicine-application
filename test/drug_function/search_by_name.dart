import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:medverse_mobile_app/utils/constants.dart';

void main() {
  group('getObjectData', () {
    test('returns data string when http response is successful', () async {
      final mockHTTPClient = MockClient((request) async {
        http.Response resData = await http.get(Uri.parse(
            Constants.BASE_URL + Constants.NAME_SEARCH_FAST + 'Tylenol'));
        return Response(resData.body, 200);
      });

      expect((mockHTTPClient), isA<String>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect((mockHTTPClient), 'Failed to fetch data');
    });
  });
}
