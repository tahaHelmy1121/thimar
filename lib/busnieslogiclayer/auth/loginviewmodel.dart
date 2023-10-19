
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/presntionlayer/auth/registerview.dart';
import 'package:untitled1/presntionlayer/home/home.dart';

import '../../../helper/resultprocess.dart';
import '../../datalayer/model/loginmodel.dart';
import '../../datalayer/repostory/loginrepo.dart';

class LoginViewModel extends ChangeNotifier{
  SharedPreferences? sharedPreferences;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel loginModel = LoginModel();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  // GlobalKey<FormState> form = GlobalKey<FormState>();
  loginSendData({var email, pass,  context}) async {
    loginModel = await LoginRepo.getLoginRepo(
      phone:email ,
      password:pass ,
      device_token:"test" ,
      type:"ios" ,
      user_type:"client" ,
    );
    if (loginModel.status == "success") {
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences!
          .setString("name", loginModel.data!.fullname.toString());
      sharedPreferences!
          .setString("customerId", loginModel.data!.id.toString());
      sharedPreferences!
          .setString("token", loginModel.data!.token.toString());
      sharedPreferences!
          .setString("phone", loginModel.data!.phone.toString());
      ResultProcess.drewResultProcess(
        context: context,
        reson: loginModel.data?.userType.toString(),
        status: "success",
        nav:  HomeView(),
      );

    } else {
      print("error login");
      ResultProcess.drewResultProcess(

          context: context,
          reson: loginModel.message.toString(),
          status: false);
    }
  }

}