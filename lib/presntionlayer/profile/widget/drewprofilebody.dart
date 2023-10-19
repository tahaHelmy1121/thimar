import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drewProfileBody({
  var trailing,
  subtitle,
  Function()?tab,
}) {
  return Container(
    width: double.infinity,
    height: 58,
    child: ListTile(
        leading: Container(
            margin: EdgeInsets.only(top: 32,left: 18),
            child: InkWell(
              onTap:tab ,
                child: Image.asset("assets/image/COCO-Line-Arrow - Left.png"))),
        subtitle: Container(
            child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,

          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Text(subtitle,
                style: GoogleFonts.tajawal(
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ],
        )),
        trailing: Container(
          margin: EdgeInsets.only(top: 18),
          child: trailing,
          width: 40,
          height: 20,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8,
        )),
  );
}
