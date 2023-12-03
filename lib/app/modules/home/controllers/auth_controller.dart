import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController._privateConstructor();
  static final AuthController _instance = AuthController._privateConstructor();
  static AuthController get instance => _instance;

   Future<String?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('session');
  }
}
