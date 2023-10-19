import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/busnieslogiclayer/favourite/favouriteviewmodel.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/productdetails/widget/product_details.dart';

import '../../../busnieslogiclayer/cart/cartviewmodel.dart';
import '../../../busnieslogiclayer/home/homeviewmodel.dart';
import '../../../datalayer/model/productsmodel.dart';
import '../../auth/widget/drewanytextauth.dart';

class DrewHomeProduct extends StatelessWidget {
  ProductsModel productsData;

  DrewHomeProduct({super.key, required this.productsData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.screenwidth,
        height: context.screenHeight * 0.85,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 7,
              crossAxisSpacing: 5,
              mainAxisExtent: 280,
            ),
            itemCount: productsData.data.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context.push(
                                    ProductDetailsSection(
                                      image:
                                          productsData.data[position].mainImage,
                                      discount:
                                          productsData.data[position].discount,
                                      price: productsData.data[position].price,
                                      priceBeforeDiscount: productsData
                                          .data[position].priceBeforeDiscount,
                                      description: productsData
                                          .data[position].description,
                                      amount:
                                          productsData.data[position].amount,
                                      code: productsData.data[position].id,
                                      name: productsData.data[position].title
                                          .toString(),
                                    ),
                                    context);
                              },
                              child: Container(
                                width: context.screenwidth * 0.4,
                                height: context.screenHeight * 0.11,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.amberAccent),
                                    borderRadius: BorderRadius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: productsData
                                      .data![position].mainImage
                                      .toString(),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Shimmer(
                                    gradient: const LinearGradient(colors: [
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
                            ),
                          ],
                        ),
                        Container(
                          //       margin: const EdgeInsets.only(right: 100, bottom: 20),
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
                            "${productsData.data[position].discount.toString()}%",
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
                          padding: const EdgeInsets.only(right: 18),
                          child: Text(
                              productsData.data![position].title.toString(),
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                              "السعر / ${productsData.data[position].amount}كج",
                              style: GoogleFonts.abrilFatface(
                                  fontWeight: FontWeight.w100, fontSize: 9)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1, left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(right: 40),
                                child: InkWell(
                                  onTap: () {
                                    context.read<CartViewModel>().addCart(
                                        context: context,
                                        itemIndex: position,
                                        qun: productsData.data[position].amount,
                                        productId:
                                            productsData.data[position].id,
                                        remove: true);
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
                              Text(
                                  productsData
                                      .data[position].priceBeforeDiscount
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
                                    productsData.data[position].price
                                        .toString(),
                                    style: DrewAnyTextAuth.textOne),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.read<FavouriteViewModel>().addFav(
                            itemIndex: position,
                            context: context,
                            productId: context
                                .read<HomePageProvider>()
                                .categoriesProductModel
                                .data[position]
                                .id);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 30, top: 10),
                        height: context.screenHeight * 0.05,
                        width: context.screenwidth * 0.20,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Image.asset(
                                  "assets/image/Icon ionic-ios-heart-empty.png")),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
