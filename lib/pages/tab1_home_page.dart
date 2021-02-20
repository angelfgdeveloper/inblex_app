import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:inblex_app/services/list_project_user_service.dart';

import 'package:inblex_app/models/project_user_response.dart';

import 'package:inblex_app/widgets/header_title.dart';
import 'package:inblex_app/widgets/list_title_projects_user.dart';

class Tab1HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                HeaderTitle(title: 'Proyectos actuales'),
                _ListProjects(),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _ListProjects extends StatelessWidget {
  final List<Color> colors = [
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.blueGrey,
    Colors.orange,
    Colors.black26,
    Colors.yellowAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final projectUserService = Provider.of<ListProjectUserService>(context);
    return FutureBuilder(
      future: projectUserService.getListProjectUser(),
      builder: (BuildContext context, AsyncSnapshot<List<ProjectResponse>> snapshot) {
        if (snapshot.hasData) {
          if( snapshot.data.length != 0) {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                ProjectResponse project = snapshot.data[i];
                return ListTitleProjectUser(
                  project: project, 
                  color: colors[i * 2]
                );
              }
            );
          } else {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Text('No hay datos de proyecto\npor favor agende uno nuevo en eventos\nó revise su conexión a internet',
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300
                  )
                ),
              ),
            );
          }
        } else {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}