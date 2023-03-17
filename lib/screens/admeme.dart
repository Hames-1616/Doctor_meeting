import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/get_admeme.dart';
import 'package:project/screens/admeme_main.dart';
import 'package:project/utils/customtextfield.dart';

class admemem extends StatefulWidget {
  const admemem({super.key});

  @override
  State<admemem> createState() => _admememState();
}

class _admememState extends State<admemem> {
  bool admin = false;
  late List<admeme> ad;
  @override
  void initState() {
    super.initState();
    getadmeme().then((value) {
      ad = value;
    });
  }

  TextEditingController con = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String user = "";
  String passe = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
              hintText: "Username",
              icon: Icons.person,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                setState(() {
                  user = value;
                });
              },
              con: con),
          CustomTextField(
              obscureText: true,
              hintText: "Password",
              icon: Icons.password,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                setState(() {
                  passe = value;
                });
              },
              con: pass),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                for (int i = 0; i < ad.length; i++) {
                  if (user == ad[i].user && passe == ad[i].password) {
                    admin = true;
                    break;
                  }
                }
                if (admin) {
                  Get.offAll(admain());
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              // backgroundColor: ,
                              content: const Center(
                                heightFactor: 1,
                                child: Text(
                                  "Credentials not found",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      // color: kpri,
                                      fontSize: 18),
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Center(
                                        child: Text(
                                      "OK",
                                      style: TextStyle(
                                          // fontFamily: "Poppins",
                                          // color: kpri),
                                          ),
                                    )))
                              ]));
                }
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
