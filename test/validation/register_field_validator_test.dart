import 'package:flutter_test/flutter_test.dart';
import 'package:medverse_mobile_app/utils/validation.dart';

void main() {
  test('non-empty username return null', () {

    final result = Validations.validateName('');
    expect(result, 'Hãy nhập tên người dùng.');
  });

  test('non-empty username return null', () {

    final result = Validations.validateName('Phạm Quốc Duy');
    expect(result, 'Vui lòng chỉ nhập các ký tự chữ cái.');
  });
}