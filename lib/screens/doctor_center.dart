import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/screens/doctor_meetings.dart';
import 'package:project/screens/login.dart';

class doctor_center extends StatefulWidget {
  const doctor_center({super.key});

  @override
  State<doctor_center> createState() => _doctor_centerState();
}

class _doctor_centerState extends State<doctor_center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Doctor"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(doctormeeting());
                },
                child: Text("Meetings")),
            ElevatedButton(
                onPressed: () {
                  Get.to(login());
                },
                child: Text("log Out"))
          ]),
    );
  }
}
