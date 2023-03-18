import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project/backend/getdoctors.dart';
import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/expert.dart';
import 'package:project/utils/expert_view.dart';

import '../utils/expert2.dart';

class viewcat extends StatefulWidget {
  const viewcat({super.key});

  @override
  State<viewcat> createState() => _viewcatState();
}

class _viewcatState extends State<viewcat> {
  bool empty = true;

  @override
  void initState() {
    super.initState();
    // Check if the list is empty initially
    checkIfListIsEmpty();
  }

  void checkIfListIsEmpty() async {
    final cle = await getdoc();
    setState(() {
      empty = cle.where((c) => c.service != null).isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Category",
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body:  empty
          ? Center(
              child: Container(
                  height:
                      MediaQuery.of(context).size.height / hei(context, 800),
                  width: MediaQuery.of(context).size.width / wid(context, 300),
                  margin: EdgeInsets.only(bottom: 200),
                  child: Center(
                    child: Text(
                      "Nothing Found",
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
            )
          : SingleChildScrollView(
              child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child:
                 
                  empty
                      ? Center(
                          child: Container(
                              height: MediaQuery.of(context).size.height /
                                  hei(context, 800),
                              width: MediaQuery.of(context).size.width /
                                  wid(context, 300),
                              margin: EdgeInsets.only(bottom: 200),
                              child: Image.asset("assets/images/404.png")),
                        )
                      : FutureBuilder(
                          future: getdoc(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final cle = snapshot.data;
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: cle!.length,
                                  itemBuilder: (context, index) {
                                   
                                  
                                      return Container(
                                        child: expertv(
                                        name: cle[index].service,
                                        category: "",
                                        slot: "",
                                            ),
                                      );
                                   
                                 
                                  });
                            }

                            return const CircularProgressIndicator(
                              color: Colors.blue,
                            );
                          }),
            )),
    );
  }
}
