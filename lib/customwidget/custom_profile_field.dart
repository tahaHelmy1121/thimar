import 'package:flutter/material.dart';


class CustomProfileField extends StatelessWidget {
  CustomProfileField(
      {Key? key,
      required this.controller,
      required this.obsecure,
      required this.validator,
      required this.preficIcon,
      this.suffixIcon,
      required this.hintText})
      : super(key: key);

  final TextEditingController controller;
  final bool obsecure;
  final Function validator;
  final Widget preficIcon;
  Widget? suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: preficIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
