import 'package:app_dialog/app_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/model/walletmodel.dart';
import 'package:untitled1/datalayer/repostory/chargerepo.dart';
import 'package:untitled1/datalayer/repostory/walletviewrepo.dart';
import 'package:untitled1/helper/massage.dart';
import 'package:untitled1/presntionlayer/splashview.dart';

import '../../datalayer/model/transactionmodel.dart';
import '../../datalayer/repostory/transactionrepo.dart';
import '../../helper/resultprocess.dart';
import '../../presntionlayer/auth/loginview.dart';
import '../../presntionlayer/home/home.dart';

class WalletViewModel extends ChangeNotifier {


WalletViewModel (){
  getWalletFromRepo();
  charge();
  getTransactionFromRepo();
}
  WalletModel walletModel = WalletModel(data: []);
TransactionModel transactionModel = TransactionModel(data: []);
SharedPreferences? _sharedPreferences;
  bool wallet = false;
  TextEditingController amountController = TextEditingController();
  TextEditingController trIdontroller = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

charge({
   context,
  trans_id,
  qun,
}) async {
  _sharedPreferences = await SharedPreferences.getInstance();
  var token = _sharedPreferences!.getString("token");
  if (token == 0 || token == null) {
    AppDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOM_SLIDE,
      title:"انت غير مسجل بتطبيق ثمرة" ,
      desc: 'الرجاء تسجيل الدخول ةالانتثال لتسجيل الدخول',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: const LoginView(),
              );
            },
          ),
        );
      },
    ).show();

  } else {
    WalletModel walletModel = WalletModel(data: []);
    ChargeRepo.getChrageRepo(
      token: token,
      amount:qun,
     transaction_id:trans_id ,

    ).then((value) {
      walletModel = value;
      notifyListeners();
      getWalletFromRepo();
    });
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content:  Text(
          "تم الشحن ",
          style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),
        ),
        duration: const Duration(milliseconds: 35),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        elevation: 10,
        onVisible: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeView()));
        },
      ));
  }

  notifyListeners();
  getWalletFromRepo();
}//

getTransactionFromRepo()async{
  _sharedPreferences = await SharedPreferences.getInstance();
  var token = _sharedPreferences!.getString("token");
  transactionModel = await  TransactionRepo.getTransRepo(token: token);
  wallet = true ;
  notifyListeners();
}
getWalletFromRepo()async{
  _sharedPreferences = await SharedPreferences.getInstance();
  var token = _sharedPreferences!.getString("token");
  walletModel = await  WalletRepo.getWalletRepo(token: token);
  wallet = true ;
  notifyListeners();
}

}
