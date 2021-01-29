import 'package:flutter/material.dart';

import 'package:inblex_app/pages/splash_screen_page.dart';
import 'package:inblex_app/pages/register_user_page.dart';
import 'package:inblex_app/pages/login_page.dart';
import 'package:inblex_app/pages/forgot_password_page.dart';
import 'package:inblex_app/pages/home_page.dart';
import 'package:inblex_app/pages/details_page.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {

  'splashscreen': ( _ ) => SplashScreenPage(),
  'login': ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterUserPage(),
  'forgot': ( _ ) => ForgotPasswordPage(),
  'home': ( _ ) => HomePage(),
  'details': ( _ ) => DetailsPage(),

};