import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/add_category.dart';
import 'package:project/utils/customtextfield.dart';

class addcate extends StatefulWidget {
  const addcate({super.key});

  @override
  State<addcate> createState() => _addcateState();
}

class _addcateState extends State<addcate> {
  String service = "";
  String img = "";
  TextEditingController con = new TextEditingController();
  TextEditingController image = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Category",
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
              hintText: "Service",
              icon: Icons.miscellaneous_services_rounded,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  service = value;
                });
              },
              con: con),
          CustomTextField(
            a: 500,
              hintText: "Image URL",
              icon: Icons.image,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  img = value;
                });
              },
              con: image),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                addservice(service, img);
                Get.back();
                Fluttertoast.showToast(msg: "Category Added");
              },
              child: Text("Add Category"))
        ],
      ),
    );
  }
}
