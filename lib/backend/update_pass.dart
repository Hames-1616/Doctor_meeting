import 'package:dio/dio.dart';

void updatepass(String Email,String password) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'Email':Email ,'password':password};
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/update/",
      data: jsonMap);
}
