import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/screens/add_category.dart';

class admain extends StatefulWidget {
  const admain({super.key});

  @override
  State<admain> createState() => _admainState();
}

class _admainState extends State<admain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(addcate());
                },
                child: Text("Add Category")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {
              
            }, child: Text("Add Doctor")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Remove Doctor"))
          ],
        ),
      ),
    );
  }
}
