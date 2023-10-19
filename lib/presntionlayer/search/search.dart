

       import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../../busnieslogiclayer/cart/cartviewmodel.dart';
import '../../busnieslogiclayer/home/homeviewmodel.dart';
import '../auth/widget/drewanytextauth.dart';

Widget drewSearchProduct(BuildContext context){
  var search =
      Provider.of<HomePageProvider>(context).searchmodel;
  return SizedBox(
      width: context.screenwidth,
      height: context.screenHeight * 0.50,
      child:search.data!.searchResult.isNotEmpty? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 7,
            crossAxisSpacing: 5,
            mainAxisExtent: 250,
          ),
          itemCount: context.watch<HomePageProvider>().searchmodel.data!.searchResult.length,
          itemBuilder: (context, position) {
            return Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: context.screenwidth*0.5,
                          height: context.screenHeight*0.11,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.amberAccent),
                              borderRadius: BorderRadius.circular(50)),
                          child: CachedNetworkImage(
                            imageUrl: search.data!.searchResult[position].mainImage
                                .toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer(
                              gradient:  LinearGradient(colors: [
                                Colors.green,
                                Colors.greenAccent
                              ]),
                              child: Container(
                                color: Colors.grey.shade200,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.image),
                          ),
                        ),
                      ],
                    ),
                    Container(
                //      margin: const EdgeInsets.only(right: 100, bottom: 20),
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(4),
                            topLeft: Radius.circular(17),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.green.shade700),
                      child: Center(
                          child: Text(
                            "${ search.data!.searchResult[position].discount.toString()}%",
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
                Text(
                          search.data!.searchResult[position].title.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(9),
                      child: Text(

                          "السعر / ${ search.data!.searchResult[position].amount}كج",
                          style: GoogleFonts.abrilFatface(
                              fontWeight: FontWeight.bold, fontSize: 8)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1, left: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                context.read<CartViewModel>().addCart(
                                  context: context,
                                  itemIndex: position,
                                  qun: search.data!.searchResult[position].amount,
                                  productId:
                                  search.data!.searchResult[position].id,

                                  //  remove: true
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green.shade800,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                        "assets/image/Icon ionic-ios-add.png")),
                              ),
                            ),
                          ),
                          SizedBox(width: 6,),
                          Text(
                              search.data!.searchResult[position].priceBeforeDiscount
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.lineThrough)),
                          const SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                                search.data!.searchResult[position].price
                                    .toString(),
                                style: DrewAnyTextAuth.textOne),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 8),
                  height: 30,
                  width: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Image.asset(
                            "assets/image/Icon ionic-ios-add.png")),
                  ),
                ),
              ],
            );
          }):Center(child: Container(

          child: Column(
            children: [
               Container(
                 margin: EdgeInsets.only(top: 40),
                 width: 100,
                 height: 100,
                 child: Lottie.asset("assets/lotti/animation_llof8voh.json"),
               ),
              SizedBox(height: 14,),
              Text("لا يوجد بيانات لهذا الحرف",style: DrewAnyTextAuth.textOne,),
            ],
          ))))

  ;


}