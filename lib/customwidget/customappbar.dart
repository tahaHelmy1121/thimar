import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';
import 'package:untitled1/presntionlayer/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../busnieslogiclayer/cart/cartviewmodel.dart';
import '../busnieslogiclayer/home/homeviewmodel.dart';

drewAppBarHome(BuildContext context) {

  return  AppBar(
      centerTitle: true,
      title: InkWell(
        onTap: (){

        },
        child:  Text(
     "الرءسية",
          style: GoogleFonts.tajawal(
            fontSize: 18,fontWeight:FontWeight.bold,
            color: Colors.green,
            letterSpacing: 1
          )
        ),
      ),
      //  address user
      backgroundColor: Colors.white,
      //    leadingWidth: 2.0,
      elevation: 0,
      actions: [
        Container(
            margin: const EdgeInsets.only(
              top: 18,
            ),
            //  height: 40,
            child: Text(
              "سلة ثمار",
              style: GoogleFonts.alkalami(
                  color: Colors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            //   context.read<CartViewModel>().getCartFromRepo();

          },
          child: Container(
            //    width: context.screenwidth*0.1,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            //  height: context.screenHeight*0.2,
            child: Image.asset(
              "assets/image/1.jpg",
              width: 30,
            ),
          ),
        )
      ],
      leading: InkWell(
        onTap: (){
          context.read<CartViewModel>().tapIcon(context);
        },
        child: badges.Badge(
          badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
          badgeContent: (context
              .watch<HomePageProvider>()
              .categoriesProductModel
              .userCartCount ==
              null)
              ? const Text(
            "0",
            style: TextStyle(color: Colors.black),
          )
              : Container(
            margin: const EdgeInsets.only(top: 14, right: 12),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade500,
                    blurRadius: 1.9,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black)),
            child: Text(
              context
                  .watch<HomePageProvider>()
                  .categoriesProductModel
                  .userCartCount! >
                  99
                  ? const Text(
                "99",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ).toString()
                  : context
                  .watch<HomePageProvider>()
                  .categoriesProductModel
                  .userCartCount
                  .toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          child: Container(
              margin: const EdgeInsets.all(18),
              child: Image.asset("assets/image/COCO-Line-Bag.jpg")),
        ),
      ));
}
drewAppBar({name , required BuildContext context}){
  return AppBar(
    elevation: 0.0,
    title: Text(name,style: DrewAnyTextAuth.textOne,),
    leading: Container(),
    actions: [
      InkWell(
          onTap: () {
           Navigator.pop(context);
          },
          child: Image.asset("assets/image/backarrow.png"))
    ],
    backgroundColor: Colors.white,
    centerTitle: true,
  );


}


