import 'package:flutter/material.dart';

import 'package:inblex_app/helpers/alert_message.dart';

import 'package:inblex_app/widgets/radial_progress.dart';

class Tab1HomePage extends StatefulWidget {
  @override
  _Tab1HomePageState createState() => _Tab1HomePageState();
}

class _Tab1HomePageState extends State<Tab1HomePage> {

  List<String> projects = [
    'Sistema de Información',
    'App Nutrición',
    'inblexApp',
    'QuinielaApp',
    'Página inblex',
    'Api-JWT (Seguridad)',
    'Strava Capital',
    'UberBandsApp',
  ];

  List<int> porcentajes = [
    100,
    53,
    78,
    18,
    88,
    17,
    69,
    0,
  ];

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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _HeaderTitle(),
            _ListProjects(projects, porcentajes, colors),
          ],
        ),
      ),
    ));
  }
}

class _HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin:
            EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: Text('Proyectos actuales',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w400)));
  }
}

class _ListProjects extends StatelessWidget {
  final List<String> projects;
  final List<int> porcentajes;
  final List<Color> colors;

  _ListProjects(this.projects, this.porcentajes, this.colors);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projects.length,
        itemBuilder: (context, i) {
          return _ListTitle(projects[i], porcentajes[i].toDouble(), colors[i]);
        });
  }
}

class _ListTitle extends StatelessWidget {
  final String projects;
  final double porcentajes;
  final Color color;

  _ListTitle(this.projects, this.porcentajes, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey[400],
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(1.0, 5.0))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 7.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: this.color),
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 0.75,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text('${this.projects}',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600)),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: 15.0, left: 10.0, right: 10.0),
                          child: Text('10 de Diciembre del 2022',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[500]))),
                      Container(
                          margin: EdgeInsets.only(
                              top: 15.0, left: 10.0, right: 10.0),
                          padding: EdgeInsets.only(
                              right: 20.0, left: 20.0, top: 2.0, bottom: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.indigo[200],
                          ),
                          child: Text('En desarrollo',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[100]))),
                    ],
                  ),
                  SizedBox(height: 25.0),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              width: 60.0,
              height: 60.0,
              child: CustomRadialProgress(
                  porcentaje: porcentajes, color: Colors.green[600]),
            ),
          ],
        ),
      ),
      onTap: () {
        showAlertMessage(context, '${this.projects}', 'En desarrollo');
      },
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
              grosorPrimario: 6.0,
              grosorSecundario: 5.0,
            ),
            Text(
              '$porcentaje %',
              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
