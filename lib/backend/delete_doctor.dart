import 'package:dio/dio.dart';

void del_doc(String name,String category) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'name':name , 'category': category};
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/deldoc/",
      data: jsonMap);
}
