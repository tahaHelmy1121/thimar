
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/customwidget/customtextformauth.dart';
import 'package:untitled1/presntionlayer/auth/widget/drewanytextauth.dart';

import '../../busnieslogiclayer/contactus/contactviewmodel.dart';
import '../../const/color.dart';
import '../../customwidget/custombutton.dart';

   class SuggestionView extends StatefulWidget {
     const SuggestionView({super.key});

     @override
     State<SuggestionView> createState() => _SuggestionViewState();
   }

   class _SuggestionViewState extends State<SuggestionView> {
     @override
     Widget build(BuildContext context) {
       bool loading = true;
       return Scaffold(
         appBar: AppBar(
           elevation: 0.8,
           centerTitle: true,
           backgroundColor: Colors.white,
           title: Center(
             child: Container(
               margin: EdgeInsets.only(left: 50),
               child: Text(
                 "لأقتراحات والشكاوي",
                 style:DrewAnyTextAuth.textOne,
               ),
             ),
           ),
           actions:[
             GestureDetector(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Image.asset("assets/image/backarrow.png")),
           ]
         ),
         body: SingleChildScrollView(
           child: Form(
             key: context.watch<ContactViewModel>().globalKey,
             child: Column(
               children: [
                 SizedBox(height: 22,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(

                       width: 350,
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
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(

                       width: 350,
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
                   width: 350,
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
           ),
         )
       );
     }
     }


