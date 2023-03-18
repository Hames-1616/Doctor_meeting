import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/adddoc.dart';
import 'package:project/backend/getdoctors.dart';
import 'package:project/utils/customtextfield.dart';

class adddoc extends StatefulWidget {
  const adddoc({super.key});

  @override
  State<adddoc> createState() => _adddocState();
}

class _adddocState extends State<adddoc> {
  List<String> io = [];
  @override
  void initState() {
    super.initState();
    getdoc().then((value) {
      for (int i = 0; i < value.length; i++) {
        setState(() {
          io.add(value[i].service);
        });
      }
    });
  }

  static final GlobalKey<FormState> add =
      GlobalKey<FormState>(debugLabel: "key5");
  String place = "";
  String category = "";
  String name = "";
  String password = "";
  TextEditingController loc = new TextEditingController();
  TextEditingController con = new TextEditingController();
  TextEditingController passe = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Doctor",
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Form(
        key: add,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                hintText: "Name",
                icon: Icons.supervised_user_circle,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                con: con),
            CustomTextField(
                obscureText: true,
                hintText: "Password",
                icon: Icons.password,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  password = value;
                },
                con: passe),
            CustomTextField(
                hintText: "Place",
                icon: Icons.place,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  place = value;
                },
                con: loc),
            DropDown(
              items: io,
              hint: Text("category"),
              icon: Icon(Icons.expand_more),
              onChanged: (value) {
                category = value!;
              },
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  if (add.currentState!.validate()) {
                    add_doc(name, password, place, category);
                    Get.back();
                    Fluttertoast.showToast(msg: "Doctor Added");
                  }
                },
                child: Text("Add Doctor"))
          ],
        ),
      ),
    );
  }
}
