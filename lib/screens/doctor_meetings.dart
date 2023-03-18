import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/backend/get_appoint.dart';
import 'package:project/backend/getdocx.dart';
import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/expert.dart';
import 'package:project/utils/globals.dart';

class doctormeeting extends StatefulWidget {
  const doctormeeting({super.key});

  @override
  State<doctormeeting> createState() => _doctormeetingState();
}

class _doctormeetingState extends State<doctormeeting> {
  bool empty = true;
  @override
  void initState() {
    super.initState();
    // Check if the list is empty initially
    checkIfListIsEmpty();
  }

  void checkIfListIsEmpty() async {
    final cle = await getappoint();
    setState(() {
      empty = cle.where((c) => c.name == doctorStored).isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Meetings",
          style: TextStyle(fontSize: 15),
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
                      "No Appointments",
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
                      future: getappoint(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final cle = snapshot.data;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cle!.length,
                              itemBuilder: (context, index) {
                                if (doctorStored == cle[index].name) {
                                  int l = index + 1;
                                  return Container(
                                      child: expert(
                                    name: cle[index].patient,
                                    category: cle[index].category,
                                    slot: l.toString(),
                                  ));
                                } else {
                                  return Container();
                                }
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
