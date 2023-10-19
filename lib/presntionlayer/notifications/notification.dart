import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/home/homeviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';

import '../home/widget/drewnavbar.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    var notification = context.watch<HomePageProvider>().notificationModel;
    return Scaffold(
        bottomNavigationBar: drewNavBar(context),
        appBar: drewAppBar(context: context, name: "الاشعارات"),
        body: notification.data!.notifications.isNotEmpty
            ? ListView.builder(itemBuilder: (context, index) {
                return Text(notification.data!.notifications.length.toString());
              })
            : Center(
                child: Text(
                  "لا توجد إشعارات",
                  style: GoogleFonts.abyssinicaSil(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.green),
                ),
              ));
  }
}
