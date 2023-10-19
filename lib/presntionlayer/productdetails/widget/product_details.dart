import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/busnieslogiclayer/home/homeviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/customwidget/statusapp/loadingScreen.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import '../../../busnieslogiclayer/cart/cartviewmodel.dart';

class ProductDetailsSection extends StatefulWidget {
  var name;

  var image;
  var discount;
  var description;

  var price;

  var code;
  var amount;
  var priceBeforeDiscount;

  ProductDetailsSection(
      {super.key,
      this.name,
      this.discount,
      this.image,
      this.description,
      this.price,
      this.code,
      this.amount,
      this.priceBeforeDiscount});

  @override
  State<ProductDetailsSection> createState() => _ProductDetailsSectionState();
}

class _ProductDetailsSectionState extends State<ProductDetailsSection> {
  @override
  Widget build(BuildContext context) {
    var cartViewProduct = context.watch<CartViewModel>().cartModel;
    return Scaffold(
      appBar: drewAppBar(context: context, name: "تفاصيل المنتج"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            Container(
              //    margin: EdgeInsets.only(left: 18, top: 18),
              width: context.screenwidth*0.9,
              height: context.screenHeight * 0.3,
              child: Swiper(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.green.shade100)),
                      child: context
                              .watch<HomePageProvider>()
                              .categoriesProductModel
                              .data
                              .isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: widget.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer(
                                    gradient: LinearGradient(colors: [
                                      Colors.green,
                                      Colors.greenAccent
                                    ]),
                                    child: Container(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                              errorWidget: (context, url, error) => Center(
                                      child: Text(
                                    "تعزر تحميل الصورة تحقق من جودة الانترنت",
                                    style: DrewAnyTextAuth.textOne,
                                  )))
                          : LoadingScreen(),
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: true,
                  //     itemCount: images.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                  itemCount: 1),
            ),
            Container(
              width: context.screenwidth * 0.98,
              height: context.screenHeight * 0.9,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, position) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                  "${widget.priceBeforeDiscount}"
                                  "ر.س",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough)),
                              //
                              Text(
                                  " "
                                  "${widget.price}"
                                  "ر.س",
                                  style: GoogleFonts.tajawal(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.green)),
                            ],
                          ),
                        ),
                        Container(
                          //       margin: const EdgeInsets.only(right: 100, bottom: 20),

                          child: Center(
                              child: Text(
                            "${widget.discount}%",
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          )),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(11),
                              child: Row(
                                children: [
                                  Text("${widget.name.toString()}",
                                      style: GoogleFonts.tajawal(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Text(" ر.س${widget.price} /${widget.amount}كج",
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 12,
                                )),
                            Text("${widget.code}:كود المنتج",
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<CartViewModel>()
                                        .changeAmountCart(
                                            context: context,
                                            remove: false,
                                            index: position,
                                            amount: cartViewProduct
                                                .data[position].amount
                                                .toString());
                                  },
                                  child: Image.asset(
                                    "assets/image/d2.png",
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.green.shade100),
                                child: Text(
                                  context
                                      .watch<HomePageProvider>()
                                      .categoriesProductModel
                                      .data[position]
                                      .amount
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 7,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<CartViewModel>()
                                        .changeAmountCart(
                                            context: context,
                                            remove: true,
                                            index: position,
                                            amount: cartViewProduct
                                                .data[position].amount
                                                .toString());
                                  },
                                  child: Image.asset(
                                    "assets/image/d1.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.all(8),
                            child: Text(
                              ":تفاصيل المنتج",
                              style: GoogleFonts.tajawal(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: context.screenwidth * 0.9,
                            height: context.screenHeight * 0.13,
                            margin: EdgeInsets.all(4),
                            child: Text(
                              widget.description,
                              style: GoogleFonts.tajawal(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.all(8),
                            child: Text(
                              "التقييمات",
                              style: GoogleFonts.tajawal(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: context.screenHeight*0.2,
                      child: ListView.builder(
                          itemCount: context.watch<HomePageProvider>().productRateModel.data!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder:(context, index){
                            return
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                                          width: 55,
                                          height: 55,
                                          child: Image.network(context
                                              .watch<HomePageProvider>()
                                              .productRateModel
                                              .data![position]
                                              .clientImage
                                              .toString())),
                                      RatingBar.builder(
                                        itemSize: 12,
                                        initialRating: 3,
                                        minRating: 3,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(14),
                                        child: Text(
                                          "${context.watch<HomePageProvider>().productRateModel.data![position].clientName},",
                                          style: GoogleFonts.tajawal(
                                              fontSize: 16,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),


                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: context.screenwidth * 0.8,
                                          height: context.screenHeight * 0.1,
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            "you asked for comments on the new proposalsshe left a comment\n on his post that said,  to the council ",
                                            style: GoogleFonts.tajawal(
                                                fontSize: 10, color: Colors.grey,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
