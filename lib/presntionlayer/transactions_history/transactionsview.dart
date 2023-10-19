import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/wallet/walletviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/customwidget/statusapp/loadingScreen.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../auth/widget/drewanytextauth.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    var transaction = context.watch<WalletViewModel>().transactionModel;
    return Scaffold(
      appBar: drewAppBar(context: context, name: "سجل المعاملات"),
      body: context.watch<WalletViewModel>().wallet == true
          ? Container(
              width: context.screenwidth,
              height: double.infinity,
              child: transaction.data.isEmpty
                  ? Center(
                    child: Text("لا يوجد معاملات للمستخم قم بالشحن الان  ",
                        style: GoogleFonts.alkalami(
                            fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold)),
                  )
                  : ListView.builder(
                      itemCount: transaction.data.length,
                      itemBuilder: (context, index) => Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                elevation: 0.0,
                                child: Container(
                                  height: context.screenHeight * 0.085,
                                  margin: EdgeInsets.only(left: 20, top: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          transaction.data[index].date
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                              color: Colors.grey,
                                              fontSize: 14)),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "شحن المحفظة",
                                            style: DrewAnyTextAuth.textOne,
                                          ),
                                          Text(
                                            "${transaction.data[index].beforeCharge.toString()}",
                                            style: DrewAnyTextAuth.textOne,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 18, bottom: 20),
                                        child: Container(
                                          child: Image.asset(
                                              "assets/image/arrow-top.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
            )
          : LoadingScreen(),
    );
  }
}
