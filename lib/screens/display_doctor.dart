import 'package:flutter/material.dart';
import 'package:project/backend/getdocx.dart';
import 'package:project/utils/Dimensions.dart';

import '../utils/expert2.dart';

class display extends StatefulWidget {
  final String category;
  final List<docx> d;
  const display({super.key, required this.d, required this.category});

  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  bool empty = true;
    @override
  void initState() {
    super.initState();
    // Check if the list is empty initially
    checkIfListIsEmpty();
  }

  void checkIfListIsEmpty() async {
    final cle = await widget.d;
    setState(() {
      empty = cle
          .where((c) => c.category == widget.category)
          .isEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.category,
                  style: const TextStyle(fontFamily: "Poppins", fontSize: 20),
                ),
              ],
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: Colors.blue.shade100,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            )),
      ),
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
                          future: getdocx(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final cle = snapshot.data;
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: cle!.length,
                                  itemBuilder: (context, index) {
                                    if (widget.category == cle[index].category) {
                                  
                                      return Container(
                                        child: expert2(
                                         service: cle[index].name,
                                         category: cle[index].category,
                                         place: cle[index].place,
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
