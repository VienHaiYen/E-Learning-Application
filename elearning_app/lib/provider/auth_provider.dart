import 'package:flutter/material.dart';
import 'package:elearning_app/models/user/user.dart';
import 'package:elearning_app/models/user/learn_topic.dart';
import 'package:elearning_app/models/user/test_preparation.dart';
import 'package:elearning_app/models/user/token.dart';

class AuthProvider extends ChangeNotifier {
  late User currentUser;
  Token? token;
  List<LearnTopic> learnTopics = [];
  List<TestPreparation> testPreparations = [];

  void setLearnTopic(List<LearnTopic> learnTopics) {
    this.learnTopics = learnTopics;
    notifyListeners();
  }

  void setTestPreparation(List<TestPreparation> testPreparations) {
    this.testPreparations = testPreparations;
    notifyListeners();
  }

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  void logIn(User user, Token token) {
    currentUser = user;
    this.token = token;
    // print(token.access!.token);
    notifyListeners();
  }

  void logOut() {
    token = null;
    notifyListeners();
  }
}
