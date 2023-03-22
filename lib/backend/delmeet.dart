import 'package:dio/dio.dart';
import 'package:project/utils/globals.dart';

void delmeet(String name,String category) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'name':name , 'category': category};
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/delmeet/",
      data: jsonMap);
}
