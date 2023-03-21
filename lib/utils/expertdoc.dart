import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/delmeet.dart';
import 'package:project/backend/set_doc.dart';
import 'package:project/screens/doctor_center.dart';
import 'package:project/screens/doctor_meetings.dart';
import 'package:project/screens/test.dart';
import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/globals.dart';
import 'package:dio/dio.dart' as deo;

class expertdoc extends StatefulWidget {
  final String name;
  final String category;
  final String slot;
  final String report;
  expertdoc(
      {super.key,
      required this.name,
      required this.category,
      required this.slot,
      required this.report});

  @override
  State<expertdoc> createState() => _expertdocState();
}

class _expertdocState extends State<expertdoc> {
  Future upl() async {
    var dio = deo.Dio();

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");

      String filename = file.path.split('/').last;
      String filepath = file.path;

      deo.FormData data = deo.FormData.fromMap({
        'key': '4cb92b58872c98e6a2de37d59e07d345',
        'image': await deo.MultipartFile.fromFile(filepath, filename: filename),
        'name': 'hames.jpg'
      });

      var response = await dio.post(
        "https://api.imgbb.com/1/upload",
        data: data,
      );
      print(response.data);
      final parsedJson = response.data as Map<String, dynamic>;
      final url = parsedJson['data']['display_url'] as String;
      responddoc = url;
      print(url);

      setState(() {
        uplo = false;
      });
    } else {
      print("Result is null");
    }
  }

  bool uplo = true;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  actions: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    print(doctorStored);
                                    delmeet(doctorStored, widget.category);
                                    Get.offAll(doctor_center());
                                  },
                                  child: Text("Delete")),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(disp(image: widget.report));
                                  },
                                  child: Text("Report")),
                              uplo
                                  ? ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                        upl();
                                      },
                                      child: Text("Upload"))
                                  : ElevatedButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: "Image Uploaded");
                                      },
                                      child: Text("Uploaded"))
                            ],
                          ),
                        ),
                        uplo
                            ? Container()
                            : ElevatedButton(
                                onPressed: () {
                                  doc_s(widget.slot, responddoc);
                                  Get.back();
                                  Fluttertoast.showToast(msg: "Submitted");
                                },
                                child: Text("Send"))
                      ],
                    )
                  ],
                ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue.shade50,
        ),
        margin: EdgeInsets.only(right: 40, left: 40, bottom: 20),
        height: MediaQuery.of(context).size.height / hei(context, 70),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / hei(context, 40),
            width: MediaQuery.of(context).size.width / wid(context, 40),
            child: CachedNetworkImage(
                imageUrl:
                    "https://img.icons8.com/ultraviolet/512/administrator-male.png",
                placeholder: (context, url) => const CircularProgressIndicator(
                      color: Colors.blue,
                    )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / wid(context, 230),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.category,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Slot"),
              Text(
                widget.slot,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
