import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/datalayer/model/slider.dart';

import '../../../busnieslogiclayer/home/homeviewmodel.dart';

class DrewSlider extends StatelessWidget {
  SliderModel sliderModel ;

   DrewSlider({super.key,required this.sliderModel});

  @override
  Widget build(BuildContext context) {
   return CarouselSlider.builder(
        itemCount:sliderModel.data.length,
        itemBuilder: (context, position, index) {
          return Container(
              decoration: const BoxDecoration(
                //  borderRadius: BorderRadius.circular(80)
              ),
              //    width:context.screenwidth*0.9,
              margin: const EdgeInsets.all(5),
              //   height: 400,
              child: Container(
                decoration: const BoxDecoration(
                  //   border: Border.all(color: Colors.black87),
                  //     borderRadius: BorderRadius.circular(70)
                ),
                child:sliderModel.data.isEmpty
                    ? Center(
                  child: Container(
                    child: Lottie.asset(
                        "assets/lotti/animation_ll8kwibr.json"),
                  ),
                )
                    : CachedNetworkImage(
                  imageUrl:
                      sliderModel
                      .data![position]
                      .media!,
                  fit: BoxFit.cover,
                ),
              ));
        },
        options: CarouselOptions(
          onPageChanged: (value, int) {
            //     pageIndexNotifier.value = value;
          },
          height: 190,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 900),
          autoPlayCurve: Curves.easeInBack,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}

