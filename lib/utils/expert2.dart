// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:project/backend/get_appoint.dart';
import 'package:project/backend/meeting_register.dart';

import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/globals.dart';
import 'dart:io';

import 'package:dio/dio.dart' as deo;
import 'package:file_picker/file_picker.dart';

double prev = 0;

class expert2 extends StatefulWidget {
  final String service;
  final String place;
  final String category;
  const expert2(
      {super.key,
      required this.service,
      required this.place,
      required this.category});

  @override
  State<expert2> createState() => _expert2State();
}

class _expert2State extends State<expert2> {
  Future upload() async {
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
      dispurl = url;
      print(url);

      setState(() {
        uploade = false;
      });
    } else {
      print("Result is null");
    }
  }

  bool done = false;
  String name = "";
  static final GlobalKey<FormState> frmm =
      GlobalKey<FormState>(debugLabel: "key3");
  TextEditingController cone = new TextEditingController();
  String desk = "";
  bool expanded = false;
  bool updatereview = false;

  void check() {
    getappoint().then((value) {
      for (int i = 0; i < value.length; i++) {
        if (emailStored == value[i].sent && widget.service == value[i].name) {
          setState(() {
            done = true;
          });
          break;
        }
      }
    });
  }

  @override
  void initState() {
    check();
  }

  @override
  Widget build(BuildContext context) {
    bool zero = false;
    double rating = 0;

    double one = MediaQuery.of(context).size.height / hei(context, 79);
    double two = MediaQuery.of(context).size.height / hei(context, 65);
    return Form(
      key: frmm,
      child: InkResponse(
        onTap: () async {
          if (done == false) {
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        // backgroundColor: ,
                        content: Center(
                            heightFactor: 1,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter the name";
                                }
                              },
                              controller: cone,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Name",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                            )),
                        actions: [
                          Column(
                            children: [
                              Center(
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (frmm.currentState!.validate()) {
                                        if (name == "") {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "please Enter the name First");
                                        } else if (dispurl == null) {
                                          Fluttertoast.showToast(
                                              msg: "please upload the report");
                                        } else {
                                          int x = ran();
                                          meetingreg(widget.service, name,
                                              widget.category, x.toString());
                                          Get.back();
                                          Fluttertoast.showToast(
                                              msg: "Slot booked");
                                          setState(() {
                                            done = true;
                                          });
                                        }
                                      }
                                    },
                                    child: Text("Book Meeting")),
                              ),
                              uploade
                                  ? ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.to(upload());
                                      },
                                      child: Text("Upload"))
                                  : ElevatedButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: "Image Uploaded");
                                      },
                                      child: Text("Uploaded"))
                            ],
                          )
                        ]));
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        // backgroundColor: ,
                        content: const Center(
                          heightFactor: 1,
                          child: Text(
                            "Already booked",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: kpri,
                                fontSize: 18),
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Center(
                                  child: Text(
                                "OK",
                                style: TextStyle(
                                    // fontFamily: "Poppins",
                                    // color: kpri),
                                    ),
                              )))
                        ]));
          }
        },
        child: Container(
            //duration: Duration(milliseconds: 400),
            height: one,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),

            //width: MediaQuery.of(context).size.width/2,
            //height: MediaQuery.of(context).size.height/hei(context, 230),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue.shade50),
            child: Container(
                // alignment: Alignment.center,
                //height: 175,
                //width: 100,
                margin: EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            height: MediaQuery.of(context).size.height /
                                hei(context, 45),
                            width: MediaQuery.of(context).size.width /
                                wid(context, 30),
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://img.icons8.com/material-sharp/512/user.png",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(
                                      color: Colors.blue,
                                    ))),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10, left: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  widget.service,
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: "Poppins"),
                                ),
                                Text(
                                  widget.place,
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 12),
                                ),
                                SizedBox(
                                  //height: expanded ? 15 : 0,
                                  height: 15,
                                ),
                                //Text("Cleaning",style: TextStyle(fontFamily: "Poppins",fontSize: 12,color: Colors.black45),),
                                // SizedBox(height: MediaQuery.of(context).size.height/hei(context, 20),)
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  width:
                                      MediaQuery.of(context).size.width / 1.9,
                                  //margin: EdgeInsets.only(right: 20),
                                  /*FutureBuilder(
                                        future:
                                            Future.delayed(Duration(milliseconds: 400)),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return Text(widget.des,
                                                style: TextStyle(
                                                    fontSize: expanded ? 14 : 0,
                                                    fontFamily: "Poppins"));
                                          }
                                          return SizedBox(
                                            height: 0,
                                          );
                                        })*/
                                ),
                              ],
                            )),
                      ],
                    ),
                    //SizedBox(width: 70,),
                  ],
                ))),
      ),
    );
  }
}
