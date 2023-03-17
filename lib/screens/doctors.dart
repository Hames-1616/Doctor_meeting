import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/backend/getdoctors.dart';
import 'package:project/utils/doctorgrid.dart';

class doctors extends StatefulWidget {
  const doctors({super.key});

  @override
  State<doctors> createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Doctors",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Center(
        child: FutureBuilder(
            future: getdoc(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dok = snapshot.data;
                return GridView.builder(
                  itemCount: dok!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(15)),
                        child: cate2(
                            service: dok[index].service,
                            image: dok[index].image),
                      );
                    });
              }
              return CircularProgressIndicator(
                color: Colors.blue,
              );
            }),
      ),
    );
  }
}
