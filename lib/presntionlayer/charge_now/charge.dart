import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/wallet/walletviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/charge_now/widget/charge_field.dart';

import '../../customwidget/custombutton.dart';
import '../profile/widget/form_feild.dart';

class ChargeNow extends StatefulWidget {
  const ChargeNow({super.key});

  @override
  State<ChargeNow> createState() => _ChargeNowState();
}

class _ChargeNowState extends State<ChargeNow> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController start = TextEditingController();
    TextEditingController end = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: context.read<WalletViewModel>().globalKey,
            child: Column(
              children: [
                drewChargeBody(
                  controller:  context.watch<WalletViewModel>().amountController,
                  context: context,
                  text: "معلومات المبلغ",
                  image: "assets/image/dollar.png",
                  hintText: "المبلغ الخاص بك",
                  valid: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "ادخال المبلغ المطلوب";
                    }
                    return null;
                  },
                ),
                drewChargeBody(
                  controller: name,
                  context: context,
                  text: "معلومات البطاقة",
                  image: "assets/image/COCO-Line-User.png",
                  hintText: "الاسم",
                  valid: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "ادخال الاسم";
                    }
                    return null;
                  },
                ),
                Row(
                  //    crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    drewFormInfo(
                      mycontroller: context.watch<WalletViewModel>().trIdontroller,
                        valid: (val) {},
                        width: context.screenwidth * 0.9,
                        hintText: "رقم البطاقة الائتمانية",
                        //    labelText: "اسم المستخدم",
                        edgeInsets: const EdgeInsets.only(right: 14, top: 35),
                        image: "assets/image/COCO-Line-Wallet.png"),
                  ],
                ),
                Row(
                  //    crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    drewFormInfo(
                      mycontroller: start,
                        valid: (val) {},
                        width: context.screenwidth * 0.4,
                        hintText: "رقم المتسلسل",
                        //    labelText: "اسم المستخدم",
                        edgeInsets: const EdgeInsets.only(left: 35, top: 35),
                        image: "assets/image/arrow-top.png"),
                    drewFormInfo(
                        mycontroller:end,
                        valid: (val) {},
                        width: context.screenwidth * 0.4,
                        hintText: "تاريخ الانتهاء",
                        //    labelText: "اسم المستخدم",
                        edgeInsets: const EdgeInsets.only(right: 14, top: 35),
                        image: "assets/image/COCO-Line-Wallet.png"),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
                drewCustomButton(
                    tab: () {
                      var amount =
                          context.read<WalletViewModel>().amountController;
                      var transtionId =
                          context.read<WalletViewModel>().trIdontroller;

                              context.read<WalletViewModel>().charge(
                                  qun: amount.text ,
                                  trans_id: transtionId.text,
                                  context: context);
                              setState(() {
                                amount.clear();
                                transtionId.clear();
                                name.clear();
                                start.clear();
                                end.clear();
                              });
                    },
                    name: "دفع"),
              ],
            ),
          ),
        ),
        appBar: drewAppBar(
          context: context,
          name: "شحن الان",
        ));
  }
}
