import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/helper/massage.dart';

import '../../datalayer/model/confirm_order_model.dart';
import '../../datalayer/repostory/storeorderrepo.dart';
import '../../helper/resultprocess.dart';
import '../../presntionlayer/home/home.dart';

class ConfirmationViewModel extends ChangeNotifier {
  BuildContext? context;

  ConfirmOrderModel confirmOrderModel = ConfirmOrderModel();
  bool store = false;
  TextEditingController noteController = TextEditingController();
  SharedPreferences? _sharedPreferences;
  addAddress( {note,
    time,
    id,
    pay,
    city_id,
    cupon,
    transcation,
    date,
    address_id,
    context}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var token = _sharedPreferences!.getString("token");
    confirmOrderModel = await AddOrderRepo.orderRepo(
      token: token.toString(),
      note: note.toString(),
      time: time.toString(),
 //     pay_type: pay.toString(),
    //  city_id:12.toString(),
  //     coupon_code: "blender2".toString(),
    //    transaction_id:123.toString(),
      address_id: address_id.toString(),
      date: date.toString(),
    );
    if (confirmOrderModel.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: confirmOrderModel.message.toString(),
        status: "success",
        nav: const HomeView(),
      );
      notifyListeners();
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: "${confirmOrderModel.message.toString()}",
          status: false);
    }
    notifyListeners();
  }


  notifyListeners();
}
