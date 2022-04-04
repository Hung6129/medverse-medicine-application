import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({
    this.height,
    this.weight,
  });

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Thừa cân';
    } else if (_bmi > 18.5) {
      return 'Bình thường';
    } else {
      return 'Thiếu cân';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Bạn có trọng lượng cơ thể cao hơn bình thường. Cố gắng tập thể dục nhiều hơn.';
    } else if (_bmi >= 18.5) {
      return 'Bạn có trọng lượng cơ thể bình thường. Làm tốt lắm!';
    } else {
      return 'Bạn có trọng lượng cơ thể thấp hơn bình thường. Bạn có thể ăn nhiều hơn một chút.';
    }
  }
}
