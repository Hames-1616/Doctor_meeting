import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/backend/getlog.dart';
import 'package:project/backend/sendlog.dart';
import 'package:project/screens/patient_login.dart';
import 'package:project/utils/globals.dart';

import '../utils/customtextfield.dart';

class registerp extends StatefulWidget {
  const registerp({super.key});

  @override
  State<registerp> createState() => _registerpState();
}

class _registerpState extends State<registerp> {
  late List<Userd> user;
  @override
  void initState() {
    super.initState();
    getlog().then((value) {
      user = value;
    });
  }

  bool pre = false;
  String mail = "";
  String place = "";
  String number = "";
  String conf = "";
  String password = "";
  static final GlobalKey<FormState> frm =
      GlobalKey<FormState>(debugLabel: "key2");
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController cpass = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                email.clear();
                pass.clear();
                city.clear();
                cpass.clear();
                phone.clear();
                FocusScope.of(context).unfocus();
                Get.back();
              },
              icon: Container(
                decoration: BoxDecoration(
                  // color: lpri,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    // color: lpri,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              )),
        ),
        body: Form(
          key: frm,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  hintText: "Email",
                  icon: Icons.email,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      mail = value;
                    });
                  },
                  con: email),
              CustomTextField(
                  hintText: "City",
                  icon: Icons.place,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      place = value;
                    });
                  },
                  con: city),
              CustomTextField(
                  hintText: "Phone",
                  icon: Icons.phone,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      number = value;
                    });
                  },
                  con: phone),
              CustomTextField(
                  obscureText: true,
                  hintText: "Password",
                  icon: Icons.password,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  con: pass),
              CustomTextField(
                  obscureText: true,
                  c: conf,
                  p: password,
                  hintText: "Confirm Password",
                  icon: Icons.password,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      conf = value;
                    });
                  },
                  con: cpass),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (frm.currentState!.validate()) {
                      for (int i = 0; i < user.length; i++) {
                        if (mail == user[i].Email || number == user[i].phone) {
                          pre = true;
                          break;
                        }
                      }

                      if (pre) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    // backgroundColor: ,
                                    content: const Center(
                                      heightFactor: 1,
                                      child: Text(
                                        "Credentials already exist",
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
                      } else {
                        emailStored = mail;
                        sendlog(mail, place, number, password);
                        Get.offAll(patientlog());
                      }
                      // Get.offAll(patientlog());
                    }
                  },
                  child: Text("Register")),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}
