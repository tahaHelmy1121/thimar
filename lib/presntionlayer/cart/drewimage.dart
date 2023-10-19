import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled1/helper/extenstion.dart';

Widget drewImageCart({required BuildContext context, image}) {
  return Container(
 margin: EdgeInsets.only(left: 50),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),

      //    shape: BoxShape.circle,
    ),
    child: CachedNetworkImage(
      width: context.screenwidth * 0.4,
      height: context.screenHeight * 0.1,
      imageUrl: image,
      //  alignment: Alignment.topCenter,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer(
        gradient:
        const LinearGradient(colors: [Colors.green, Colors.greenAccent]),
        child: Container(
          color: Colors.grey.shade200,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.image),
    ),
  );
}