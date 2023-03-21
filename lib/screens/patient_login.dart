import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/backend/getlog.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/register.dart';
import 'package:project/utils/customtextfield.dart';
import 'package:project/utils/globals.dart';

class patientlog extends StatefulWidget {
  const patientlog({super.key});

  @override
  State<patientlog> createState() => _patientlogState();
}

class _patientlogState extends State<patientlog> {
  bool verify = false;
  late List<Userd> user;
  @override
  void initState() {
    super.initState();
    getlog().then((value) {
      user = value;
    });
    updatedd();
  }

  void updatedd() {
    print("called");
    getlog().then((value) {
      user = value;
    });
  }

  String mail = "";
  String password = "";
  TextEditingController con = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    updatedd();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "P A T I E N T   L O G I N",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
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
            con: con),
        CustomTextField(
            obscureText: true,
            hintText: "Password",
            icon: Icons.password,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              password = value;
            },
            con: pass),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              for (int i = 0; i < user.length; i++) {
                if (mail == user[i].Email && password == user[i].password) {
                  verify = true;
                }
              }
              if (verify) {
                emailStored = mail;
                await saveusersession(mail);
                Get.offAll(home());
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
            child: const Text("Log in")),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("New User?"),
            TextButton(
                onPressed: () {
                  Get.to(const registerp());
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        )
      ],
    ));
  }
}
