import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../busnieslogiclayer/cart/cartviewmodel.dart';

Widget drewButtonCart({required BuildContext context, index, amount}) {
  return Row(
    children: [
      InkWell(
        onTap: () {
          context.read<CartViewModel>().changeAmountCart(
            context: context,
            remove: false,
            index: index,
            amount: amount,
          );
        },
        child: Image.asset(
          "assets/image/d2.png",
        ),
      ),
      Container(
        //  margin: const EdgeInsets.only(left: 1, top: 1),
        child: Text(
          amount,
          style: const TextStyle(
              fontSize: 7, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      InkWell(
        onTap: () {
          context.read<CartViewModel>().changeAmountCart(
            context: context,
            remove: true,
            index: index,
            amount: amount,
          );
        },
        child: Image.asset(
          "assets/image/d1.png",
        ),
      ),
    ],
  );
}