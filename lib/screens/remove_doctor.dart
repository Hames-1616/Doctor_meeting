import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/backend/getdocx.dart';
import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/expert.dart';
import 'package:project/utils/expert3.dart';

class remove_doc extends StatefulWidget {
  const remove_doc({super.key});

  @override
  State<remove_doc> createState() => _remove_docState();
}

class _remove_docState extends State<remove_doc> {
  bool empty = true;
  @override
  void initState() {
    super.initState();
    // Check if the list is empty initially
    checkIfListIsEmpty();
  }

  void checkIfListIsEmpty() async {
    final cle = await getdocx();
    setState(() {
      empty = cle.where((c) => c.name != Null).isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Doctors",
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: empty
          ? Center(
              child: Container(
                  height:
                      MediaQuery.of(context).size.height / hei(context, 800),
                  width: MediaQuery.of(context).size.width / wid(context, 300),
                  margin: const EdgeInsets.only(bottom: 200),
                  child: const Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
            )
          : SingleChildScrollView(
              child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: empty
                  ? Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height /
                              hei(context, 800),
                          width: MediaQuery.of(context).size.width /
                              wid(context, 300),
                          margin: const EdgeInsets.only(bottom: 200),
                          child: Image.asset("assets/images/404.png")),
                    )
                  : FutureBuilder(
                      future: getdocx(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final cle = snapshot.data;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cle!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    child: expert3(
                                  name: cle[index].name,
                                  category: cle[index].category,
                                ));
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
