import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyAlertDialog {

  static showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: SpinKitDualRing(color: Colors.white,),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}