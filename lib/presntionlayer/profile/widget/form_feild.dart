import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget drewFormInfo(
    {  final String? Function(String?)? valid,
      hintText,
      labelText, image,
      required EdgeInsetsGeometry edgeInsets,
      required double width, Widget? icon,
      final TextEditingController? mycontroller}) {
  return Container(
    margin: edgeInsets,
    child: Row(
      children: [
        Container(
            decoration: BoxDecoration(color: HexColor("#FAFFF5"),
                borderRadius: BorderRadius.circular(8)),
            width: width,
            height: 60,
            child: TextFormField(
              validator: valid,
              controller:mycontroller,
              textAlign: TextAlign.right,
              //      enableInteractiveSelection: true,
              //      autofocus: true,
              decoration: InputDecoration(

                prefixIcon: icon,
                suffixIcon: Container(
                  child: Image.asset(
                      image),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade50, width: 0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                hintText: hintText.toString(),
                labelText: labelText,
                labelStyle: TextStyle(
                    fontSize: 15, color: Colors.grey, letterSpacing: 2),
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            )),
      ],
    ),
  );
}

