import 'dart:io';
import 'package:connexis_demo/library/double_bounce.dart';
import 'package:connexis_demo/res/color.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';

class Common{
  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static void toast(BuildContext context, String msg){
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
  }

  static void dialogLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: 40,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitDoubleBounce(
                color: colorPrimary,
                size: 40,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please wait...',
                style: TextStyle(
                  color: colorPrimary,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}