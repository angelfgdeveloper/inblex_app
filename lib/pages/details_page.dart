import 'package:flutter/material.dart';
import 'package:inblex_app/widgets/custom_radial_progress.dart';
import 'package:provider/provider.dart';

import 'package:inblex_app/helpers/alert_message_sprints.dart';
import 'package:inblex_app/services/list_project_user_service.dart';

import 'package:inblex_app/models/project_show_response.dart';


class DetailsPage extends StatelessWidget {

  final List<String> sprints = [
    'Sprint 1',
    'Sprint 2',
    'Sprint 3',
    'Sprint 4'
  ];

  final List<String> dates = [
    '30 de Julio - 06 de Agosto de 2020',
    '14 de Agosto - 20 de Agosto de 2020',
    '21 de Agosto - 05 de Septiembre de 2020',
    '12 de Septiembre - 06 de Noviembre de 2020'
  ];

  @override
  Widget build(BuildContext context) {
    final withSize = MediaQuery.of(context).size.width;
    final int id = ModalRoute.of(context).settings.arguments;
    final projectUserService = Provider.of<ListProjectUserService>(context);

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: FutureBuilder(
                  future: projectUserService.getOneProjectUser(id),
                  builder: (BuildContext context, AsyncSnapshot<ProjectShowResponse> snapshot) {

                    if ( snapshot.hasData ) {
                      return Container(
                        padding: EdgeInsets.only(top: 25.0, left: 16.0, right: 16.0, bottom: 14.0),
                        width: withSize,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeaderTitle(title: snapshot.data.nombre),
                            _ProgressProject(status: snapshot.data.estado),
                            SizedBox(height: 15.0),
                            Text(
                              snapshot.data.descripcion,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Sprints',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 5.0),
                            _Sprints(sprints: snapshot.data.sprints),
                            SizedBox(height: 5.0),
                            Text(
                              'Progreso del proyecto',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              width: double.infinity,
                              height: 120.0,
                              child: CustomRadialProgress(
                                porcent: snapshot.data.progresoTotal.toDouble(),
                                color: Colors.green[600],
                                grosorPrimary: 12.0,
                                grosorSecundary: 10.0,
                                textSize: 24.0,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              width: double.infinity,
                              height: 80.0,
                              padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 2.0, bottom: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.greenAccent[200],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(snapshot.data.fechaEstimada, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold )),
                                  Text('Fecha prevista de entrega', style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w300 )),
                                ],
                              ),

                            ),
                          ],
                        ),
                      );
                      
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
                ),
              ),
            )));
  }
}

class _Sprints extends StatelessWidget {

  final List<Sprint> sprints;

  const _Sprints({
    @required this.sprints,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: sprints.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text('Sprint: ${i + 1}'),
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
            ),
            subtitle: Text('${sprints[i].fechaInicio} - ${sprints[i].fechaFin}'),
            trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  textDirection: TextDirection.ltr,
                ),
                tooltip: 'Detalles',
                iconSize: 12.0,
                splashRadius: 25.0,
                onPressed: null),
            onTap: () {
              showAlertMessageSprints(
                context, 
              'Excepteur do ea enim labore non Lorem incididunt dolor tempor est incididunt.Excepteur do ea enim labore non Lorem incididunt dolor tempor est incididunt.Excepteur do ea enim labore non Lorem incididunt dolor tempor est incididunt.', 
              '${sprints[i].fechaInicio} - ${sprints[i].fechaFin}',
              sprints,
              sprints[i].progreso
              );
            },
          );
        });
  }
}

class _ProgressProject extends StatelessWidget {
  final int status;

  const _ProgressProject({
    @required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        padding:
            EdgeInsets.only(right: 20.0, left: 20.0, top: 4.0, bottom: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.indigo[200],
        ),
        child: Text((this.status == 1) ? 'En desarrollo' : 'En pausa',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey[100])));
  }
}

class _HeaderTitle extends StatelessWidget {
  final String title;

  const _HeaderTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0, 
      runSpacing: 5.0, 
      direction: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                iconSize: 25.0,
                splashRadius: 25.0,
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 10.0,
            ),
            Text(this.title,
              overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ],
    );
  }
}

