  import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';
     Widget drewTimer({context}){

     return  CircularCountDownTimer(
         duration: 10,
         initialDuration: 0,
         controller: CountDownController(),
         width:100,
         height:100,
         ringColor: Colors.grey[300]!,
         ringGradient: null,
         fillColor: Colors.purpleAccent[100]!,
         fillGradient: null,
         backgroundColor: Colors.purple[500],
         backgroundGradient: null,
         strokeWidth: 20.0,
         strokeCap: StrokeCap.round,
         textStyle: TextStyle(
             fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
         textFormat: CountdownTextFormat.S,
         isReverse: false,
         isReverseAnimation: false,
         isTimerTextShown: true,
         autoStart: false,
         onStart: () {
           debugPrint('Countdown Started');
         },
         onComplete: () {
           debugPrint('Countdown Ended');
         },
         onChange: (String timeStamp) {
           debugPrint('Countdown Changed $timeStamp');
         },
         timeFormatterFunction: (defaultFormatterFunction, duration) {
           if (duration.inSeconds == 0) {
             return "Start";
           } else {
             return Function.apply(defaultFormatterFunction, [duration]);
           }
         },
       );


     }