import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  static final SharedPreferencesManager _instance = new SharedPreferencesManager._internal();

   factory SharedPreferencesManager(){
    return _instance;
  }

  SharedPreferencesManager._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET Y SET del nombre de usuario
  get token{
    return _prefs.getString('token') ?? '';
  }

  set token(String value){
    _prefs.setString('token', value);
  }
  
}
