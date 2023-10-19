import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push(Widget widget,BuildContext context) {
   //  Navigator.canPop(context);
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (context, animation, child) {
        return FadeTransition(
          opacity: animation,
          child:  widget,
        );
      }),
    );
  }
}

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenwidth => MediaQuery.of(this).size.width;
}
