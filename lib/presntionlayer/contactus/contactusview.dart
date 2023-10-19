import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/busnieslogiclayer/address/addressviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/contactus/contactviewmodel.dart';
import 'package:untitled1/busnieslogiclayer/profile/profileviewmodel.dart';
import 'package:untitled1/customwidget/customappbar.dart';
import 'package:untitled1/customwidget/statusapp/loadingScreen.dart';
import 'package:untitled1/helper/extenstion.dart';

import '../../busnieslogiclayer/auth/loginviewmodel.dart';
import '../../customwidget/custombutton.dart';
import '../../customwidget/customtextformauth.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  Widget build(BuildContext context) {
    var address = context.watch<AddressViewModel>().addressModel.data;
    var phone = context.watch<ProfileViewModel>().profileModel.data;
    var contact = context.watch<ContactViewModel>().contact;
    return Scaffold(
      appBar: drewAppBar(context: context, name: "تواصل معنا"),
      body:context.watch<AddressViewModel>().address==true? SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                    margin: const EdgeInsets.all(40),
                    child: Image.asset("assets/image/map2.png")),
                Row(
                  //  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //  crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              margin: const EdgeInsets.only(top: 100),
                              width: context.screenwidth * 0.8,
                              height: 185,
                              child: Form(
                                key:  context.watch<ContactViewModel>().globalKey,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          //     crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.all(18),
                                                child: Row(
                                                  children: [
                                                    address.isNotEmpty
                                                        ? Text(address
                                                            .first.location
                                                            .toString(),style: GoogleFonts.tajawal(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),)
                                                        : Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: Colors.green,
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Image.asset(
                                                        "assets/image/COCO-Duotone-Location.png"),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        Row(
                                          //     crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.all(18),
                                                child: Row(
                                                  children: [
                                                    address.isNotEmpty
                                                        ? Text(phone!.phone
                                                            .toString(),style: GoogleFonts.tajawal(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),)
                                                        : Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: Colors.green,
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Image.asset(
                                                        "assets/image/COCO-Duotone-Call - Calling.png"),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        Row(
                                          //     crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.all(18),
                                                child: Row(
                                                  children: [
                                             context.watch<ContactViewModel>().contactLoading==true?
                                                         Text(contact!.data!.email
                                                            .toString(),style: GoogleFonts.tajawal(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),)
                                                        : Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: Colors.green,
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Image.asset(
                                                        "assets/image/COCO-Duotone-Location.png"),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "أو يمكنك إرسال رسالة ",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 13,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        SizedBox(height: 22,),
                        Row(
                          children: [
                            Container(

                              width: 311,
                              height: 52,
                              child: CustomTextFormAuth(
                                hinttext: 'الإسم',
                                labeltext: '',
                                mycontroller:
                                context.watch<ContactViewModel>().name,
                                valid: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "ادخال الهاتف";
                                  }
                                },
                                isNumber: true,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),

                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Container(

                              width: 311,
                              height: 52,
                              child: CustomTextFormAuth(
                                hinttext: 'رقم الجوال',
                                labeltext: '',

                                mycontroller:
                                context.watch<ContactViewModel>().phone,
                                valid: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "ادخال الهاتف";
                                  }
                                },
                                isNumber: true,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),

                          ],
                        ),
                        Container(
                          width: 311,
                          height: 83,
                          child: TextFormField(
                            controller: context.watch<ContactViewModel>().subject ,
                            minLines: 4,
                            maxLines: 6,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              hintText: "الموضوع",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18,),
                        Container(
                            width: 312,
                            height: 54,

                            child: drewCustomButton(
                                tab: () {
                                  if (context
                                      .read<ContactViewModel>()
                                      .globalKey
                                      .currentState!
                                      .validate()) {
                                    var userName = context
                                        .read<ContactViewModel>()
                                        .name;
                                    var phone = context
                                        .read<ContactViewModel>()
                                        .phone;
                                    var subject = context
                                        .read<ContactViewModel>()
                                        .subject;


                                    context.read<ContactViewModel>().editProfile(
                                      context: context,
                                      fullName: userName.text,
                                      phone: phone.text,
                                      content: subject.text,
                                    );
                                    setState(() {
                                      userName.clear();
                                      phone.clear();
                                      subject.clear();
                                    });
                                  }

                                },
                                name: "ارسال ")
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
      ):Center(child: CircularProgressIndicator(color: Colors.green,)),
    );
  }
}

