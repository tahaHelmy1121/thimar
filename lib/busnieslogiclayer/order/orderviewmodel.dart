import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../datalayer/model/current_order_model.dart';
import '../../datalayer/repostory/currentrepo.dart';

class OrderViewModel extends ChangeNotifier {
  OrderViewModel() {
    getOrder();
  }

  CurrentOrderModel _currentOrderModel = CurrentOrderModel(data: []);
  bool order = false;

  CurrentOrderModel get currentOrderModel => _currentOrderModel;

  set currentOrderModel(CurrentOrderModel value) {
    _currentOrderModel = value;
  }

  SharedPreferences? _sharedPreferences;

  getOrder() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("token");
    currentOrderModel =
        await CurrentOrderRepo.getOrderRepo(customer: customer);
    order = true;
    notifyListeners();
  }

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  set sharedPreferences(SharedPreferences? value) {
    _sharedPreferences = value;
  }

  void cancelOrder(){
    //this is function
  }
}
