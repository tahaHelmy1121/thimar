import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/address/addressviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/contactus/contactviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/favourite/favouriteviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/profile/profileviewmodel.dart';
import 'package:untitled1/presntionlayer/splashview.dart';

import 'busnieslogiclayer/auth/RegisterViewModel.dart';
import 'busnieslogiclayer/auth/loginviewmodel.dart';
import 'busnieslogiclayer/cart/cartviewmodel.dart';
import 'busnieslogiclayer/faqs/faqsviewmodel.dart';
import 'busnieslogiclayer/home/homeviewmodel.dart';
import 'busnieslogiclayer/noninternetviewmodel.dart';
import 'busnieslogiclayer/order/orderviewmodel.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      StreamProvider(
          create: (BuildContext context) => NetworkServices().controller.stream,
          initialData: NetworkStatus.online),
      ChangeNotifierProvider(
          create: (BuildContext context) =>
              HomePageProvider(reader: context.read)),
      ChangeNotifierProvider(
          create: (BuildContext context) => FavouriteViewModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) =>
              CartViewModel(reader: context.read)),
      ChangeNotifierProvider(
          create: (BuildContext context) => LoginViewModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => RegisterViewModel()),
      //   ChangeNotifierProvider(create: (BuildContext context) => FaqsViewModel()),
      ChangeNotifierProvider(create: (BuildContext context) => FaqsViewModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => ProfileViewModel()),
ChangeNotifierProvider(
          create: (BuildContext context) => WalletViewModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => AddressViewModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => OrderViewModel()),
      ChangeNotifierProvider(
          create: (BuildContext context) => ContactViewModel()),
    ], child: Phoenix(child: App())),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        home: SplashView());
  }
}
