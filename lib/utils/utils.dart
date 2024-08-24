

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static double averageRating(List<int> rating){
    var avgRating = 0 ;
    for(int i=0; i<rating.length; i++){
      avgRating = avgRating +rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }


  static toastMessage (String message){
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
          forwardAnimationCurve:  Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP, // can change to bottom
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(Icons.error, size: 20,color: Colors.white,),
        )..show(context));
  }

  static snakBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red ,)
    );
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus){
        current.unfocus();
        FocusScope.of(context).requestFocus(nextFocus);
  }

}

