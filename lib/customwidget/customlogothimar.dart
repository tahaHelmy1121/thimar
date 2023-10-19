import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drewLogo(BoxConstraints boxConstraints) {
  return Container(
    margin: EdgeInsets.only(left: 18),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              "assets/image/a2.jpg",
            ))),
    alignment: Alignment.center,
    height: boxConstraints.maxHeight * .18,
    width: boxConstraints.maxWidth * 0.4,
    child: FittedBox(
      fit: (boxConstraints.maxWidth > 100) ? BoxFit.cover : BoxFit.scaleDown,
    ),
  );
}
