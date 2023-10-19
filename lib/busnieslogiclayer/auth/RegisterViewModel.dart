import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/model/resendcode.dart';
import 'package:untitled1/datalayer/repostory/registerrepo.dart';
import 'package:untitled1/datalayer/repostory/resendcoderepo.dart';
import 'package:untitled1/helper/massage.dart';
import 'package:untitled1/presntionlayer/auth/loginview.dart';
import 'package:untitled1/presntionlayer/auth/setpassword.dart';

import '../../datalayer/model/forgetmodel.dart';
import '../../datalayer/model/registermodel.dart';
import '../../datalayer/model/resetmodel.dart';
import '../../datalayer/model/verifycodemodel.dart';
import '../../datalayer/repostory/forgetrepo.dart';
import '../../datalayer/repostory/resetpassword.dart';
import '../../datalayer/repostory/verifycoderepo.dart';
import '../../helper/resultprocess.dart';
import '../../presntionlayer/auth/verifycode.dart';

class RegisterViewModel extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RegisterModel register = RegisterModel();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  registerSendData({
    var fullName,
    pass,
    required context,
    gender,
    lat,
    lang,
    pass_confirmation,
    mobile,
  }) async {
    register = await RegisterRepo.getRegisterRepo(
      password: pass,
      phone: mobile,
      gender: gender,
      lang: "",
      lat: "",
      password_confirmation: pass_confirmation,
      fullName: fullName,
    );
    if (register.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: register.message.toString(),
        status: "success",
        nav: VerifyCodeView(
          phone: phoneController.text,
        ),
      );
    } else {
      ResultProcess.drewResultProcess(
          context: context, reson: register.message.toString(), status: false);
    }
  }

  final TextEditingController emailForget = TextEditingController();
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();

  final GlobalKey<FormState> forgetKey = GlobalKey<FormState>();

  forgetPass({context, forget}) async {
    if (forgetKey.currentState!.validate()) {
      forgetPasswordModel = await ForgetRepo.getForgetRepo(phone: forget);
      if (forgetPasswordModel.status == "success") {
        ResultProcess.drewResultProcess(
            context: context,
            reson: forgetPasswordModel.message,
            status: "success",
            nav: ResetPasswordView());
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          content: Text(
            forgetPasswordModel.message.toString(),
            style: const TextStyle(fontFamily: "Almarai"),
          ),
          elevation: 10,
          duration: const Duration(seconds: 1),
        ));
        notifyListeners();
      }
    }
  }

  ResetCodeModel resetCodeModel = ResetCodeModel();
  TextEditingController passwordReset = TextEditingController();

  resetPassword({phone, code, password, context}) async {
    resetCodeModel = await ResetRepo.getResetRepo(
      phone: phone,
      code: "1111",
      password: password,
    );
    if (register.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: resetCodeModel.message.toString(),
        status: "success",
        nav: const LoginView(),
      );
      notifyListeners();
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: resetCodeModel.message.toString(),
          status: "success",
          nav: const LoginView());
    }
  }

  final TextEditingController verifyController = TextEditingController();
  verifyCodeModel verifyCode = verifyCodeModel();

  final GlobalKey<FormState> forgetKeyVerify = GlobalKey<FormState>();

  verifySendData({code, phone, required context}) async {
    verifyCode = await VerifyCodeRepo.getConfaimationRepo(
      phone: phone,
      context: context,
    );
    if (verifyCode.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: "تم تفعيل حسابك بنجاح الرجاء تسجيل الدخول ",
        status: "success",
        nav: LoginView(),
      );
    } else {
      print("error ");
      ResultProcess.drewResultProcess(
          context: context,
          reson: verifyCode.message.toString(),
          status: false);
    }
  }

  ResendCode code = ResendCode();

  getResendCode({phone, context}) async {
    code = await ResendCodeRepo.getCodeRepo(
      code: "1111",
      phone: phone,
    );
    if (code.status == "success") {
      MassageApp.flusherBarErrorMassage(
          context, code.message.toString(), "", (flushbar) {});
      notifyListeners();
    } else {
      MassageApp.flusherBarErrorMassage(
          context, code.message.toString(), "", (flushbar) {});
      notifyListeners();
    }
  }
}
