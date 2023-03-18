import 'package:dio/dio.dart';
import 'package:project/utils/globals.dart';

void meetingreg(String name,String patient,String category) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'name':name , 'patient': patient,'sent':emailStored,'category':category};
  Response res = await dio.post(
      "https://project-production-a953.up.railway.app/meeting/",
      data: jsonMap);
}
