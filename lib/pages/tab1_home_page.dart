import 'package:flutter/material.dart';
import 'package:inblex_app/models/project_user_response.dart';
import 'package:inblex_app/services/list_project_user_service.dart';
import 'package:inblex_app/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class Tab1HomePage extends StatefulWidget {
  @override
  _Tab1HomePageState createState() => _Tab1HomePageState();
}

class _Tab1HomePageState extends State<Tab1HomePage> {
 
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
              _HeaderTitle(),
              _ListProjects(),
            ],
          ),
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
            EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: Text('Proyectos actuales',
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w400)));
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
      
      if ( snapshot.hasData ) {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          itemBuilder: (context, i) {
            ProjectResponse project = snapshot.data[i];
            return _ListTitle(project, colors[i]);
          });
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
       },
    );
  }
}

class _ListTitle extends StatelessWidget {
  final ProjectResponse project;
  final Color color;

  _ListTitle(this.project, this.color);

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
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text('${this.project.nombre}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                    ),

                    Container(
                        margin:
                            EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                        child: Text('${this.project.fechaEstimada}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500]))),

                    // SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.indigo[200],
                ),
                child: Text((this.project.estado == 1) ? 'En desarrollo' : 'En pausa',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[100]))),

            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              width: 70.0,
              height: 70.0,
              child: CustomRadialProgress(
                  porcentaje: this.project.progresoTotal.toDouble(), color: Colors.green[600]),
            ),
          ],
        ),
      ),
      onTap: () {
        // showAlertMessage(context, '${this.projects}', 'En desarrollo');
        Navigator.pushNamed(context, 'details');
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
