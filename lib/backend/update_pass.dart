import 'package:dio/dio.dart';

void updatepass(String Email,String password) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'Email':Email ,'password':password};
  Response res = await dio.post(
      "http://192.168.29.240:8000/update/",
      data: jsonMap);
}
