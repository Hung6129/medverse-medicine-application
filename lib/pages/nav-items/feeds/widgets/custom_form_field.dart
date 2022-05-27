import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key key,
    TextEditingController controller,
    FocusNode focusNode,
    TextInputType keyboardType,
    TextInputAction inputAction,
    String label,
    String hint,
    String initialValue,
    Function(String value) validator,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
  })  : _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _label = label,
        _initialValue = initialValue,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final String _initialValue;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final bool isLabelEnabled;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: MobileTextTheme().inputDescriptionAndLocation,
      initialValue: _initialValue,
      maxLines: maxLines,
      keyboardType: _keyboardtype,
      obscureText: isObscure,
      textCapitalization:
          isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: Colors.yellowAccent,
      validator: (value) => _validator(value),
      decoration: InputDecoration(
        labelText: isLabelEnabled ? _label : null,
        labelStyle: TextStyle(color: Colors.yellowAccent),
        hintText: _hint,
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
