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

  static Widget showLoader(String msg, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: SpinKitWave(
            color: Theme.of(context).primaryColor,
            type: SpinKitWaveType.start,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(child: Text(msg)),
      ],
    );
  }

  static void push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  static void pushReplace(BuildContext context, Widget screen) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => screen));
  }
}
