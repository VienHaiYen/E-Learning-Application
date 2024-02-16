import 'package:flutter/material.dart';
import 'package:elearning_app/src/models/course/course_category.dart';
import 'package:elearning_app/src/models/user/learn_topic.dart';
import 'package:elearning_app/src/models/user/test_preparation.dart';
import 'package:elearning_app/src/models/user/token.dart';
import 'package:elearning_app/src/models/user/user.dart';

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
    notifyListeners();
  }

  void logOut() {
    token = null;
    notifyListeners();
  }
}
