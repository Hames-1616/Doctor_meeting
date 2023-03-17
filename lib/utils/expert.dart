import 'package:flutter/material.dart';
import 'package:project/utils/Dimensions.dart';

class expert extends StatefulWidget {
  final String name;
  final String category;
   expert({super.key,required this.name,required this.category});

  @override
  State<expert> createState() => _expertState();
}

class _expertState extends State<expert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue.shade50,
      ),
      margin: EdgeInsets.only(right: 40,left: 40,bottom: 20),
      height: MediaQuery.of(context).size.height/hei(context, 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name,style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            Text(widget.category,style: TextStyle(fontSize: 12),)
          ],
        )
      ]),
    );
  }
}
