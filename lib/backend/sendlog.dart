import 'package:dio/dio.dart';

void sendlog(String Email,String city,String phone,String password) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'Email':Email , 'city': city,'phone':phone,'password':password};
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/register/",
      data: jsonMap);
}
