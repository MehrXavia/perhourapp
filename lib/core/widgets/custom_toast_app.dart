import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onservice24/core/themes/colors.dart';


void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choseToastColors(state),
      textColor: Colors.white,
      fontSize:  16,
    );
// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color choseToastColors(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = kGreenColor;
      break;
    case ToastStates.ERROR:
      color = kRedColorEB;
      break;
    case ToastStates.WARNING:
      color = kBlueColor;
      break;
  }
  return color;
}
