import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/about/aboutviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/customwidget/statusapp/loadingScreen.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../customwidget/customlogothimar.dart';
import 'auth/widget/drewanytextauth.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AboutViewModel(),
      child: Scaffold(
        appBar: drewAppBar(context: context, name: "ماذا عنا"),
        body: Consumer<AboutViewModel>(
          builder: (context, provider, child) {
            return LayoutBuilder(
                builder: (context, BoxConstraints boxConstraint) =>
                context
                    .watch<AboutViewModel>()
                    .aboutLoading == true ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: context.screenwidth * 0.4,
                              height: context.screenHeight * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Colors.green.shade100)),
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: drewLogo(boxConstraint)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(14),
                        child: Text(provider.aboutModel.data!.about.toString(),
                          maxLines: 9,

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,

                          ),),
                      )
                    ],
                  ),
                ) :
                Center(
                  child: Center(
                    child: Container(
                      child: Lottie.asset(
                          "assets/lotti/animation_ll8kwibr.json"),
                    ),
                  ),
                ));
          },
        ),

      ),
    );
  }
}
