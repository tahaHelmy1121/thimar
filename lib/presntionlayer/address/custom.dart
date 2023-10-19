// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


import '../../const/color.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {Key? key,
        this.controller,
        this.onChanged,
        required this.obsecure,
        required this.validator,
        this.focusNode,
        this.preficIcon,
        this.suffixIcon,
        this.labelText,
        this.onSubmit,
        required this.hintText,
        this.keyboardType})
      : super(key: key);

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool obsecure;
  final Function(String)? onChanged;
  final Function validator;
  final Widget? preficIcon;
  final onSubmit;
  Widget? suffixIcon;
  final String? labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final Color fillColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmit,
      controller: controller,
      onChanged: onChanged,
      obscureText: obsecure,
      cursorColor: DefaultColor,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: fillColor,
        prefixIcon: preficIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
