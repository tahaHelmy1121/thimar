import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/auth/RegisterViewModel.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import '../../../customwidget/customlogothimar.dart';
import '../../const/color.dart';
import 'loginview.dart';

class VerifyCodeView extends StatefulWidget {
  var phone;

  VerifyCodeView({Key? key, this.phone}) : super(key: key);

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  bool _isAvailableResend = false;
  final CountDownController _controller = CountDownController();

  var formKey = GlobalKey<FormState>();

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
                crossAxisAlignment: CrossAxisAlignment.end,
                //    mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: Text(
                      "قم بتفعيل حسابك",
                      style: DrewAnyTextAuth.textOne,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: Text(
                        "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                        // maxLines: 2,
                        style: GoogleFonts.tajawal(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: Text(
                      "${widget.phone}",
                      style: DrewAnyTextAuth.textOne,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
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
            key: context.read<RegisterViewModel>().forgetKeyVerify,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Pinput(
                          length: 4,
                          keyboardType: TextInputType.number,
                          controller: context
                              .watch<RegisterViewModel>()
                              .verifyController,
                          textInputAction: TextInputAction.next,
                          showCursor: true,
                          validator: (s) {
                            print('validating code: $s');
                          },
                          onCompleted: null,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
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
                        "تأكيد الكود",
                        style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: HexColor("#FFFFFF"),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () async {
                    await context
                        .read<RegisterViewModel>()
                        .verifySendData(context: context, phone: widget.phone);
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 1, top: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              "لم تستلم الكود؟",
                              style: GoogleFonts.tajawal(
                                  fontSize: 19,
                                  //    color: HexColor("#4C8613"),
                                  fontWeight: FontWeight.w300),
                            ),
                            onTap: () {
                              //             context.push(RegisterView());
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CircularCountDownTimer(
                        width: 50,
                        height: 50,
                        isReverse: true,
                        duration: 30,
                        controller: _controller,
                        fillColor: DefaultColor,
                        ringColor: Colors.grey,
                        initialDuration: 0,
                        onComplete: () {
                          print("=-=--=-==--=complete");
                          setState(() {
                            _isAvailableResend = true;
                          });
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      if (_isAvailableResend == true)
                        Container(
                          width: 133,
                          height: 47,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: DefaultColor, width: 1.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                print("-=-=--=-=-=-=${widget.phone}");
                                context.read<RegisterViewModel>().getResendCode(
                                    phone: widget.phone, context: context);

                                _controller.restart(duration: 30);
                                setState(() {
                                  _isAvailableResend = false;
                                });
                              },
                              child: Text(
                                "resend",
                                style: const TextStyle(
                                    color: DefaultColor, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 1,
                      ),
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
                                context.push(const LoginView(), context);
                              },
                            ),
                            Text(
                              " لديك حساب بالفعل ",
                              style: GoogleFonts.tajawal(
                                  color: HexColor("#4C8613"),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
