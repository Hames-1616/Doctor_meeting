import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/screens/login.dart';
import 'package:project/screens/password_change.dart';
import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/globals.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkResponse(
            onTap: () {
              Get.to(passwordchange());
            },
            child: Container(
              height: MediaQuery.of(context).size.height / hei(context, 160),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade50),
              child: Container(
                  margin: EdgeInsets.all(30),
                  child: Center(child: Text("Password"))),
            ),
          ),
          InkResponse(
            onTap: () {
              deleteusersession();
              Get.offAll(login());
            },
            child: Container(
              height: MediaQuery.of(context).size.height / hei(context, 160),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade50),
              child: Container(
                  margin: EdgeInsets.all(30),
                  child: Center(child: Text("  log out  "))),
            ),
          )
        ],
      ),
    ));
  }
}
