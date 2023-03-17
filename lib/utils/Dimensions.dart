import 'package:flutter/material.dart';


class GlobalKeyHolder {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}



double wid(BuildContext context, double w) {
  return MediaQuery.of(context).size.width / w;
}

double hei(BuildContext context, double w) {
  return MediaQuery.of(context).size.height / w;
}

