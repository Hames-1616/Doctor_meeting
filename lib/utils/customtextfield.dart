import 'package:flutter/material.dart';
import 'package:project/utils/globals.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    
    this.q = false,
    this.c = "",
    this.p = "",
    this.a = 20,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.keyboardType,
    required this.onChanged,
    required this.con,
    Key? key,
  }) : super(key: key);
  bool q;
  int a;
  
  final String c;
  final String p;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Invalid Credentials";
          } else if ((!value.contains("@") || !value.contains(".com")) &&
              obscureText == false &&
              hintText == "Email") {
            return "please enter a valid email";
          } else if (obscureText == true && value.length < 5) {
            return "Minimum of 5 characters are required";
          }

          if (hintText == "Confirm Password") {
            if (c != p) {
              return "Password doesnt matches";
            }
          }

          if (hintText == "Old password") {
            if (value != passwordStored) {
              return "Wrong Password";
            }
          }
        },
        autofocus: q,
        controller: con,
        maxLength: a,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          fontFamily: "Poppins",
          color: Color.fromARGB(255, 13, 18, 23),
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.all(18.0),
          filled: true,
          fillColor: Colors.blue.shade50,
          prefixIcon: Icon(
            icon,
            size: 24.0,
            color: Color.fromARGB(255, 4, 6, 8),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: "Poppins",
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 173, 207, 236)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 168, 209, 243)),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
