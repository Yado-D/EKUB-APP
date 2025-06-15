import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastInfo({
  required String toastInfo,
}){
  Fluttertoast.showToast(
      msg: toastInfo,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green.shade200,
      textColor: Colors.black,
      fontSize: 16.0
  );
}