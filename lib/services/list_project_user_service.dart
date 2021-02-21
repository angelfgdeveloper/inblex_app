import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inblex_app/global/Environment.dart';
import 'package:inblex_app/models/project_show_response.dart';
import 'package:inblex_app/models/project_user_response.dart';
import 'package:inblex_app/models/sprint_project_response.dart';
import 'package:inblex_app/shared/shared_preferences_manager.dart';

class ListProjectUserService {
  final pref = new SharedPreferencesManager();

  Future<List<ProjectResponse>> getListProjectUser() async {
    final token = pref.token;

    try {
      final resp = await http.get('${Environment.apiUrl}/proyectos', headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });


      final projects = projectResponseFromJson(utf8.decode(resp.bodyBytes));

      return projects;
    } catch (e) {
      return [];
    }
  }

  Future<ProjectShowResponse> getOneProjectUser( int id ) async {
    final token = pref.token;

    try {
      final resp = await http.get('${Environment.apiUrl}/proyectos/show/$id', 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      final oneProjectUser = projectShowResponseFromJson(utf8.decode(resp.bodyBytes));

      return oneProjectUser;
    } catch (e) {
      return e;
    }
  }

  Future<SprintResponse> getSprintProject( int id ) async {
    final token = pref.token;

    try {
      final resp = await http.get('${ Environment.apiUrl }/proyectos/sprints/show/$id', 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      final sprintProject = sprintResponseFromJson(utf8.decode(resp.bodyBytes));

      return sprintProject;
    } catch (err) {
      return err;
    }

  }

}
