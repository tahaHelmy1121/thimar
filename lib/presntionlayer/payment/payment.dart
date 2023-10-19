 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/customwidget/customtextformauth.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../const/color.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          " payment",
          style: TextStyle(color: DefaultColor),
        )),
        leading: GestureDetector(
          child: Image.asset("assets/image/backarrow.png"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/image/visa1.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/image/mastercard.png",
            fit: BoxFit.cover,
          ),
          GestureDetector(
            onTap: () {
             _modalBottomSheetMenu(context: context);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: sallaPayColor),
              height: 54,
              width: 380,
              child: DottedBorder(
                color: DefaultColor,
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                child: const Center(
                  child: Text(
                    "addCard",
                    style: TextStyle(
                        color: DefaultColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _modalBottomSheetMenu({context}){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,

        context: context,
        builder: (builder){
          return Container(
            decoration: BoxDecoration(
              //       color:Colors.green.shade100, ////
                borderRadius: BorderRadius.circular(100)
            ),
            height: 350.0,

            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: BoxDecoration(
                    color:Colors.green.shade100, //
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                child: const Center(
                  child: Text("This is a modal sheet"),
                )),
          );
        }
    );
  }
}
