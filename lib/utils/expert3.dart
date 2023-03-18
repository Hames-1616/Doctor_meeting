import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/delete_doctor.dart';
import 'package:project/utils/Dimensions.dart';

class expert3 extends StatefulWidget {
  final String name;
  final String category;
  expert3({super.key, required this.name, required this.category});

  @override
  State<expert3> createState() => _expert3State();
}

class _expert3State extends State<expert3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue.shade50,
      ),
      margin: EdgeInsets.only(right: 40, left: 40, bottom: 20),
      height: MediaQuery.of(context).size.height / hei(context, 70),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.category,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        IconButton(
            onPressed: () {
              del_doc(widget.name, widget.category);
              Get.back();
              Fluttertoast.showToast(msg: "Doctor Deleted");
            },
            icon: Icon(Icons.delete))
      ]),
    );
  }
}
