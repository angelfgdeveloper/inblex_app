import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inblex_app/models/get_hour_model.dart';

import 'package:inblex_app/routes/routes.dart';
import 'package:inblex_app/theme/theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
 
void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp()); 
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
        
    return MultiProvider(
      providers: [
        Provider(create: (_) => HourModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('es'), 
        ],
        theme: myTheme,
        title: 'inblexApp',
        initialRoute: 'splashscreen',
        routes: appRoutes,
      ),
    );
  }
}