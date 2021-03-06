import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inblex_app/shared/shared_preferences_manager.dart';

import 'package:inblex_app/theme/theme.dart';
import 'package:inblex_app/routes/routes.dart';

import 'package:inblex_app/models/get_hour_model.dart';
import 'package:inblex_app/services/auth_service.dart';
import 'package:inblex_app/services/list_project_user_service.dart';
import 'package:inblex_app/services/diary_user_service.dart';
 
void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new SharedPreferencesManager();
  await prefs.initPrefs();
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
        Provider(create: (_) => AuthService()),
        Provider(create: (_) => ListProjectUserService()),
        Provider(create: (_) => DiaryUserService()),
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