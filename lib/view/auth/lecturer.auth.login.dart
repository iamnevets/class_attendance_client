import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/alert_dialog.repository.dart';
import 'package:class_attendance/model/account/login.model.dart';
import 'package:flutter/material.dart';

class LecturerLoginView extends StatefulWidget {
  const LecturerLoginView({Key? key}) : super(key: key);

  @override
  _LecturerLoginViewState createState() => _LecturerLoginViewState();
}

class _LecturerLoginViewState extends State<LecturerLoginView> {
  final _logInFormKey = GlobalKey<FormState>();

  String? userName = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login.auth');
              },
              child: Text('Login as Student'))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        // ignore: sized_box_for_whitespace
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lecturer Log In',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Log in your existing account',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                key: _logInFormKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          // initialValue: mobileNumber,
                          // autocorrect: true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lecturer ID cannot be empty';
                            } else {
                              userName = value;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Lecturer ID',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          obscureText: true,
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
                              prefixIcon: Icon(Icons.account_circle),
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Password',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    InkWell(
                      onTap: () async {
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        
                        if (_logInFormKey.currentState!.validate()) {
                          if (userName!.isNotEmpty && password!.isNotEmpty) {
                            try {
                              MyAlertDialog.showAlertDialog(context);
                              var loginModel = LoginModel(username: userName!, password: password!, fromLecturerLoginPage: true);
                              var returnObject = await AccountsRepository().login(loginModel);

                              if (returnObject.success!) {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, '/lecturer-home');
                                await Flushbar(
                                        message: returnObject.message,
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.green.shade700,
                                        flushbarPosition: FlushbarPosition.TOP)
                                    .show(context);
                              } else {
                                Navigator.pop(context);
                                ArtSweetAlert.show(
                                    context: context, artDialogArgs: ArtDialogArgs(text: returnObject.message, type: ArtSweetAlertType.danger));
                              }
                            } catch (exception) {
                              if (exception.runtimeType == SocketException) {
                                Navigator.pop(context);
                                ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(text: 'Check Internet Connection!', type: ArtSweetAlertType.danger));
                              } else {
                                Navigator.pop(context);
                                ArtSweetAlert.show(
                                    context: context, artDialogArgs: ArtDialogArgs(text: exception.toString(), type: ArtSweetAlertType.danger));
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
                            'LOGIN',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
