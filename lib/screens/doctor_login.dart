import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/getdocx.dart';
import 'package:project/screens/doctor_center.dart';
import 'package:project/screens/doctor_meetings.dart';
import 'package:project/utils/customtextfield.dart';
import 'package:project/utils/globals.dart';

class doctorLogin extends StatefulWidget {
  const doctorLogin({super.key});

  @override
  State<doctorLogin> createState() => _doctorLoginState();
}

class _doctorLoginState extends State<doctorLogin> {
  late List<docx> d;
  bool login = false;
  @override
  void initState() {
    super.initState();
    getdocx().then((value) {
      d = value;
    });
  }

  String id = "";
  String category = "";
  String password = "";
  TextEditingController name = new TextEditingController();
  TextEditingController cat = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
              hintText: "Name",
              icon: Icons.account_circle_rounded,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  id = value;
                });
              },
              con: name),
          CustomTextField(
              hintText: "Category",
              icon: Icons.category,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                category = value;
              },
              con: cat),
          CustomTextField(
            obscureText: true,
              hintText: "Password",
              icon: Icons.account_circle_rounded,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                password = value;
              },
              con: pass),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                for (int i = 0; i < d.length; i++) {
                  if (d[i].name == id &&
                      d[i].category == category &&
                      d[i].password == password) {
                    login = true;
                  }
                }
                if (login) {
                  doctorStored = id;
                  Get.offAll(doctor_center());
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              // backgroundColor: ,
                              content: const Center(
                                heightFactor: 1,
                                child: Text(
                                  "Credentials not found",
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
              child: const Text("Login"))
        ],
      ),
    );
  }
}
