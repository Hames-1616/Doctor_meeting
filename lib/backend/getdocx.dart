import 'package:http/http.dart' as http;
import 'dart:convert';

String baseurl = "https://project-production-cc10.up.railway.app/docx";
Future<List<docx>> getdocx() async {
  var response = await http.get(Uri.parse(baseurl));
  if (response.statusCode == 200) {
    var jsondata = jsonDecode(response.body);
    print("connected");
    return docx.fromJsonList(jsondata);
  } else {
    return Future.error("error");
  }
}

class docx {
  final String name;
  final String category;
  final String place;
  final String password;

  docx({required this.name, required this.category, required this.place,required this.password});

  factory docx.fromJson(Map<String, dynamic> json) {
    return docx(
        name: json['name'], category: json['category'], place: json['place'],password: json['password']);
  }
  static List<docx> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => docx.fromJson(e)).toList();
  }
}
