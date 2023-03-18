// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:project/backend/get_appoint.dart';
import 'package:project/backend/meeting_register.dart';

import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/globals.dart';

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
          if (done == false) {
            showDialog(
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
                              // ElevatedButton(
                              //     onPressed: () {
                              //       Get.to(MyImageUploader());
                              //     },
                              //     child: Text("Upload"))
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
