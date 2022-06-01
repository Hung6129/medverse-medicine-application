/*
import 'package:flutter/cupertino.dart';
import 'package:google_translate/models/language.dart';
import 'package:google_translator/google_translator.dart';
import 'package:translator/translator.dart';


class TranslateProvider with ChangeNotifier{
  bool _isTranslating = false;
  String _textToTranslate = "";
  Language _firstLanguage = Language('en', 'English', true, true, true);
  Language _secondLanguage = Language('vi', 'Vietnamese', true, true, true);

  setIsTranslating(bool isTranslating) {
    _isTranslating = isTranslating;
    notifyListeners();
  }

  setTextToTranslate(String text) {
    _textToTranslate = text;
    notifyListeners();
  }

  changeLanguages(Language firstLanguage, Language secondLanguage) {
    _firstLanguage = firstLanguage;
    _secondLanguage = secondLanguage;

    notifyListeners();
  }

  Language get firstLanguage => _firstLanguage;

  Language get secondLanguage => _secondLanguage;

  bool get isTranslating => _isTranslating;

  String get textToTranslate => _textToTranslate;


}*/
