import 'package:http/http.dart' as http;
import 'dart:convert';

String baseurl = "http://192.168.29.240:8000/doc";
Future<List<doct>> getdoc() async {
  var response = await http.get(Uri.parse(baseurl));
  if (response.statusCode == 200) {
    var jsondata = jsonDecode(response.body);
    print("connected");
    return doct.fromJsonList(jsondata);
  } else {
    return Future.error("error");
  }
}

class doct {
  final String service;
  final String image;

  
  doct({
 
    required this.service,
    required this.image,
  
   
  });

  factory doct.fromJson(Map<String, dynamic> json) {
    return doct(
       
        service: json['service'],
        image: json['image'],
    
 
        );
  }
  static List<doct> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => doct.fromJson(e)).toList();
  }
}
