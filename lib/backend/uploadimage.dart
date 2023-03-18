// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:project/utils/globals.dart';

// Future upload() async {
//   var dio = Dio();

//   FilePickerResult? result = await FilePicker.platform.pickFiles();

//   if (result != null) {
//     File file = File(result.files.single.path ?? " ");

//     String filename = file.path.split('/').last;
//     String filepath = file.path;

//     FormData data = FormData.fromMap({
//       'key': '4cb92b58872c98e6a2de37d59e07d345',
//       'image': await MultipartFile.fromFile(filepath, filename: filename),
//       'name': 'hames.jpg'
//     });

//     var response = await dio.post(
//       "https://api.imgbb.com/1/upload",
//       data: data,
//     );
//     print(response.data);
//     final parsedJson = response.data as Map<String, dynamic>;
//     final url = parsedJson['data']['display_url'] as String;

//     print(url);
//     uploade = false;
//   } else {
//     print("Result is null");
//   }
// }
