import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inblex_app/global/Environment.dart';
import 'package:inblex_app/models/get_list_diary_response.dart';
import 'package:inblex_app/models/topics_response.dart';
import 'package:inblex_app/shared/shared_preferences_manager.dart';


class DiaryUserService with ChangeNotifier {
  final pref = new SharedPreferencesManager();

  Future<List<ListDiaryResponse>> getListDairyUser() async {
    final token = pref.token;

    try {
      final resp = await http.get('${Environment.apiUrl}/agenda/cita', 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      final diary = listDiaryResponseFromJson(utf8.decode(resp.bodyBytes));

      return diary;
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteDairyUser( int id ) async {
    final token = pref.token;

    try {
      final resp = await http.delete('${Environment.apiUrl}/agenda/cita/$id', 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      final diaryResp = resp.body;

      print(diaryResp);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TopicResponse>> getTopic() async {
    final token = pref.token;

    try {
      final resp = await http.get('${ Environment.apiUrl }/agenda/cita/temas', 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      final decodedData = json.decode(utf8.decode(resp.bodyBytes));

      final topics = new Topics.fromJsonList(decodedData);

      // print(temas.items[0].tema)
      return topics.items;
    } catch (err) {
      return [];
    }

  }


}