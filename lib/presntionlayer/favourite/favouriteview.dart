import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/busnieslogiclayer/favourite/favouriteviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/customwidget/statusapp/loadingScreen.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../auth/widget/drewanytextauth.dart';
import '../home/widget/drewnavbar.dart';

class Favouriteview extends StatefulWidget {
  const Favouriteview({super.key});

  @override
  State<Favouriteview> createState() => _FavouriteviewState();
}

class _FavouriteviewState extends State<Favouriteview> {
  @override
  Widget build(BuildContext context) {
      var fav = context.watch<FavouriteViewModel>().fav;
    return ChangeNotifierProvider(
      create: (BuildContext context) => FavouriteViewModel(),
      child: Consumer<FavouriteViewModel>(
        builder: (context, provider, child) {
          return Scaffold(
            bottomNavigationBar: drewNavBar(context),
            appBar: drewAppBar(context: context, name: "المفضلة"),
            body: provider.fav.data.isNotEmpty
                ? SingleChildScrollView(
                    child: SizedBox(
                    width: context.screenwidth,
                    height: context.screenHeight * 0.70,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 2,
                          mainAxisExtent: 200,
                        ),
                        itemCount: provider.fav.data.length,
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
                                          height: context.screenHeight * 0.1,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.amberAccent),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: CachedNetworkImage(
                                            imageUrl: provider
                                                .fav.data[position].mainImage
                                                .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer(
                                              gradient: const LinearGradient(
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
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(4),
                                            topLeft: Radius.circular(17),
                                            bottomRight: Radius.circular(20),
                                          ),
                                          color: Colors.green.shade700),
                                      child: Center(
                                          child: Text(
                                        "${provider.fav.data[position].discount.toString()}%",
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
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                          provider.fav.data[position].title
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
                                          "السعر / ${provider.fav.data[position].amount}كج",
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
                                        Container(
                                          height: 30,
                                          width: 30,
                                          //     margin: const EdgeInsets.only(right: 30),
                                          child: InkWell(
                                            onTap: () {
                                              context
                                                  .read<FavouriteViewModel>()
                                                  .getRemoveToFav(
                                                      index: position,
                                                      id: context
                                                          .read<
                                                              FavouriteViewModel>()
                                                          .fav
                                                          .data[position]
                                                          .id,
                                                      context: context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  //       color: Colors.green.shade800,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Image.asset(
                                                      "assets/image/d2.png")),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          //   mainAxisAlignment: MainAxisAlignment.end,P
                                          //      crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                provider.fav.data[position]
                                                    .priceBeforeDiscount
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                                provider
                                                    .fav.data[position].price
                                                    .toString(),
                                                style: DrewAnyTextAuth.textOne),
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
                  ))
                : Center(
                    child: Center(
                    child: Text(
                      "المفضلة فارغة قم باضافة المنتجات ",
                      style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                          fontSize: 14),
                    ),
                  )),
          );
        },
      ),
    );
  }
}
