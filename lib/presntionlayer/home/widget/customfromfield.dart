import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';
import 'package:untitled1/helper/extenstion.dart';
Widget drewCustomSearchField({required BuildContext context ,Function(String)? onTab,Function(String)? onTabSub,required TextEditingController search }) {
  return Padding(
    padding: const EdgeInsets.only(right: 18,top: 12),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreen.shade50,
                  borderRadius: BorderRadius.circular(80)),

              width:310,
              height: 48,
              child: TextFormField(

                validator:  (String? value) {
                  if (value == null || value.isEmpty) {
                    return "ادخال اسم المنتج";
                  }
                },
                onFieldSubmitted:onTabSub,
                controller: search,
                onChanged: onTab,
                style: DrewAnyTextAuth.textOne,
                textDirection: TextDirection.rtl,
                //      controller: context.read<LoginViewModel>().textEditingControllerMobile,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                  //    width: 25,
                  //    height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: ExactAssetImage(
                            "assets/image/2.png",

                          ),
                     //     fit: BoxFit.contain
                        ),
                      ),
                    ),
                  ),
                  suffixIconConstraints:
                      BoxConstraints(maxHeight: 50, maxWidth: 35),
                  errorStyle: const TextStyle(fontFamily: "BigVesta"),
                  hintText: "ابحث عن ماتريد؟",
                  hintStyle:GoogleFonts.anybody(
                    fontSize: 14,
                    letterSpacing:2 ,
                    color: Colors.grey

                  ),
                  filled: true,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
