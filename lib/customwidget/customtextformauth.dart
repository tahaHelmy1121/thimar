import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final Widget? icon;
  EdgeInsets? deafault;

  final String? labeltext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      this.labeltext,
      this.iconData,
      required this.mycontroller,
      required this.valid,
      this.deafault,
      required this.isNumber,
       this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),

        margin: const EdgeInsets.only(bottom: 6),
        child: TextFormField(

          validator: valid,
          textAlign: TextAlign.right,
          //    textAlignVertical : TextAlignVertical(y: -1),
          controller: mycontroller,
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          decoration: InputDecoration(

            enabledBorder: OutlineInputBorder(

                borderSide: BorderSide(width: 1, color: Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hinttext,
            //  focusedBorder: InputBorder.none,
            //  enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: GoogleFonts.tajawal(
              fontSize: 16,
              color: HexColor("#B1B1B1"),
            ),
            //   floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: deafault,
            suffixIcon: icon,
          ),
        ));
  }
}
