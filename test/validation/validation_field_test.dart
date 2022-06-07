import 'package:flutter_test/flutter_test.dart';
import 'package:medverse_mobile_app/utils/validation.dart';

void main() {
  test('non-empty drug description return error string', () {

    final result = Validations.validateField(value: '');
    expect(result, 'Mời bạn nhập mô tả thuốc');
  });

  test('non-empty validation description return error string', () {

    final result = Validations.validateDescription(value: '');
    expect(result, 'Trường thông tin này không được bỏ trống');
  });

  test('check list array', () {

    final result = Validations.badWord;
    expect(result, ['cc', 'fuck', 'dm', 'đệt', 'cặc', 'đụ', 'địt', 'chó', 'đẻ', 'ngu', 'mẹ', 'má', 'fa', 'kè', 'tiệt', 'cờ hó', 'dcm', 'dmm']);
  });
}