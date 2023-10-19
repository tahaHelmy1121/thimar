import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget drewCustomButton({Function()?tab,required name}) {
  return InkWell(
      onTap:tab,
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: HexColor("#4C8613")),
        width: 343,
        height: 60,
        child: Center(
          child: Text(
           name,
            style: GoogleFonts.tajawal(
                fontSize: 15,
                color: HexColor("#FFFFFF"),
                fontWeight: FontWeight.bold),
          ),
        ),
      ));
}
