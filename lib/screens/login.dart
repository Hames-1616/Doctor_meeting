import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project/screens/admeme.dart';
import 'package:project/screens/doctor_login.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/patient_login.dart';

import '../utils/globals.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    super.initState();
    checkforsaved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.to(admemem());
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.manage_accounts_rounded,
                    color: Colors.black,
                  )),
            )),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Log in as Patient"),
                onPressed: () {
                  if (b) {
                    Get.offAll(home());
                  } else {
                    Get.to(patientlog());
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text("Log in as Doctor"),
                onPressed: () {
                  Get.to(doctorLogin());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
