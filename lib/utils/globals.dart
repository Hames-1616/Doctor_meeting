import 'package:shared_preferences/shared_preferences.dart';

late String emailStored;
late String passwordStored;
late String doctorStored;
bool b = false;

Future<void> saveusersession(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
}

Future<void> deleteusersession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('email');
  b = false;
  //await prefs.remove('phone');
}

Future<String?> getsession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

Future<void> checkforsaved() async {
  String? email = await getsession();

  if (email != null) {
    b = true;
  }
  emailStored = email!;
}
