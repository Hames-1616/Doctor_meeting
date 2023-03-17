import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/getlog.dart';
import 'package:project/backend/update_pass.dart';
import 'package:project/utils/customtextfield.dart';
import 'package:project/utils/globals.dart';

class passwordchange extends StatefulWidget {
  const passwordchange({super.key});

  @override
  State<passwordchange> createState() => _passwordchangeState();
}

class _passwordchangeState extends State<passwordchange> {
  static final GlobalKey<FormState> olde =
      GlobalKey<FormState>(debugLabel: "key3");
  @override
  void initState() {
    super.initState();
    getlog().then((value) {
      for (int i = 0; i < value.length; i++) {
        if (emailStored == value[i].Email) {
          passwordStored = value[i].password;
          break;
        }
      }
    });
  }

  String old = "";
  String current = "";
  String confirm = "";
  TextEditingController oldpass = new TextEditingController();
  TextEditingController currentpass = new TextEditingController();
  TextEditingController confirmpass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: olde,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                obscureText: true,
                hintText: "Old password",
                icon: Icons.password,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    old = value;
                  });
                },
                con: oldpass),
            CustomTextField(
                obscureText: true,
                hintText: "New password",
                icon: Icons.password,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    current = value;
                  });
                },
                con: currentpass),
            CustomTextField(
                obscureText: true,
                c: current,
                p: confirm,
                hintText: "Confirm Password",
                icon: Icons.password,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    confirm = value;
                  });
                },
                con: confirmpass),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  if (olde.currentState!.validate()) {
                    updatepass(emailStored, confirm);
                    Get.back();
                    Fluttertoast.showToast(msg: "Password Updated");
                  }
                },
                child: const Text("Change Password"))
          ],
        ),
      ),
    );
  }
}
