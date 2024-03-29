import 'dart:convert';

import 'package:http/http.dart';
import 'package:elearning_app/src/models/user/token.dart';
import 'package:elearning_app/src/models/user/user.dart';

class AuthService {
  static const baseUrl = 'https://sandbox.api.lettutor.com';

  static User parseUser(String responseBody) =>
      User.fromJson(jsonDecode(responseBody));

  static Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
    required Function(User, Token) onSuccess,
  }) async {
    final response = await post(
      Uri.parse("$baseUrl/auth/login"),
      body: {
        'email': email,
        'password': password,
      },
    );

    final jsonDecode = json.decode(response.body);

    if (response.statusCode != 200) {
      throw Exception(jsonDecode['message']);
    }

    final user = User.fromJson(jsonDecode['user']);
    final token = Token.fromJson(jsonDecode['tokens']);
    await onSuccess(user, token);
  }

  static loginByGoogle({
    required String accessToken,
    required Function(User, Token) onSuccess,
  }) async {
    final response = await post(
      Uri.parse("$baseUrl/auth/google"),
      body: {
        'access_token': accessToken,
      },
    );

    final jsonDecode = json.decode(response.body);
    if (response.statusCode != 200) {
      throw Exception(jsonDecode['message']);
    }

    final user = User.fromJson(jsonDecode['user']);
    final tokens = Token.fromJson(jsonDecode['tokens']);
    await onSuccess(user, tokens);
  }

  static loginByFacebook({
    required String accessToken,
    required Function(User, Token) onSuccess,
  }) async {
    final response = await post(
      Uri.parse("$baseUrl/auth/facebook"),
      body: {
        'access_token': accessToken,
      },
    );

    final jsonDecode = json.decode(response.body);
    if (response.statusCode != 200) {
      throw Exception(jsonDecode['message']);
    }

    final user = User.fromJson(jsonDecode['user']);
    final tokens = Token.fromJson(jsonDecode['tokens']);
    await onSuccess(user, tokens);
  }

  static Future<void> continueSession({
    required String refreshToken,
    required Function(User, Token) onSuccess,
  }) async {
    final response = await post(
      Uri.parse("$baseUrl/auth/refresh-token"),
      body: {
        'refreshToken': refreshToken,
        'timezone': "7",
      },
    );

    final jsonDecode = json.decode(response.body);
    if (response.statusCode != 200) {
      throw Exception(jsonDecode['message']);
    }

    final user = User.fromJson(jsonDecode['user']);
    final token = Token.fromJson(jsonDecode['tokens']);
    await onSuccess(user, token);
  }

  static Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await post(
      Uri.parse("$baseUrl/auth/register"),
      body: {
        'email': email,
        'password': password,
        "source": '',
      },
    );

    final jsonDecode = json.decode(response.body);
    if (response.statusCode != 201) {
      throw Exception(jsonDecode['message']);
    }
  }

  static Future<void> forgotPassword(String email) async {
    final response = await post(
      Uri.parse("$baseUrl/user/forgotPassword"),
      body: {
        'email': email,
      },
    );

    final jsonDecode = json.decode(response.body);
    if (response.statusCode != 200) {
      throw Exception(jsonDecode['message']);
    }
  }
}
