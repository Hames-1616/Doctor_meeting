import 'package:dio/dio.dart';
import 'package:project/utils/globals.dart';

void meetingreg(
    String name, String patient, String category, String slot) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {
    'name': name,
    'patient': patient,
    'sent': emailStored,
    'category': category,
    'slot': slot,
    'report': dispurl,
    'doc': "empty"
  };
  print(jsonMap);
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/book/",
      data: jsonMap);
}
