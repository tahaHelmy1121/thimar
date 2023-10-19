import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/orders/orderdetails.dart';

import '../../busnieslogiclayer/order/orderviewmodel.dart';

class CurrentOrders extends StatefulWidget {
  const CurrentOrders({super.key});

  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<OrderViewModel>().currentOrderModel;
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrderViewModel(),
      child: Scaffold(
        body: provider.data.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                      width: 400,
                      height: context.screenHeight * 0.9,
                      child: Container(
                        width: double.infinity,
                        height: 450,
                        child: ListView.builder(
                            itemCount: provider.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.push(
                                            OrderDetailsView(
                                              status:
                                                  provider.data[index].status,
                                              id: provider.data[index].id,
                                              location:
                                                  provider.data[index].location,
                                              //    image:  provider.data[index].products[index].url,
                                              orderPrice: provider
                                                  .data[index].deliveryPrice,
                                              totalPrice: provider
                                                  .data[index].totalPrice,
                                              date: provider.data[index].date,
                                              deliveryPrice: provider
                                                  .data[index].orderPrice,
                                            ),
                                            context);
                                      },
                                      child: Container(
                                          width: 70,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.green.shade100,
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Center(
                                              child: Text(
                                            provider.data[index].status
                                                .toString(),
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
                                          "طلب# ${provider.data[index].id.toString()}",
                                          style: GoogleFonts.aguafinaScript(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Text(
                                          "${provider.data[index].date.toString()}",
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
                                                Container(
                                                    width: 110,
                                                    height: 25,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: provider
                                                            .data[index]
                                                            .products
                                                            .length,
                                                        itemBuilder:
                                                            (context, p) {
                                                          return Row(
                                                            children: [
                                                              Image.network(
                                                                provider
                                                                    .data[index]
                                                                    .products[p]
                                                                    .url
                                                                    .toString(),
                                                                height: 100,
                                                                width: 38,
                                                              ),
                                                            ],
                                                          );
                                                        })),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          ":${AppLocalizations.of(context)!.productCode.toString()}${provider.data[index].orderPrice.toString()}",
                                          style: GoogleFonts.tajawal(
                                              fontSize: 14, color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ))
                ],
              ))
            : Center(
                child: Text(
                "لا يوجد طلبات تم تحضيرها ",
                style: GoogleFonts.taiHeritagePro(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green),
              )),
      ),
    );
  }
}
