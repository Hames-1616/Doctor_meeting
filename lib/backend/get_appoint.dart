import 'package:http/http.dart' as http;
import 'dart:convert';

String baseurl = "https://project-production-a953.up.railway.app/appoint";
Future<List<meet>> getappoint() async {
  var response = await http.get(Uri.parse(baseurl));
  if (response.statusCode == 200) {
    var jsondata = jsonDecode(response.body);
    print("connected");
    return meet.fromJsonList(jsondata);
  } else {
    return Future.error("error");
  }
}

class meet {
  final String name;
  final String patient;
  final String sent;
  final String category;
  final String slot;
  final String report;

  meet(
      {required this.name,
      required this.patient,
      required this.sent,
      required this.category,
      required this.slot,
      required this.report});

  factory meet.fromJson(Map<String, dynamic> json) {
    return meet(
        name: json['name'],
        patient: json['patient'],
        sent: json['sent'],
        category: json['category'],
        slot: json['slot'],
        report: json['report']
        );
  }
  static List<meet> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => meet.fromJson(e)).toList();
  }
}
