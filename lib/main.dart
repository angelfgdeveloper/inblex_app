import 'package:flutter/material.dart';

import 'package:inblex_app/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Colors.green[400],
        textSelectionColor: Colors.green[200],
        textSelectionHandleColor: Colors.green[400], 
      ),
      title: 'Material App',
      initialRoute: 'splashscreen',
      routes: appRoutes,
    );
  }
}