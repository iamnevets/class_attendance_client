import 'dart:async';

import 'package:class_attendance/view/auth/login.auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashView extends StatefulWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 9),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => AuthLoginView(),  
            )  
         )  
    );
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SpinKitRipple(
              size: 200,
              color: Colors.white,
            ),
      ),
    );
  }
}