import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drewThirdCartTotal(
    {totalPriceBeforeDiscount, totalDiscount, totalPriceWithVat}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
                child: Text('$totalPriceBeforeDiscount ر.س',
                    style: GoogleFonts.tajawal(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1))),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
                child: Text("إجمالي المنتجات",
                    style: GoogleFonts.tajawal(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1))),
          ),
        ],
      ),
      Container(
        height: 1,
        color: Colors.grey.shade200,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
                child: Text('$totalDiscount ر.س',
                    style: GoogleFonts.tajawal(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1))),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
                child: Text("الخصم",
                    style: GoogleFonts.tajawal(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1))),
          ),
        ],
      ),
      Container(
        height: 1,
        color: Colors.grey.shade200,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
                child: Text('$totalPriceWithVat ر.س',
                    style: GoogleFonts.tajawal(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1))),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Center(
                child: Text("الاجمالى",
                    style: GoogleFonts.tajawal(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1))),
          ),
        ],
      ),
    ],
  );
}