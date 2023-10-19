
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../busnieslogiclayer/confirmationorder/confirmationorderviewmodel.dart';

Widget drewNoteOrder({context , width , height  ,controller}){
  return     Container(
    width:width,
    height: height,
    child: TextFormField(
      controller:controller,
      minLines: 4,
      maxLines: 6,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: "subject",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
   }