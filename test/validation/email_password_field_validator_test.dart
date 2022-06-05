import 'package:flutter_test/flutter_test.dart';
import 'package:medverse_mobile_app/utils/validation.dart';

void main() {
  test('invalid email return error string', () {

    final result = Validations.validateEmail('email');
    expect(result, 'Địa chỉ email không hợp lệ');
  });

  test('non-empty email returns null', () {

    final result = Validations.validateEmail('');
    expect(result, 'Hãy nhập Email.');
  });

  test('empty password returns error string', () {

    final result = Validations.validatePassword('');
    expect(result, 'Vui lòng nhập mật khẩu hợp lệ.');
  });

  test('non-empty password returns null', () {

    final result = Validations.validatePassword('password');
    expect(result, null);
  });
}