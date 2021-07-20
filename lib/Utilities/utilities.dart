import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Widget showProgressIncator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget showLoader(String message) {
    return Column(
      children: [
        SpinKitWave(),
        SizedBox(
          height: 20,
        ),
        Text(message),
      ],
    );
  }
}
