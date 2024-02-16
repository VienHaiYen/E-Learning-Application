import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  String language = 'en';

  void setLanguage(String language) {
    this.language = language;
    notifyListeners();
  }
}
