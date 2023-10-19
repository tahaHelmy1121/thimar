import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/helper/extenstion.dart';


import 'package:provider/provider.dart';

import '../../busnieslogiclayer/auth/loginviewmodel.dart';
import '../../customwidget/customlogothimar.dart';
import '../../customwidget/customtextformauth.dart';
import '../../customwidget/flag.dart';
import 'forgetpassword.dart';
import 'registerview.dart';
import 'widget/drewanytextauth.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, BoxConstraints boxConstraint) {
      return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                      child: drewLogo(boxConstraint)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(9),
                            child: Text(
                              "مرحبا بك مرة اخرى",
                              style: DrewAnyTextAuth.textOne,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              "يمكنك تسجيل الدخول الان ",
                              style: DrewAnyTextAuth.textOne,
                            ),
                          ),

                        ],
                      ),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //
                    children: [
                      Column(
                        children: [
                          //     DrewAnyTextAuth.drewTextTwo(name: "يمكنك تسجيل الدخول الأن")
                        ],
                      ),
                    ],
                  ),
                  Form(
                    key: context.read<LoginViewModel>().globalKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              width: 265,
                              height: 60,
                              child: CustomTextFormAuth(
                                hinttext: 'رقم الجوال',
                                labeltext: '',
                                icon: SizedBox(
                                  width: 1,
                                  height: 2,
                                  child: Image.asset(
                                      "assets/image/COCO_Duotone_Phone.png"),
                                ),
                                mycontroller:
                                context.watch<LoginViewModel>().phoneController,
                                valid: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "ادخال الهاتف";
                                  }
                                },
                                isNumber: true,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: 70,
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  child: Column(
                                    children: [
                                      Text(
                                        drewFalg(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "+966",
                                        style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#4C8613")),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, top: 12),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 343,
                                height: 60,
                                child: CustomTextFormAuth(
                                  hinttext: 'كلمة المرور',
                                  labeltext: '',
                                  icon: Container(
                                    child: Image.asset(
                                        "assets/image/COCO_Duotone_Unlock.png"),
                                  ),
                                  mycontroller: context
                                      .watch<LoginViewModel>()
                                      .passwordController,
                                  valid: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "ادخال كلمة المرور";
                                    }
                                  },
                                  isNumber: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(19),
                          child: Row(
                            children: [
                              InkWell(
                                child: Text(
                                  "نسيت كلمة المرور؟",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 16, fontWeight: FontWeight.w300),
                                ),
                                onTap: () {
                              context.push(ForgetPasswordView() , context);
                                },
                              )
                            ],
                          ),
                        ), //tm
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: HexColor("#4C8613")),
                            width: 343,
                            height: 60,
                            child: Center(
                              child: Text(
                                "تسجيل الدخول",
                                style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: HexColor("#FFFFFF"),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (context
                                .read<LoginViewModel>()
                                .globalKey
                                .currentState!
                                .validate()) {
                              String user = context
                                  .read<LoginViewModel>()
                                  .phoneController
                                  .text;
                              String pass = context
                                  .read<LoginViewModel>()
                                  .passwordController
                                  .text;
                              await context.read<LoginViewModel>().loginSendData(
                                email: user,
                                pass: pass,
                                context: context,
                              );
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.all(19),
                          child: Row(
                            children: [
                              InkWell(
                                child: Text(
                                  "تسجيل الأن",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 16,
                                      color: HexColor("#4C8613"),
                                      fontWeight: FontWeight.w300),
                                ),
                                onTap: () {
                                  context.push(RegisterView() , context);
                                },
                              ),
                              Text(
                                "ليس لديك حساب ؟",
                                style: GoogleFonts.tajawal(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
                )

            ),
          )
      );
    });
  }



}
