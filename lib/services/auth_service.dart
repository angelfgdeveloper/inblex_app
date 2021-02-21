import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inblex_app/global/Environment.dart';

import 'package:inblex_app/models/login_response.dart';
import 'package:inblex_app/models/user_response.dart';
import 'package:inblex_app/shared/shared_preferences_manager.dart';


class AuthService with ChangeNotifier {

  User user;
  bool _auth = false;
  final pref = SharedPreferencesManager();

  bool get auth => this._auth;
  set auth( bool value ) {
    this._auth = value;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {

    this.auth = true;

    final data = {
      'username': username,
      'password': password
    };

    final resp = await http.post('${ Environment.apiUrl }/login', 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    // print(resp.body);
    this.auth = false;

    if ( resp.statusCode == 200 ) {
      final loginResponse = loginResponseFromJson(utf8.decode(resp.bodyBytes));
      this.user = loginResponse.user;

      // Guardar token  en lugar seguro
      pref.token = loginResponse.token;
      return true;
    } else {
      return false;
    }

  }

}