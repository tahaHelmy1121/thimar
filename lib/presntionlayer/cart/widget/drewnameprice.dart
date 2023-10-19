import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/helper/extenstion.dart';

Widget drewNameAndPriceQun({title, price, amount, required BuildContext context}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 11,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      SizedBox(
        width: context.screenwidth*0.30,
        child: Row(
          children: [
            Text(" ر.س$price /$amountكج",
                style: GoogleFonts.abrilFatface(
                    fontWeight: FontWeight.bold, fontSize: 8,color: Colors.grey)),
          ],
        ),
      ),
    ],
  );
}