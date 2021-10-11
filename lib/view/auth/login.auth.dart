import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/alert_dialog.repository.dart';
import 'package:class_attendance/model/account/login.model.dart';
import 'package:class_attendance/model/user.model.dart';
import 'package:class_attendance/view/auth/signup.auth.dart';
import 'package:class_attendance/view/new-class/new.class.dart';
import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class AuthLoginView extends StatefulWidget {
  const AuthLoginView({Key? key}) : super(key: key);

  @override
  _AuthLoginViewState createState() => _AuthLoginViewState();
}

class _AuthLoginViewState extends State<AuthLoginView> {
  final _logInFormKey = GlobalKey<FormState>();

  bool showPassword = true;

  bool isLoading = false;

  String? userName = '';
  String? password = '';

  User user = User(name: '', phoneNumber: '', userName: '', password: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Container(),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lecturer-login');
              },
              child: Text(
                'Login as Lecturer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(image: AssetImage('assets/img/auth_attendance_sheets.png')),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log In',
                            style: TextStyle(color: Colors.white, fontSize: 48),
                          ),
                          Text(
                            'Log In an Existing Account',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _logInFormKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Student ID cannot be empty';
                              } else {
                                userName = value;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                fillColor: Colors.grey[200],
                                filled: false,
                                hintText: 'Student ID',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            obscureText: showPassword,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              } else {
                                password = value;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_open_outlined),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    icon: showPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                                fillColor: Colors.grey[200],
                                filled: false,
                                hintText: 'Password',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AuthSignupView()));
                          },
                          child: Text("DON'T HAVE AN ACCOUNT?")),
                          SizedBox(height: 10,),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewClassView()));
                          },
                          child: Text("SKIP"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: InkWell(
          onTap: () async {
            ////////////////////////////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////////////////////////

            if (_logInFormKey.currentState!.validate()) {
              if (userName!.isNotEmpty && password!.isNotEmpty) {
                try {
                  MyAlertDialog.showAlertDialog(context);
                  var loginModel = LoginModel(username: userName!, password: password!, fromLecturerLoginPage: false);
                  var returnObject = await AccountsRepository().login(loginModel);

                  if (returnObject.success!) {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/home');
                    await Flushbar(
                            message: returnObject.message,
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.green.shade700,
                            flushbarPosition: FlushbarPosition.TOP)
                        .show(context);
                  } else {
                    Navigator.pop(context);
                    ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(text: returnObject.message, type: ArtSweetAlertType.danger));
                  }
                } catch (exception) {
                  if (exception.runtimeType == SocketException) {
                    Navigator.pop(context);
                    ArtSweetAlert.show(
                        context: context, artDialogArgs: ArtDialogArgs(text: 'Check Internet Connection!', type: ArtSweetAlertType.danger));
                  } else {
                    Navigator.pop(context);
                    ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(text: exception.toString(), type: ArtSweetAlertType.danger));
                  }
                }
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).colorScheme.primary,
            ),
            height: 55,
            width: double.infinity,
            child: Center(
              child: Text(
                'LOG IN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void login() async {
  //   try {
  //     MyAlertDialog.showAlertDialog(context);
  //     var returnObject = await AccountsRepository().login(userName!, password!);

  //     if (returnObject.success!) {
  //       Navigator.pop(context);
  //       Navigator.pushReplacementNamed(context, '/home');
  //       await Flushbar(
  //               message: returnObject.message,
  //               duration: Duration(seconds: 3),
  //               backgroundColor: Colors.green.shade700,
  //               flushbarPosition: FlushbarPosition.TOP)
  //           .show(context);
  //     } else {
  //       Navigator.pop(context);
  //       ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(text: returnObject.message, type: ArtSweetAlertType.danger));
  //     }
  //   } catch (exception) {
  //     if (exception.runtimeType == SocketException) {
  //       Navigator.pop(context);
  //       ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(text: 'Check Internet Connection!', type: ArtSweetAlertType.danger));
  //     } else {
  //       Navigator.pop(context);
  //       ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(text: exception.toString(), type: ArtSweetAlertType.danger));
  //     }
  //   }
  // }
}
