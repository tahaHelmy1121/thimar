import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/customwidget/statusapp/OffLineScreen.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';
import 'package:untitled1/presntionlayer/profile/widget/form_feild.dart';

import '../../busnieslogiclayer/noninternetviewmodel.dart';
import '../../busnieslogiclayer/profile/profileviewmodel.dart';
import '../../customwidget/custombutton.dart';
import '../../customwidget/flag.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    var networkStatus = context.watch<NetworkStatus>();
    var profile = context
        .watch<ProfileViewModel>()
        .profileModel;
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "البيانات الشخصية",
          style: DrewAnyTextAuth.textOne,
        ),
      ),
      body: networkStatus == NetworkStatus.online
          ? SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, left: 20),
            child: Form(
              key: context
                  .read<ProfileViewModel>()
                  .globalKey,
              child: Column(children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<ProfileViewModel>()
                          .selectImageFromGallery();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      width: context.screenwidth * 0.2,
                      height: context.screenHeight * 0.1,
                      child:
                      Image.network(profile.data!.image.toString()),
                      //   color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(profile.data!.fullname.toString(),
                    style: DrewAnyTextAuth.textOne),
                const SizedBox(
                  height: 8,
                ),
                Text(profile.data!.phone.toString(),
                    style: DrewAnyTextAuth.textOne),
                drewFormInfo(
                    valid: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "ادخال اسم المستخدم";
                      }
                      return null;
                    },
                    mycontroller:
                    context
                        .watch<ProfileViewModel>()
                        .nameController,
                    width: context.screenwidth * 0.9,
                    hintText: profile.data!.fullname.toString(),
                    labelText: "اسم المستخدم",
                    edgeInsets: const EdgeInsets.only(left: 1, top: 20),
                    image: "assets/image/COCO-Line-User.png"),
                Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    drewFormInfo(
                        valid: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "ادخال الهاتف";
                          }
                          return null;
                        },
                        mycontroller: context
                            .watch<ProfileViewModel>()
                            .phoneController,
                        width: context.screenwidth * 0.7,
                        hintText: "${profile.data!.phone.toString()}",
                        labelText: "رقم الجوال",
                        edgeInsets:
                        const EdgeInsets.only(left: 1, top: 18),
                        image: "assets/image/COCO_Duotone_Phone.png"),
                    const SizedBox(
                      width: 12,
                    ),
                    //

                    //
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: context.screenwidth * 0.12,
                      height: 60,
                      decoration: BoxDecoration(
                          color: HexColor("#FAFFF5"),
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              Text(
                                drewFalg(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                "+966",
                                style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#4C8613")),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  //
                  //const
                  //
                ),
                drewFormInfo(
                  valid: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "ادخال كلمة المرور";
                    }
                    return null;
                  },
                  mycontroller:
                  context
                      .watch<ProfileViewModel>()
                      .cityController,
                  width: context.screenwidth * 0.9,
                  hintText: profile.data!.city == null ?
                      "لم يتم اختيار المدينة عند انشاء الحساب".toString() :"${profile.data!.city!.name.toString()}",
                  image: "assets/image/COCO_Duotone_Report.png",
                  labelText: 'المدينة',
                  edgeInsets: const EdgeInsets.only(left: 1, top: 20),
                ),
                drewFormInfo(
                  valid: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "ادخال كلمة المرور";
                    }
                    return null;
                  },
                  mycontroller: context
                      .watch<ProfileViewModel>()
                      .passwordController,
                  icon: Image.asset(
                      "assets/image/COCO-Line-Arrow - Left.png"),
                  width: context.screenwidth * 0.9,
                  hintText: "كلمة المرور",
                  labelText: "كلمة المرور",
                  image: "assets/image/COCO_Duotone_Unlock.png",
                  edgeInsets: const EdgeInsets.only(left: 1, top: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 18),
                  child: drewCustomButton(
                    tab: () {
                      if (context
                          .read<ProfileViewModel>()
                          .globalKey
                          .currentState!
                          .validate()) {
                        var user = context
                            .read<ProfileViewModel>()
                            .nameController;
                        var phone = context
                            .read<ProfileViewModel>()
                            .phoneController;
                        var city = context
                            .read<ProfileViewModel>()
                            .cityController;
                        var pass = context
                            .read<ProfileViewModel>()
                            .passwordController;

                        context.read<ProfileViewModel>().editProfile(
                            context: context,
                            name: user.text,
                            phone: phone.text,
                            password: pass.text,
                            city: city.text);
                      }
                    },
                    name: "تعديل البيانات",
                  ),
                ),
              ]),
            ),
          ),
        ),
      )
          : Column(
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              child: const OffLineScreen(),
            ),
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu({required BuildContext context}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            decoration: BoxDecoration(
              //       color:Colors.green.shade100, ////
                borderRadius: BorderRadius.circular(100)),
            height: 350.0,

            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white, //
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "تعديل كلمة المرور",
                              style: DrewAnyTextAuth.textOne,
                            )),
                        drewFormInfo(
                            valid: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "ادخال اسم المستخدم";
                              }
                              return null;
                            },
                            mycontroller: context
                                .watch<ProfileViewModel>()
                                .passwordController,
                            width: context.screenwidth * 0.9,
                            hintText: "كلمة المرور القديمة",
                            labelText: "كلمة المرور القديمة",
                            edgeInsets: const EdgeInsets.only(left: 1, top: 20),
                            image: "assets/image/COCO-Line-User.png"),
                        drewFormInfo(
                            valid: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "ادخال اسم المستخدم";
                              }
                              return null;
                            },
                            mycontroller: context
                                .watch<ProfileViewModel>()
                                .nameController,
                            width: context.screenwidth * 0.9,
                            hintText: "كلمة المرور الجديدة",
                            labelText: "كلمة المرور الجديدة",
                            edgeInsets: const EdgeInsets.only(left: 1, top: 20),
                            image: "assets/image/COCO-Line-User.png"),
                        const SizedBox(
                          height: 12,
                        ),
                        drewCustomButton(name: "تعديل كلمة المرور", tab: () {}),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
