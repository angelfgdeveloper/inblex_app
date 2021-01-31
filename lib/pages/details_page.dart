import 'package:flutter/material.dart';

// import 'package:inblex_app/helpers/alert_message.dart';
import 'package:inblex_app/helpers/alert_message_sprints.dart';

import 'package:inblex_app/widgets/radial_progress.dart';


class DetailsPage extends StatefulWidget {

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> sprints = [
    'Sprint 1',
    'Sprint 2',
    'Sprint 3',
    'Sprint 4'
  ];

  List<String> dates = [
    '30 de Julio - 06 de Agosto de 2020',
    '14 de Agosto - 20 de Agosto de 2020',
    '21 de Agosto - 05 de Septiembre de 2020',
    '12 de Septiembre - 06 de Noviembre de 2020'
  ];

  @override
  Widget build(BuildContext context) {
    final withSize = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(
                    top: 8.0, left: 16.0, right: 16.0, bottom: 14.0),
                width: withSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderTitle(),
                    _ProgressProject(),
                    SizedBox(height: 15.0),
                    Text(
                      'Descripción Veniam aliquip quis ut qui quis fugiat adipisicing. Non nostrud quis aliquip do et. Non nostrud quis aliquip do et. Non nostrud quis aliquip do et.',
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
                    _Sprints(sprints: sprints, dates: dates),
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
                        porcentaje: 73.0, color: Colors.green[600]
                      ),
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
                          Text('30 de Septiembre de 2020', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold )),
                          Text('Fecha prevista de entrega', style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w300 )),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
            )));
  }
}

class _Sprints extends StatelessWidget {
  const _Sprints({
    Key key,
    @required this.sprints,
    @required this.dates,
  }) : super(key: key);

  final List<String> sprints;
  final List<String> dates;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: sprints.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text('${sprints[i]}'),
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
            ),
            subtitle: Text('${dates[i]}'),
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
              '${dates[i]}',
              sprints,
              80
              );
            },
          );
        });
  }
}

class _ProgressProject extends StatelessWidget {
  const _ProgressProject({
    Key key,
  }) : super(key: key);

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
        child: Text('En desarrollo',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey[100])));
  }
}

class _HeaderTitle extends StatelessWidget {
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
            Text('Plantilla Sitio Web (SPA)',
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

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final double porcentaje;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        child: Stack(
      alignment: Alignment.center,
      children: [
        RadialProgress(
          porcentaje: porcentaje,
          colorPrimario: this.color,
          colorSecundario: Colors.green[100],
          grosorPrimario: 12.0,
          grosorSecundario: 10.0,
        ),
        Text(
          '$porcentaje %',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
