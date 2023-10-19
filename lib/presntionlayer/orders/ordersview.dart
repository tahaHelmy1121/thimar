import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../customwidget/customappbar.dart';
import '../home/widget/drewnavbar.dart';
import 'currentorders.dart';
import 'expirerders.dart';

class Ordersview extends StatefulWidget {
  const Ordersview({super.key});

  @override
  State<Ordersview> createState() => _OrdersviewState();
}
late TabController tabController;
@override

class _OrdersviewState extends State<Ordersview> with TickerProviderStateMixin{
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: drewNavBar(context),
      appBar: drewAppBar(context: context , name: "orders"),
      body:  Column(
        children: [
          Container(
            width: 342,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: tabBarColor)),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              controller: tabController,
              indicator: BoxDecoration(
                color: DefaultColor,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorWeight: 5,
              tabs: <Widget>[
                Tab(
                  text: "الحالية",
                ),
                Tab(
                  text:"المنتهية",
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [CurrentOrders(), ExpireOrders()],
            ),
          ),
        ],
      ),

    );
  }
}
