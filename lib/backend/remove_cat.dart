import 'package:dio/dio.dart';

void removecat(String service) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'service':service };
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/delcate/",
      data: jsonMap);
}