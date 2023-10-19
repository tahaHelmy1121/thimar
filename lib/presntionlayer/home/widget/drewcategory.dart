import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/busnieslogiclayer/home/homeviewmodel.dart';
import 'package:untitled1/datalayer/model/categoriesmodel.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../../auth/widget/drewanytextauth.dart';

class DrewCategory extends StatelessWidget {
  CategoriesModel categoriesModel;

  DrewCategory({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    var pro = context.watch<HomePageProvider>().pro;
    return Row(
      children: [
        SizedBox(
          width: context.screenwidth * 0.95,
          height: context.screenHeight * 0.20,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesModel.data.length,
              itemBuilder: (context, postion) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<HomePageProvider>()
                              .getSubProductCategory(
                                  name: categoriesModel.data[postion].name,
                                  index: postion,
                              context:context);
                        },
                        child: Container(
                          width: 76,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: categoriesModel.data.isEmpty
                              ? Center(
                                  child: Container(
                                    child: Lottie.asset(
                                        "assets/lotti/animation_ll8kwibr.json"),
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: categoriesModel.data![postion].media
                                      .toString(),
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => Shimmer(
                                    gradient: LinearGradient(colors: [
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
                      InkWell(
                        onTap: () {},
                        child: Text(
                          categoriesModel.data![postion].name!,
                          style: DrewAnyTextAuth.textOne,
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
