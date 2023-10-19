import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';
import 'package:untitled1/presntionlayer/home/widget/customfromfield.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/presntionlayer/home/widget/drewcategory.dart';
import 'package:untitled1/presntionlayer/home/widget/drewnavbar.dart';
import 'package:untitled1/presntionlayer/home/widget/drewproducthome.dart';
import 'package:untitled1/presntionlayer/home/widget/drewslider.dart';
import 'package:badges/badges.dart' as badges;
import '../../busnieslogiclayer/home/homeviewmodel.dart';
import '../../busnieslogiclayer/noninternetviewmodel.dart';
import '../../customwidget/customappbar.dart';
import '../../customwidget/statusapp/OffLineScreen.dart';
import '../search/search.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var networkStatus = context.watch<NetworkStatus>();

    return Scaffold(
        bottomNavigationBar: drewNavBar(context),
        appBar: drewAppBarHome(context),
        body: context.watch<HomePageProvider>().catLoading == true
            ? SingleChildScrollView(
                child:
                     Column(
                        children: [

                          Form(
                            key: context.watch<HomePageProvider>().globalKey,
                            child: drewCustomSearchField(
                                context: context,
                                onTab: (val) {
                                  context
                                      .read<HomePageProvider>()
                                      .checkSearch(val);
                                },
                                onTabSub: (s) {
                                  if (context
                                      .read<HomePageProvider>()
                                      .globalKey
                                      .currentState!
                                      .validate()) {
                                    return context
                                        .read<HomePageProvider>()
                                        .onSearchItems();
                                  }
                                },
                                search: context
                                    .watch<HomePageProvider>()
                                    .searchController),
                          ),
                          context.watch<HomePageProvider>().isSearch == false
                              ? DrewSlider(
                                  sliderModel: context
                                      .watch<HomePageProvider>()
                                      .sliderModel,
                                )
                              : drewSearchProduct(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                 "عر الكل",
                                  style: DrewAnyTextAuth.textOne,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "الاقسام",
                                  style: GoogleFonts.amita(
                                      fontSize: 17,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          DrewCategory(
                            categoriesModel: context
                                .watch<HomePageProvider>()
                                .categoriesModel,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20, right: 10),
                                child: Text(
                                  "جميع المنتجات" ,
                                  style: GoogleFonts.alexBrush(
                                      fontSize: 17,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          DrewHomeProduct(
                            productsData: context
                                .watch<HomePageProvider>()
                                .categoriesProductModel,
                          )
                        ],
                      )

              )
            : Center(
                child: Center(
                  child: Container(
                    child: Lottie.asset("assets/lotti/animation_ll8kwibr.json"),
                  ),
                ),
              ));
  }
}
