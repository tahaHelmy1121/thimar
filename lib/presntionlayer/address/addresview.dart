import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/address/addressviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/address/addaddress.dart';

import '../../const/color.dart';
import '../confirmationorder/confirmationview.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    var fontStyle = GoogleFonts.tajawal(
        fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black);
    return ChangeNotifierProvider(
        create: (BuildContext context) =>
            AddressViewModel(reader: context.read),
        child: Scaffold(
            appBar: drewAppBar(context: context, name: "العناوين"),
            body: context.watch<AddressViewModel>().addressModel.data.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: context.screenHeight * 0.7,
                          child: Consumer<AddressViewModel>(
                            builder: (context, provider, child) {
                              return ListView.builder(
                                  itemCount: provider.addressModel.data.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        Confirmation(
                                                          address: context
                                                              .watch<
                                                                  AddressViewModel>()
                                                              .addressModel
                                                              .data[index]
                                                              .location
                                                              .toString(),
                                                          id: context
                                                              .watch<
                                                                  AddressViewModel>()
                                                              .addressModel
                                                              .data[index]
                                                              .id,
                                                        )));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8),
                                            width: context.screenwidth * 0.99,
                                            height: 120,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1),
                                                color: Colors.green.shade50),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      //    margin: EdgeInsets.only(left: 8),
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              //Edit Function
                                                            },
                                                            child: Image.asset(
                                                                "assets/image/Group 17714.png"),
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      AddressViewModel>()
                                                                  .reoveAddress(
                                                                      id: context
                                                                          .read<
                                                                              AddressViewModel>()
                                                                          .addressModel
                                                                          .data[
                                                                              index]
                                                                          .id,
                                                                      context:
                                                                          context);
                                                            },
                                                            child: Image.asset(
                                                                "assets/image/Group 17715.png"),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 250,
                                                      height: 90,
                                                      margin: EdgeInsets.only(
                                                          right: 30),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                provider
                                                                    .addressModel
                                                                    .data[index]
                                                                    .type
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .tajawal(
                                                                        fontSize:
                                                                            10),
                                                              ),
                                                              Text(
                                                                "المنزل",
                                                                style: GoogleFonts.tajawal(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                height: 24,
                                                                width: 180,
                                                                child: Text(
                                                                  provider
                                                                      .addressModel
                                                                      .data[
                                                                          index]
                                                                      .location,
                                                                  style: GoogleFonts
                                                                      .tajawal(
                                                                          fontSize:
                                                                              8),
                                                                ),
                                                              ),
                                                              Text(
                                                                "العنوان",
                                                                style: GoogleFonts.tajawal(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          ),
                                                          //       SizedBox(height: 6,),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                provider
                                                                    .addressModel
                                                                    .data[index]
                                                                    .description
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .tajawal(
                                                                        fontSize:
                                                                            10),
                                                              ),
                                                              Text(
                                                                "الوصف",
                                                                style: GoogleFonts.tajawal(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                provider
                                                                    .addressModel
                                                                    .data[index]
                                                                    .phone
                                                                    .toString(),
                                                                style: GoogleFonts.tajawal(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              Text(
                                                                ":رقم الجوال",
                                                                style: GoogleFonts.tajawal(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                                      builder: (context) =>
                                      const AddAddressView()));
                            },
                            child: DottedBorder(
                              color: Colors.grey,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(20),
                              child: const Center(
                                child: Text(
                                  "اضافة عنوان",
                                  style: TextStyle(
                                      color: DefaultColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 250,),
                          Container(
                            child: Center(child: Text("قم باضافة عنوان محدد")),
                          ),
                          SizedBox(height: 18,),
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
                                        builder: (context) =>
                                        const AddAddressView()));
                              },
                              child: DottedBorder(
                                color: Colors.grey,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(20),
                                child: const Center(
                                  child: Text(
                                    "اضافة عنوان",
                                    style: TextStyle(
                                        color: DefaultColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
  }
}
