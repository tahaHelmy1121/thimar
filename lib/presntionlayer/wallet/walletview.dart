import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/wallet/walletviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/customwidget/statusapp/loadingScreen.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/transactions_history/transactionsview.dart';

import '../../const/color.dart';
import '../auth/widget/drewanytextauth.dart';
import '../charge_now/charge.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
  //  var  = context.watch<WalletViewModel>().walletModel;
    return ChangeNotifierProvider(
  create: (BuildContext context) => WalletViewModel(),
  child: Consumer<WalletViewModel>(
  builder: (context, wallet, child) {
  return Scaffold(
      appBar: drewAppBar(context: context, name: "المحفظة"),
      body: context.watch<WalletViewModel>().wallet == true
          ? RefreshIndicator(
            onRefresh: () {
        return      context.read<WalletViewModel>().getWalletFromRepo();
            },
            child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("رصيدك",
                              style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      wallet.walletModel.data.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    "ر.س"
                                    "${wallet.walletModel.data.first.afterCharge.toString()}",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          : Center(
                              child: Text(
                                  "لا يوجد رصيد بالمحفظة قم بالشحن الان ",
                                  style:GoogleFonts.tajawal(fontSize: 12,color: Colors.black)
                            )),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: sallaPayColor),
                        height: 54,
                        width: 343,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChargeNow()));
                          },
                          child: DottedBorder(
                            color: Colors.grey,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(20),
                            child: const Center(
                              child: Text(
                                "chargeNow",
                                style: TextStyle(
                                    color: DefaultColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 18, top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  context.push(const TransactionsView(), context);
                                },
                                child: Text("عرض الكل",
                                    style: GoogleFonts.tajawal(
                                        color: Colors.grey, fontSize: 14))),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                "سجل المعاملات",
                                style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: context.screenwidth,
                        height: 600,
                        child: wallet.walletModel.data.isNotEmpty
                            ? ListView.builder(
                                itemCount: wallet.walletModel.data.length,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          elevation: 0.0,
                                          child: Container(
                                            height: context.screenHeight * 0.11,
                                            margin: const EdgeInsets.only(
                                                left: 20, top: 30),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                    wallet.walletModel.data[index].date
                                                        .toString(),
                                                    style: GoogleFonts.tajawal(
                                                        color: Colors.grey,
                                                        fontSize: 14)),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      context
                                                                  .watch<
                                                                      WalletViewModel>()
                                                                  .wallet ==
                                                              false
                                                          ? Text(
                                                              "شحن المحفظة",
                                                              style: GoogleFonts
                                                                  .tajawal(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .green),
                                                            )
                                                          : Text(
                                                              wallet.walletModel.data[index]
                                                                  .statusTrans
                                                                  .toString(),
                                                              style: GoogleFonts.tajawal(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .green,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                      Text(
                                                        wallet.walletModel.data[index].transactionType
                                                            .toString(),
                                                        style: DrewAnyTextAuth.textOne,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            wallet.walletModel.data[index]
                                                                .beforeCharge
                                                                .toString(),
                                                            style: DrewAnyTextAuth
                                                                .textOne,
                                                          ),
                                                          Text(
                                                           "قبل الشحن:",style: GoogleFonts.tajawal(fontWeight: FontWeight.w600,color:Colors.grey,fontSize: 8),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [],
                                                      ),
                                                    ]),
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
                                    ))
                            : Center(
                                child: Text(
                                    "لا يوجد رصيد بالمحفظة قم بالشحن الان ",
                                    style:GoogleFonts.tajawal(fontSize: 12,color: Colors.black)
                              )),
                      )
                    ],
                  ),
                ),

            )
)
          : const LoadingScreen(),
    );
  },
),
);
  }
}
