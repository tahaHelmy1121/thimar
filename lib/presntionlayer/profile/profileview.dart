import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/busnieslogiclayer/profile/profileviewmodel.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/about.dart';
import 'package:untitled1/presntionlayer/address/addresview.dart';
import 'package:untitled1/presntionlayer/auth/loginview.dart';
import 'package:untitled1/presntionlayer/charge_now/charge.dart';
import 'package:untitled1/presntionlayer/faqs/faqs.dart';
import 'package:untitled1/presntionlayer/policy/polictview.dart';
import 'package:untitled1/presntionlayer/profile/personalinfo.dart';
import 'package:untitled1/presntionlayer/profile/widget/drewprofilebody.dart';
import 'package:untitled1/presntionlayer/wallet/walletview.dart';

import '../../const/color.dart';
import '../contactus/contactusview.dart';
import '../home/widget/drewnavbar.dart';
import '../suggestion/suggestion.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var profile = context.watch<ProfileViewModel>().profileModel;
    return Scaffold(
      bottomNavigationBar: drewNavBar(context),
      body: context.watch<ProfileViewModel>().profileLoading == true
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 217,
                          decoration: BoxDecoration(
                              color: DefaultColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(35))),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 18),
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .read<ProfileViewModel>()
                                          .getProfileFromRepo();
                                    },
                                    child: Text(
                                      "حسابى",
                                      style: GoogleFonts.tajawal(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                child: Image.network(
                                    profile.data!.image.toString()),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 2),
                                width: 76,
                                height: 71,
                                //   color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              profile.data!.fullname.toString(),
                              style: GoogleFonts.tajawal(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              profile.data!.phone.toString(),
                              style: GoogleFonts.tajawal(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    drewProfileBody(
                        subtitle: "البيانات الشخصية",
                        trailing:
                            Image.asset("assets/image/COCO-Line-User.png"),
                        tab: () {
                          //    Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PersonalInfoView()));
                        }),
                    drewProfileBody(
                      tab: () {
                        context.push(WalletView(), context);
                      },
                      subtitle: "المحفظة",
                      trailing:
                          Image.asset("assets/image/COCO-Line-Wallet.png"),
                    ),
                    drewProfileBody(
                      tab: () {
                        context.push(AddressView(), context);
                      },
                      subtitle: "العناوين",
                      trailing:
                          Image.asset("assets/image/COCO-Duotone-Location.png"),
                    ),
                    drewProfileBody(
                      tab: () {
                        context.push(ChargeNow(), context);
                      },
                      subtitle: "الدفع",
                      trailing: Image.asset("assets/image/dollar.png"),
                    ),
                    drewProfileBody(
                      tab: () {
                        context.push(FaqsView(), context);
                      },
                      subtitle: "أسئلة متكررة",
                      trailing:
                          Image.asset("assets/image/COCO-Duotone-Question.png"),
                    ),
                    drewProfileBody(
                      tab: () {
                        context.push(PolicyView(), context);
                      },
                      subtitle: "سياسة الخصوصية",
                      trailing: Image.asset(
                          "assets/image/COCO-Duotone-Shield - check.png"),
                    ),
                    drewProfileBody(
                      tab: () {
                        context.push(ContactUsView(), context);
                      },
                      subtitle: "تواصل معنا",
                      trailing: Image.asset(
                          "assets/image/COCO-Duotone-Call - Calling.png"),
                    ),
                    drewProfileBody(
                      tab: (){
                        context.push(SuggestionView(), context);
                      },
                      subtitle: "الشكاوي والأقتراحات",
                      trailing:
                          Image.asset("assets/image/COCO-Duotone-Edit - 3.png"),
                    ),
                    drewProfileBody(
                      tab: ()async{
                   await     Share.share("https://pub.dev/packages?q=share&page=2",subject: "sss");
                      },
                      subtitle: "مشاركة التطبيق",
                      trailing:
                          Image.asset("assets/image/COCO-Duotone-Info.png"),
                    ),
                    drewProfileBody(
                      tab: () {
                        context.push(AboutView(), context);
                      },
                      subtitle: "عن التطبيق",
                      trailing: Image.asset("assets/image/a.png"),
                    ),
                    drewProfileBody(
                      subtitle: "الشروط والأحكام",
                      trailing:
                          Image.asset("assets/image/COCO-Duotone-Note.png"),
                    ),
                    drewProfileBody(
                      subtitle: "تقييم التطبيق",
                      trailing: Image.asset("assets/image/COCO-Line-Star.png"),
                    ),
                    drewProfileBody(

                      subtitle: "تسجيل الخروج",
                      //    trailing: Image.asset("assets/image/COCO-Line-User.png"),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Container(
                child: Lottie.asset("assets/lotti/animation_ll8kwibr.json"),
              ),
            ),
    );
  }

//signUp({key}) {
//     SharedPreferences? sharedPreferences;
//     sharedPreferences!.remove(key).then((value) {
//       if (value) {
//         context.push(LoginView(), context);
//       }
//     });
//   }
}
