import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/address/addressviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/cart/cartviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';
import 'package:untitled1/presntionlayer/cart/widget/drewcupon.dart';
import 'package:untitled1/presntionlayer/cart/widget/drewnameprice.dart';
import 'package:untitled1/presntionlayer/cart/widget/drewnuttoncart.dart';
import 'package:untitled1/presntionlayer/cart/widget/drewthirdtotalcart.dart';
import 'package:untitled1/presntionlayer/home/widget/drewnavbar.dart';

import '../../customwidget/custombutton.dart';
import '../confirmationorder/confirmationview.dart';
import 'drewimage.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartViewProduct = context.watch<CartViewModel>().cartModel;
    return Scaffold(
      bottomNavigationBar: drewNavBar(context),
        appBar: drewAppBar(context: context, name: "السله"),
        body: context.watch<CartViewModel>().cartModel.data.isNotEmpty
            ? SingleChildScrollView(
                child: RefreshIndicator(
                  displacement: 1,
                  color: Colors.green,
                  strokeWidth: 5,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: () async {
                    return await context.read<CartViewModel>().getCart(context);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: context.screenHeight * 0.7,
                        child: ListView.builder(
                            itemCount: cartViewProduct.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 0,
                                shape: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<CartViewModel>()
                                            .getRemoveToCart(
                                              index: index,
                                              context: context,
                                              cartItemId: cartViewProduct
                                                  .data[index].id,
                                            );
                                      },
                                      child: Container(

                                        width: context.screenwidth * 0.1,
                                        height: context.screenHeight * 0.1,
                                        child: Image.asset(
                                            "assets/image/Group 17538.jpg"),
                                      ),
                                    ),

                                    Column(
                                      children: [
                                        drewNameAndPriceQun(
                                          context: context,
                                            price: cartViewProduct
                                                .data[index].price
                                                .toString(),
                                            title: cartViewProduct
                                                .data[index].title
                                                .toString(),
                                            amount: cartViewProduct
                                                .data[index].amount
                                                .toString()),
                                        //      SizedBox(width: 12,),
                                        Container(

                                            width:110,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: drewButtonCart(
                                                index: index,
                                                context: context,
                                                amount: cartViewProduct
                                                    .data[index].amount
                                                    .toString())),
                                      ],
                                    ),
                                    drewImageCart(
                                        context: context,
                                        image: cartViewProduct.data[index].image
                                            .toString())
                                  ],
                                ),
                              );
                            }),
                      ),
                      drewCupon(context: context),
                      const SizedBox(
                        height: 8,
                      ),

                      Container(
                          width: context.screenwidth * 0.95,
                          height: context.screenHeight * 0.20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green.shade50),
                          child: drewThirdCartTotal(
                              totalDiscount: cartViewProduct.totalDiscount
                                  .toString(),
                              totalPriceBeforeDiscount: cartViewProduct
                                  .totalPriceBeforeDiscount
                                  .toString(),
                              totalPriceWithVat: cartViewProduct
                                  .totalPriceWithVat
                                  .toString())),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                          width: 250,
                          height: 100,

                          child: drewCustomButton(
                              tab: () {
                                context.push(Confirmation(), context);
                              },
                              name: "الانتقال لإتمام الطلب")
                      ),

                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Container(
                    child: Lottie.asset("assets/lotti/waze.json"),
                  ),
                  Text(
                    "Cart Is Empty ",
                    style: DrewAnyTextAuth.textOne,
                  )
                ],
              ));
  }
}
