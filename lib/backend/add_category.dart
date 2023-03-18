import 'package:dio/dio.dart';

void addservice(String service,String image) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'service':service , 'image': image};
  Response res = await dio.post(
      "https://project-production-a953.up.railway.app/addservice/",
      data: jsonMap);
}
