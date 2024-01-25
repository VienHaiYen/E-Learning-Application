import 'package:flutter/cupertino.dart';
import 'package:elearning_app/src/models/language/lang_en.dart';
import 'package:elearning_app/src/models/language/language.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  Language language = English();

  void setLanguage(Language language) {
    this.language = language;
    notifyListeners();
  }
}
