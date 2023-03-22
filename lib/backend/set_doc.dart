import 'package:dio/dio.dart';
import 'package:project/utils/globals.dart';

void doc_s(String Slot,String doc) async {
  Dio dio = Dio();
  Map<String, String> jsonMap = {'name':doctorStored ,'slot':Slot,'doc':doc};
  Response res = await dio.post(
      "https://project-production-cc10.up.railway.app/updoc/",
      data: jsonMap);
}
