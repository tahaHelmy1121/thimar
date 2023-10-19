import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/address/addressviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/profile/profileviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/address/addresview.dart';
import 'package:untitled1/presntionlayer/confirmationorder/widget/drewnoteorder.dart';
import 'package:untitled1/presntionlayer/confirmationorder/widget/paymentway.dart';

import '../../busnieslogiclayer/cart/cartviewmodel.dart';
import '../../busnieslogiclayer/confirmationorder/confirmationorderviewmodel.dart';
import '../../const/color.dart';
import '../../customwidget/custombutton.dart';
import '../cart/widget/drewthirdtotalcart.dart';

class Confirmation extends StatefulWidget {
  // var name;
  var address;
  var id;

  Confirmation({super.key, this.address, this.id});

  // final String address;
  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final bool _isMoneyChoosed = true;

  final bool _isVisaChoosed = true;
  DateTime selected = DateTime.now();
  TimeOfDay timeSelected = TimeOfDay.now();
  String? day;
  String? timePicker;

  //   String? getDay = CasheHelper.getData(key: "date");
  // String? getTime = CasheHelper.getData(key: "time");
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);
  int? index;

  @override
  Widget build(BuildContext context) {
    var cartViewProduct = context.watch<CartViewModel>().cartModel;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ConfirmationViewModel(),
      child: Scaffold(
          appBar: drewAppBar(context: context, name: "إتمام الطلب"),
          body: context.watch<AddressViewModel>().address == true
              ? Consumer<ConfirmationViewModel>(
                  builder: (context, provider, child) {
                    return SingleChildScrollView(
                        child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  context
                                              .watch<ProfileViewModel>()
                                              .profileModel
                                              .data !=
                                          null
                                      ? Text(
                                          context
                                              .watch<ProfileViewModel>()
                                              .profileModel
                                              .data!
                                              .fullname
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                              fontSize: 12,
                                              color: Colors.green.shade800,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.green,
                                          ),
                                        ),
                                  Text(
                                    ":الاسم",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 12,
                                        color: Colors.green.shade800),
                                  )
                                ],
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  context
                                              .watch<ProfileViewModel>()
                                              .profileModel
                                              .data !=
                                          null
                                      ? Text(
                                          context
                                              .watch<ProfileViewModel>()
                                              .profileModel
                                              .data!
                                              .phone
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                              fontSize: 12,
                                              color: Colors.green.shade800,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(
                                          color: Colors.green,
                                        )),
                                  Text(
                                    ":الجوال ",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 12,
                                        color: Colors.green.shade900),
                                  )
                                ],
                              ))
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.all(14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.push(const AddressView(), context);
                                },
                                child: Image.asset(
                                  "assets/image/Group 17546.png",
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "اختر عنوان التوصيل",
                                style: GoogleFonts.tajawal(
                                    fontSize: 12,
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 18,
                      ),
                      context
                              .watch<AddressViewModel>()
                              .addressModel
                              .data
                              .isNotEmpty
                          ? Container(
                              width: context.screenwidth * 0.9,
                              height: 45,
                              child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border:
                                              Border.all(color: Colors.green)),
                                      width: context.screenwidth * 0.9,
                                      height: 33,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/image/arrowdown.png"),
                                          Container(
                                              height: 150,
                                              width: 260,
                                              child: widget.address == null
                                                  ? Text(
                                                      "الرجاء اختار العنوان لتنفيز الطلب",
                                                      style:
                                                          GoogleFonts.tajawal(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )
                                                  : Text(
                                                      widget.address.toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            ),
                      Container(
                        margin: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "اختر الوقت و التاريخ",
                              style: GoogleFonts.tajawal(
                                  fontSize: 12,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 168,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.6), width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await displayDatePicker(context);
                                  },
                                  child: const Text(
                                    "اختر اليوم والتاريخ",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: DefaultColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                    "assets/image/COCO-Duotone-Calendar.png")
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 168,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.6), width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then(
                                      (value) => {
                                        print(value!.format(context)),
                                        timePicker =
                                            "${value.hour}:${value.minute}",
                                        print(timePicker)
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "اختر الوقت",
                                    style: TextStyle(
                                        color: DefaultColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                    "assets/image/COCO-Duotone-time.png")
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "ملاحظات وتعليمات",
                              style: GoogleFonts.tajawal(
                                  fontSize: 12,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                      drewNoteOrder(
                          context: context,
                          controller: provider.noteController,
                          width: context.screenwidth * 0.9,
                          height: context.screenHeight * 0.2),
                      Container(
                        margin: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "اختر طريقة الدفع",
                              style: GoogleFonts.tajawal(
                                  fontSize: 12,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                      choicePaymentWay(),
                      Container(
                        margin: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "ملخص الطلب",
                              style: GoogleFonts.tajawal(
                                  fontSize: 12,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: context.screenwidth * 0.9,
                        height: 100,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return drewCustomButton(
                                  tab: () {
                                    context
                                        .read<ConfirmationViewModel>()
                                        .addAddress(
                                            context: context,
                                            date: day,
                                            note: context
                                                .read<ConfirmationViewModel>()
                                                .noteController
                                                .text,
                                            time: timePicker!.split(' ')[0],
                                            //    city_id: 12.toString(),
                                            address_id: widget.id);
                                  },
                                  name: "إنهاء الطلب");
                            }),
                      ),
                      drewThirdCartTotal(
                          totalDiscount:
                              cartViewProduct.totalDiscount.toString(),
                          totalPriceBeforeDiscount: cartViewProduct
                              .totalPriceBeforeDiscount
                              .toString(),
                          totalPriceWithVat:
                              cartViewProduct.totalPriceWithVat.toString())
                    ]));
                  },
                )
              : Center(
                  child: Text(
                    "لايوجد عنوان متاح قم باضافة عنوان ثم قم باكمال العملية ",
                    style:
                        GoogleFonts.akayaTelivigala( fontSize: 10, color: Colors.green,fontWeight: FontWeight.bold),
                  ),
                )),
    );
  }

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      setState(() {
        day = date.toLocal().toString().split(" ")[0];
        print(day);
        //  CasheHelper.saveDate(key: "date", value: day);
      });
    }
  }
}
