import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/busnieslogiclayer/home/homeviewmodel.dart';
import 'package:untitled1/helper/extenstion.dart';

import 'auth/widget/drewanytextauth.dart';

class SubDetailsCategory extends StatefulWidget {
  var name;

  // var id ;
  SubDetailsCategory({super.key, this.name});

  @override
  State<SubDetailsCategory> createState() => _SubDetailsCategoryState();
}

class _SubDetailsCategoryState extends State<SubDetailsCategory> {
  @override
  Widget build(BuildContext context) {
    var pro = context.watch<HomePageProvider>().pro;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        )),
        centerTitle: true,
        title: Text(
          widget.name.toString(),
          style: GoogleFonts.tajawal(
              letterSpacing: 2,
              color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: pro.data.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                width:context.screenwidth*0.9,
                height: context.screenHeight*0.9,
                child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 2,
                              mainAxisExtent: 200,
                            ),
                            itemCount: pro.data.length,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 6, top: 8),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: context.screenwidth * 0.4,
                                              height:
                                                  context.screenHeight * 0.1,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.amberAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: CachedNetworkImage(
                                                imageUrl: pro
                                                    .data[position].mainImage
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Shimmer(
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Colors.green,
                                                        Colors.greenAccent
                                                      ]),
                                                  child: Container(
                                                    color: Colors.grey.shade200,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.image),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          //       margin: const EdgeInsets.only(right: 100, bottom: 20),
                                          width: 60,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(17),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                              color: Colors.green.shade700),
                                          child: Center(
                                              child: Text(
                                            "${pro.data[position].discount.toString()}%",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                              pro.data[position].title
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: Text(
                                              "السعر / ${pro.data[position].amount}كج",
                                              style: GoogleFonts.abrilFatface(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          //     crossAxisAlignment: CrossAxisAlignment.end ,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Row(
                                              //   mainAxisAlignment: MainAxisAlignment.end,P
                                              //      crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                    pro.data[position]
                                                        .priceBeforeDiscount
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.green,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                    pro.data[position].price
                                                        .toString(),
                                                    style: DrewAnyTextAuth
                                                        .textOne),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),

                      )
    )

          : Center(
              child: Lottie.asset(
                  "assets/lotti/Animation - 1696423727076 (1).json")),
    );
  }
}
