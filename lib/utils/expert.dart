import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/Dimensions.dart';

class expert extends StatefulWidget {
  final String name;
  final String category;
  final String slot;
  expert({super.key, required this.name, required this.category,required this.slot});

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
      margin: EdgeInsets.only(right: 40, left: 40, bottom: 20),
      height: MediaQuery.of(context).size.height / hei(context, 70),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height / hei(context, 40),
          width: MediaQuery.of(context).size.width / wid(context, 40),
          child: CachedNetworkImage(
              imageUrl:
                  "https://img.icons8.com/ultraviolet/512/administrator-male.png",
              placeholder: (context, url) => const CircularProgressIndicator(
                    color: Colors.blue,
                  )),
        ),
        Container(
          width: MediaQuery.of(context).size.width / wid(context, 230),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.category,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        Text(widget.slot,style: TextStyle(fontSize: 20,),)
      ]),
    );
  }
}
