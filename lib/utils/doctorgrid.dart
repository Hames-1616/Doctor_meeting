import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:project/backend/getdocx.dart';
import 'package:project/screens/display_doctor.dart';
import 'package:project/utils/Dimensions.dart';

class cate2 extends StatefulWidget {
  final String service;
  final String image;
  const cate2({super.key, required this.service, required this.image});

  @override
  State<cate2> createState() => _cate2State();
}

class _cate2State extends State<cate2> {
  late List<docx> d;
  @override
  void initState() {
    super.initState();
    getdocx().then((value) {
      d = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (() {
        Get.to(display(d:d,category:widget.service));
      }),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / wid(context, 50),
              height: MediaQuery.of(context).size.height / hei(context, 50),
              child: CachedNetworkImage(
                  imageUrl: widget.image,
                  placeholder: (context, url) => CircularProgressIndicator(
                        color: Colors.blue,
                      ))),
          Container(
              margin: const EdgeInsets.only(top: 13),
              child: Text(
                widget.service,
                style: const TextStyle(fontSize: 14),
              ))
        ],
      ),
    );
  }
}
