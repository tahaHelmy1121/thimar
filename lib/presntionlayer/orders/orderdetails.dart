import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../../busnieslogiclayer/order/orderviewmodel.dart';
import '../../customwidget/custombutton.dart';
import '../cart/widget/drewthirdtotalcart.dart';

class OrderDetailsView extends StatefulWidget {
  var id;

  var location;
  var image;

  var orderPrice;

  var deliveryPrice;
  var Location;
  var totalPrice;
  var date;
  var status;

  OrderDetailsView(
      {super.key,
      this.id,
      this.totalPrice,
      this.deliveryPrice,
      this.orderPrice,
      this.location,
      this.image,
      this.date,
      this.status,
      this.Location});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    // var provider = context.watch<OrderViewModel>().currentOrderModel;
    return Scaffold(
        appBar: drewAppBar(context: context, name: "تفاصيل الطلب"),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                //  width: context.screenwidth*0.9,
                height: context.screenHeight * 0.2,
                child: Container(
                  width: double.infinity,
                  height: 450,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.green.shade100,
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Center(
                                        child: Text(
                                      widget.status.toString(),
                                      style: GoogleFonts.aboreto(
                                          color: Colors.green,
                                          fontSize: 8,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "طلب# ${widget.id}",
                                    style: GoogleFonts.aguafinaScript(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    "${widget.date}",
                                    style: GoogleFonts.aguafinaScript(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "تكلفة الاوردر :${widget.totalPrice}ر.س",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Text(
                      "عنوان التوصيل",
                      style: GoogleFonts.tajawal(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/image/Group 932.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          child:widget.location==null?Text("لم يتم اختيار العنوان "): Text(
                          widget.location.toString(),
                            style: GoogleFonts.tajawal(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "ملخص الطلب",
                      style: GoogleFonts.tajawal(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
              ],
            ),
            Container(
                width: context.screenwidth * 0.95,
                height: context.screenHeight * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade50),
                child: drewThirdCartTotal(
                    totalDiscount: widget.orderPrice,
                    totalPriceBeforeDiscount: widget.deliveryPrice,
                    totalPriceWithVat: widget.totalPrice)),
            SizedBox(height: 25,),
            Container(
                width: 140,
                height: 65,

                child: drewCustomButton(
                    tab: () {
                  //    context.push(Confirmation(), context);
                    },
                    name: "الغاء الطلب")
            ),
          ],
        )));
  }
}
