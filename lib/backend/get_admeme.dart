import 'package:http/http.dart' as http;
import 'dart:convert';

String baseurl = "http://192.168.29.240:8000/admeme";
Future<List<admeme>> getadmeme() async {
  var response = await http.get(Uri.parse(baseurl));
  if (response.statusCode == 200) {
    var jsondata = jsonDecode(response.body);
    print("connected");
    return admeme.fromJsonList(jsondata);
  } else {
    return Future.error("error");
  }
}

class admeme {
  final String user;
  final String password;
  

  admeme({required this.user, required this.password});

  factory admeme.fromJson(Map<String, dynamic> json) {
    return admeme(
        user: json['user'], password: json['password']);
  }
  static List<admeme> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => admeme.fromJson(e)).toList();
  }
}
