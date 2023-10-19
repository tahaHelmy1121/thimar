import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import '../../../customwidget/customlogothimar.dart';
import '../../../customwidget/customtextformauth.dart';
import '../../busnieslogiclayer/auth/RegisterViewModel.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
                    margin: const EdgeInsets.only(right: 18),
                    child: Text(
                      "ادخل رقم الجوال المرتبط بحسابك",
                      style: DrewAnyTextAuth.textOne,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
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
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 311,
                    height: 60,
                    child: CustomTextFormAuth(
                      hinttext: 'كلمة المرور',
                      labeltext: '',
                      icon: SizedBox(
                        width: 1,
                        height: 2,
                        child:
                            Image.asset("assets/image/COCO_Duotone_Phone.png"),
                      ),
                      mycontroller:
                          context.watch<RegisterViewModel>().passwordReset,
                      valid: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "ادخال الهاتف";
                        }
                      },
                      isNumber: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 311,
                    height: 60,
                    child: CustomTextFormAuth(
                      hinttext: 'تاكيد كلمة المرور ',
                      labeltext: '',
                      icon: SizedBox(
                        width: 1,
                        height: 2,
                        child:
                            Image.asset("assets/image/COCO_Duotone_Phone.png"),
                      ),
                      valid: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "ادخال الهاتف";
                        }
                      },
                      isNumber: true,
                      mycontroller: null,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
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
                          "تغير كلمة المرور",
                          style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: HexColor("#FFFFFF"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () async {
                      var reset =
                          context.read<RegisterViewModel>().passwordReset;
                      var emilForget =
                          context.read<RegisterViewModel>().emailForget;
                      context.read<RegisterViewModel>().resetPassword(
                          context: context,
                          password: reset.text,
                          phone: emilForget.text);
                    }),
              ],
            ),
          ),
        ])),
      ));
    });
  }
}
