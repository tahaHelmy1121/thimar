import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/faqs/faqsviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import '../../const/color.dart';

class FaqsView extends StatefulWidget {
  const  FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  @override
  Widget build(BuildContext context) {
    var faqsData = context.watch<FaqsViewModel>().faqsModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Image.asset("assets/image/backarrow.png")),
        centerTitle: true,
        title: Text(
          "أسئلة متكررة",
          style:DrewAnyTextAuth.textOne,
        ),
      ),
      body:context.watch<FaqsViewModel>().faqsLoading==false
          ? SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: DefaultColor,
            ),
          ],
        ),
      )
          : Column(
        children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount:faqsData.data.length,
                itemBuilder: (context, index) => ExpansionTile(
                  title: Text(
                   faqsData.data[index].question.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DefaultColor,
                        fontSize: 15),
                  ),
                  trailing: const Image(
                    image: AssetImage("assets/image/Group 17610.jpg"),
                  ),
                  children: [
                    Text(faqsData.data[index].answer.toString()),
                  ],
                ),
              ),
            ),
          ]

      ),

  );
  }
}
