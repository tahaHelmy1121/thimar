import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/presntionlayer/home/home.dart';

import 'auth/loginview.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  getCustomerTypeNav(BuildContext context) async {
    SharedPreferences _sharedPreferences =
    await SharedPreferences.getInstance();
    String? _typeValue = _sharedPreferences.getString("customerId");
    if (_typeValue == null || _typeValue == 0) {
      Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.pushAndRemoveUntil(context,
                PageRouteBuilder(pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const LoginView(),
                  );
                }), (route) => false),
      );
    }else{
      Timer(
        const Duration(seconds: 3),
            () =>
                Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context,animation,_) {
              return FadeTransition(
                opacity: animation,
                child:  HomeView(),
              );
            }), (route) => false),

      );
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerTypeNav(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,BoxConstraints boxConstraint) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:ExactAssetImage("assets/image/background.png")
              )
            ),
            width: boxConstraint.maxWidth,
            height: boxConstraint.maxHeight,
            child: Column(
              children: [
                SizedBox(height: boxConstraint.maxHeight*.35,),
                Container(
                  margin: EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage("assets/image/a2.jpg",)
                      )
                  ),
                  alignment: Alignment.center,

                  height: boxConstraint.maxHeight*.18,
                  width: boxConstraint.maxWidth*0.4,
                  child: FittedBox(
                    fit: (boxConstraint.maxWidth > 500)
                        ? BoxFit.cover
                        : BoxFit.scaleDown,

                  ),
                ),
            SizedBox(height: boxConstraint.maxHeight*0.18,),
            Container(
              margin: EdgeInsets.only(left: 95),
              alignment: Alignment.center,
              height: boxConstraint.maxHeight * .29,
              width: boxConstraint.maxWidth * 0.65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                      "assets/image/3.jpeg",
                    )),
              ),
            ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
