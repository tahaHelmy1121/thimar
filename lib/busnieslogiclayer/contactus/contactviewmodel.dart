import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/repostory/getcontact.dart';
import 'package:untitled1/helper/massage.dart';
import 'package:untitled1/helper/resultprocess.dart';

import '../../datalayer/model/cotactusmodel.dart';
import '../../datalayer/model/getcontactmodel.dart';
import '../../datalayer/repostory/contactusrepo.dart';
import '../../presntionlayer/home/home.dart';

class ContactViewModel extends ChangeNotifier {
  ContactViewModel() {
    getContactFromRepo();
  }

  SharedPreferences? sharedPreferences;
  ContactModel contact = ContactModel();
  bool contactLoading = false;

  getContactFromRepo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    contact = await ContactRepo.getContactRepo(customer: token);
    contactLoading = true;
    notifyListeners();
  }

  final name = TextEditingController();
  final phone = TextEditingController();
  final subject = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  ContactUsModel contactUsModel = ContactUsModel();

  TextEditingController passwordController = TextEditingController();

  editProfile({required context, fullName, phone, title, content}) async {
    contactUsModel = await ContactUsRepoRepo.CreateContactRepo(
      fullname: fullName,
      content: content,
      phone: phone,
      //  title: "test"
    );
    if (contactUsModel.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: contactUsModel.message.toString(),
        status: "success",
        nav: HomeView(),
      );
      notifyListeners();
    } else {
      MassageApp.flusherBarErrorMassage(
          context, contactUsModel.message.toString(), "", (flushbar) {});
    }
    notifyListeners();
    //   getContactFromRepo();
  }

  @override
  void dispose() {
    name.dispose();
    subject.dispose();
    phone.dispose();
    super.dispose();
  }
}
