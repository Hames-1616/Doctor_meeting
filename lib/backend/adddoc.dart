import 'package:dio/dio.dart';

void add_doc(String name,String password,String place,String category) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'name':name , 'password': password,'place':place,'category':category};
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/adddoc/",
      data: jsonMap);
}
