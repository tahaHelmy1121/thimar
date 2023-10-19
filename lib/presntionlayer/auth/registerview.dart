import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/auth/loginview.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import '../../busnieslogiclayer/auth/RegisterViewModel.dart';
import '../../customwidget/customlogothimar.dart';
import '../../customwidget/customtextformauth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: LayoutBuilder(builder: (context, BoxConstraints boxConstraint) {
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
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
                      child: InkWell(
                        onTap: () {
                          //         context.read<RegisterViewModel>().registerSendData(context: context);
                        },
                        child: Text(
                          "يمكنك تسجيل حساب جديد الان ",
                          style: DrewAnyTextAuth.textOne,
                        ),
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
                    //      DrewAnyTextAuth.drewTextTwo(name: "يمكنك تسجيل الدخول الأن")
                  ],
                ),
              ],
            ),
            Form(
              key: context.read<RegisterViewModel>().globalKey,
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 60,
                        child: CustomTextFormAuth(
                          hinttext: 'اسم المستخدم',
                          labeltext: '',
                          deafault: const EdgeInsets.only(left: 115),
                          icon: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                                "assets/image/COCO_Duotone_Unlock.png"),
                          ),
                          mycontroller: context
                              .watch<RegisterViewModel>()
                              .userController,
                          valid: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ادخال اسم المستخدم";
                            }
                            return null;
                          },
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 60,
                        child: CustomTextFormAuth(
                          hinttext: 'النوع',
                          //    labeltext: '',
                          deafault: const EdgeInsets.only(
                            left: 200,
                          ),
                          icon: Image.asset(
                            "assets/image/COCO_Duotone_User.jpeg",
                            width: 1,
                            height: 1,
                          ),
                          mycontroller: context
                              .watch<RegisterViewModel>()
                              .genderController,
                          valid: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ادخال النوع";
                            }
                            return null;
                          },
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
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
                          mycontroller: context
                              .watch<RegisterViewModel>()
                              .phoneController,
                          valid: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ادخال الهاتف";
                            }
                            return null;
                          },
                          isNumber: true,
                        ),
                      ),
                      const SizedBox(
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
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 60,
                        child: CustomTextFormAuth(
                          hinttext: 'المدينة',
                          labeltext: '',

                          icon: Container(
                            child: Image.asset(
                                "assets/image/COCO_Duotone_Report.png"),
                          ),
                          mycontroller: context
                              .watch<RegisterViewModel>()
                              .cityController,
                          valid: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ادخال كلمة المرور";
                            }
                            return null;
                          },
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 60,
                        child: CustomTextFormAuth(
                          hinttext: 'كلمة المرور',
                          labeltext: '',
                          icon: Image.asset(
                              "assets/image/COCO_Duotone_Unlock.png"),
                          mycontroller: context
                              .watch<RegisterViewModel>()
                              .passwordController,
                          valid: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ادخال كلمة المرور";
                            }
                            return null;
                          },
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 60,
                        child: CustomTextFormAuth(
                          hinttext: 'كلمة المرور',
                          labeltext: '',
                          icon: Image.asset(
                              "assets/image/COCO_Duotone_Unlock.png"),
                          mycontroller: context
                              .watch<RegisterViewModel>()
                              .confirmPasswordController,
                          valid: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ادخال كلمة المرور";
                            }
                            return null;
                          },
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
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
                          "تسجيل",
                          style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: HexColor("#FFFFFF"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (context
                          .read<RegisterViewModel>()
                          .globalKey
                          .currentState!
                          .validate()) {
                        String user = context
                            .read<RegisterViewModel>()
                            .userController
                            .text;
                        String pass = context
                            .read<RegisterViewModel>()
                            .passwordController
                            .text;
                        String confirmPassword = context
                            .read<RegisterViewModel>()
                            .confirmPasswordController
                            .text;
                        String mobile = context
                            .read<RegisterViewModel>()
                            .phoneController
                            .text;
                        String gender = context
                            .read<RegisterViewModel>()
                            .genderController
                            .text;
                        await context
                            .read<RegisterViewModel>()
                            .registerSendData(
                                fullName: user,
                                pass: pass,
                                pass_confirmation: confirmPassword,
                                mobile: mobile,
                                context: context,
                                gender: gender);
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.all(19),
                    child: Row(
                      children: [
                        InkWell(
                          child: Text(
                            "تسجيل الدخول؟",
                            style: GoogleFonts.tajawal(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          onTap: () {
                            context.push(const LoginView(), context);
                          },
                        ),
                        Text(
                          " لديك حساب بالفعل ",
                          style: GoogleFonts.tajawal(
                              fontSize: 10,
                              color: HexColor("#4C8613"),
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        )));
      }),
    );
  }

  String drewFalg() {
    String countryCode = "sa";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
