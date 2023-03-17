import 'package:dio/dio.dart';

void addservice(String service,String image) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'service':service , 'image': image};
  Response res = await dio.post(
      "http://192.168.29.240:8000/addservice/",
      data: jsonMap);
}
