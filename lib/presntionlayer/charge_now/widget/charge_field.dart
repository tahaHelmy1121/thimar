import 'package:flutter/material.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../../auth/widget/drewanytextauth.dart';
import '../../profile/widget/form_feild.dart';

Widget drewChargeBody(
    { String?  text, hintText, String? Function(String?)? valid, image ,required BuildContext context,  TextEditingController? controller}) {
  return Column(
    children: [
      Row(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40 , right: 20),
            child: Text(
              text!,
              style: DrewAnyTextAuth.textOne,
            ),
          ),

        ],
      ),
      Row(
        //       crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          drewFormInfo(
            mycontroller:controller ,
              valid: valid,
              width: context.screenwidth * 0.9,
              hintText: hintText,
              //    labelText: "اسم المستخدم",
              edgeInsets: const EdgeInsets.only(right: 14, top: 30),
              image: image),
        ],
      )
    ],
  );
}