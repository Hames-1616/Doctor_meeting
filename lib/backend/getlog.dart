import 'package:http/http.dart' as http;
import 'dart:convert';

String baseurl = "https://project-production-a953.up.railway.app/";
Future<List<Userd>> getlog() async {
  var response = await http.get(Uri.parse(baseurl));
  if (response.statusCode == 200) {
    var jsondata = jsonDecode(response.body);
    print("connected");
    return Userd.fromJsonList(jsondata);
  } else {
    return Future.error("error");
  }
}

class Userd {
  final String Email;
  final String city;
  final String phone;
  final String password;
  
  Userd({
 
    required this.Email,
    required this.city,
    required this.password,
    required this.phone,
   
  });

  factory Userd.fromJson(Map<String, dynamic> json) {
    return Userd(
       
        Email: json['Email'],
        city: json['city'],
        password: json['password'],
        phone: json['phone']
 
        );
  }
  static List<Userd> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => Userd.fromJson(e)).toList();
  }
}
