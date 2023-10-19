

   import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/repostory/aboutrepo.dart';

import '../../datalayer/model/aboutmodel.dart';
import '../../datalayer/model/policy_model.dart';
import '../../datalayer/repostory/policy.dart';

class AboutViewModel extends ChangeNotifier {
  AboutViewModel(){
    getProfileFromRepo();
    getPolicyFromRepo();
  }
  bool aboutLoading = false;

  SharedPreferences? sharedPreferences;

  AboutModel aboutModel = AboutModel ();
  PolicyModel policyModel = PolicyModel();
  getProfileFromRepo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    aboutModel = await AboutRepo.getAboutRepo(customer: token);
    aboutLoading = true;
    notifyListeners();
  }
  getPolicyFromRepo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    policyModel = await policyRepo.getPolicyRepo();
    aboutLoading = true;
    notifyListeners();
  }




}