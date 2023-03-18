import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project/screens/admeme.dart';
import 'package:project/screens/doctor_login.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/patient_login.dart';
import 'package:project/utils/Dimensions.dart';

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
              Get.to(const admemem());
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
          margin: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/hei(context, 250),
                width: MediaQuery.of(context).size.width/wid(context, 250),
                child: CachedNetworkImage(
                    imageUrl: "https://img.icons8.com/ultraviolet/512/doctors-bag.png",
                    placeholder: (context, url) => const CircularProgressIndicator(
                          color: Colors.blue,
                        )),
              ),
              ElevatedButton(
                child: const Text("Log in as Patient"),
                onPressed: () {
                  if (b) {
                    Get.offAll(const home());
                  } else {
                    Get.to(const patientlog());
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text("Log in as Doctor"),
                onPressed: () {
                  Get.to(const doctorLogin());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
