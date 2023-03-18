import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/screens/add_category.dart';
import 'package:project/screens/add_doctor.dart';
import 'package:project/screens/delete_cat.dart';
import 'package:project/screens/remove_doctor.dart';
import 'package:project/screens/view_category.dart';
import 'package:project/utils/Dimensions.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / hei(context, 250),
              width: MediaQuery.of(context).size.width / wid(context, 250),
              child: CachedNetworkImage(
                  imageUrl:
                      "https://img.icons8.com/color/512/admin-settings-male.png",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                        color: Colors.blue,
                      )),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(addcate());
                },
                child: Text("Add Category")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(delcat());
                },
                child: Text("Remove Category")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(viewcat());
                },
                child: Text("View Category")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(adddoc());
                },
                child: Text("Add Doctor")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(remove_doc());
                },
                child: Text("Remove Doctor"))
          ],
        ),
      ),
    );
  }
}
