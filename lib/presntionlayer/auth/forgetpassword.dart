import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/busnieslogiclayer/home/homeviewmodel.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/auth/loginview.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import 'package:provider/provider.dart';

import '../../../customwidget/customlogothimar.dart';
import '../../../customwidget/customtextformauth.dart';
import '../../busnieslogiclayer/auth/RegisterViewModel.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraint) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
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
                      "نسيت كلمة المرور",
                      style: DrewAnyTextAuth.textOne,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "ادخل رقم الجوال المرتبط بحسابك",
                      style: DrewAnyTextAuth.textOne,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Row(
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
            key: context.read<RegisterViewModel>().forgetKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: 265,
                      height: 60,
                      child: CustomTextFormAuth(
                        deafault: const EdgeInsets.only(left: 95),
                        hinttext: 'رقم الجوال',
                        labeltext: '',
                        icon: SizedBox(
                          width: 1,
                          height: 2,
                          child: Image.asset(
                              "assets/image/COCO_Duotone_Phone.png"),
                        ),
                        mycontroller:
                            context.watch<RegisterViewModel>().emailForget,
                        valid: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "ادخال الهاتف";
                          }
                        },
                        isNumber: true,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
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
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(right: 6),
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
                      var forget = context.read<RegisterViewModel>().emailForget;
                      await context
                          .read<RegisterViewModel>()
                          .forgetPass(context: context,forget: forget.text);
                    }),
                Container(
                  margin: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      InkWell(
                        child: Text(
                          "تسجيل الدخول",
                          style: GoogleFonts.tajawal(
                              fontSize: 16,
                              // color: HexColor("#4C8613"),
                              fontWeight: FontWeight.w300),
                        ),
                        onTap: () {
                          context.push(const LoginView() , context);
                        },
                      ),
                      Text(
                        " لديك حساب بالفعل ",
                        style: GoogleFonts.tajawal(
                            color: HexColor("#4C8613"),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ])),
      ));
    });
  }

  String drewFalg() {
    String countryCode = "sa";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
