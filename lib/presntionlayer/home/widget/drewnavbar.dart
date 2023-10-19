import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/home/home.dart';
import 'package:untitled1/presntionlayer/profile/profileview.dart';

import '../../favourite/favouriteview.dart';
import '../../notifications/notification.dart';
import '../../orders/ordersview.dart';

Widget drewNavBar(BuildContext context) {
  int currentTab = 0;
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    notchMargin: 20,
    child: Container(
      width: 380,
      height: 70,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.lightGreen.shade800
          ]
          ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.push(Favouriteview(), context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/Icon ionic-ios-heart-empty.png"))),
                    ),
                    Text(
                      "المفضلة",
                      style: TextStyle(
                        fontSize: 10,
                        color: currentTab == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  context.push(ProfileView() , context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/COCO-Line-User.png"))),
                    ),
                    Text(
                      "الحساب",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: currentTab == 0
                            ? Colors.white
                            : Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: context.screenwidth*0.09,
              ),
              InkWell(
                onTap: () {
                  context.push(NotificationsView() , context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/COCO-Duotone-Notification.png"))),
                    ),
                    Text(
                      "الاشعارات",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: currentTab == 0
                            ? Colors.white
                            : Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                 width: context.screenwidth*0.05,
              ),
              InkWell(
                onTap: () {
context.push(Ordersview(), context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/COCO-Line-Note.png"))),
                    ),
                    Text(
                      "طلباتى",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: currentTab == 0
                            ? Colors.white
                            : Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                width: context.screenwidth*0.05,
              ),
              InkWell(
                onTap: () {
                  context.push(HomeView() , context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/COCO-Line-Home.png"))),
                    ),
                    Text(
                      "الرئيسية",
                      style: TextStyle(
                        fontSize: 10,
                        color: currentTab == 0
                            ? Colors.white
                            : Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}