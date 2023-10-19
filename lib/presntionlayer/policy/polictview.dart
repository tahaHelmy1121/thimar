import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/about/aboutviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';

class PolicyView extends StatefulWidget {
  const PolicyView({super.key});

  @override
  State<PolicyView> createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AboutViewModel(),
      child: Scaffold(
        appBar: drewAppBar(context: context, name: "سياسة الخصوصية"),
        body: Consumer<AboutViewModel>(
          builder: (context, provider, child) {
            return LayoutBuilder(
                builder: (context, BoxConstraints boxConstraint) =>
                    context.watch<AboutViewModel>().aboutLoading == true
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(14),
                                  child: Text(
                                    provider.policyModel.data!.policy
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Center(
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
