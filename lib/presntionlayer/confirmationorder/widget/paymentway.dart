


            import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/color.dart';

Widget choicePaymentWay(){

  return       Container(
    margin: const EdgeInsets.all(12),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
            onTap: () {
              // TODO: SHOWMODALBOTTOMSHEET البطاقات المحفوظةلسه هيتعمل
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              height: 50,
              width: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/image/visa3.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            height: 50,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  "assets/image/mastercard1.png",
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            height: 50,
            width: 100,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/image/money.png",
                  ),
                ),
                const Text(
                  "cash",
                  style: TextStyle(color: DefaultColor),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}