// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:project/backend/get_appoint.dart';
import 'package:project/backend/meeting_register.dart';
import 'package:project/screens/test.dart';

import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/globals.dart';
import 'dart:io';

import 'package:dio/dio.dart' as deo;
import 'package:file_picker/file_picker.dart';

double prev = 0;

class expertr extends StatefulWidget {
  final String service;
  final String place;
  final String category;
  final String image;

  const expertr(
      {super.key,
      required this.service,
      required this.place,
      required this.category,
      required this.image});

  @override
  State<expertr> createState() => _expertrState();
}

class _expertrState extends State<expertr> {
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
        onTap: () {
          Get.to(disp(image: widget.image));
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
                                  widget.category,
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
