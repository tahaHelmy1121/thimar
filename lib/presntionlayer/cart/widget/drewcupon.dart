
   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/helper/extenstion.dart';

Widget drewCupon({required BuildContext context}){
  return        Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 4),
        width: context.screenwidth * 0.9,
        height: context.screenHeight * 0.080,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Column(
          children: [
            Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                      child: Text("تطبيق",
                          style: GoogleFonts.tajawal(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1))),
                ),

                Text(
                  "عندك كوبون ؟ ادخل رقم الكوبون",
                  style: GoogleFonts.tajawal(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        //   margin: const EdgeInsets.only(left: ),
        width: context.screenwidth * 0.9,
        height: context.screenHeight * 0.059,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white),
        child: Column(
          children: [
            Row(
            //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                 margin: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      "جميع الأسعار تشمل قيمة الضريبة المضافة %15",
                      style: GoogleFonts.tajawal(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.green),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    ],
  );
}