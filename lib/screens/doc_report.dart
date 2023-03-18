import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/backend/get_appoint.dart';
import 'package:project/utils/Dimensions.dart';
import 'package:project/utils/expert2.dart';
import 'package:project/utils/expert_review.dart';
import 'package:project/utils/globals.dart';

class doc_re extends StatefulWidget {
  const doc_re({super.key});

  @override
  State<doc_re> createState() => _doc_reState();
}

class _doc_reState extends State<doc_re> {
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
      empty = cle
          .where((c) => c.sent == emailStored && c.doc!="")
          .isEmpty;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: empty
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
                          future: getappoint(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final cle = snapshot.data;
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: cle!.length,
                                  itemBuilder: (context, index) {
                                    if (emailStored == cle[index].sent && cle[index].doc!="") {
                                  
                                      return Container(
                                        child: expertr(
                                         service: cle[index].name,
                                         category: cle[index].category,
                                         place: "sgr",
                                         image: cle[index].doc,
                                            ),
                                      );
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