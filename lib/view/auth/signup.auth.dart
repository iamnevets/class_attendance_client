import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/alert_dialog.repository.dart';
import 'package:class_attendance/model/return_object.model.dart';
import 'package:class_attendance/model/user.model.dart';
import 'package:class_attendance/view/auth/login.auth.dart';
import 'package:flutter/material.dart';

class AuthSignupView extends StatefulWidget {
  const AuthSignupView({Key? key}) : super(key: key);

  @override
  _AuthSignupViewState createState() => _AuthSignupViewState();
}

class _AuthSignupViewState extends State<AuthSignupView> {
  bool hidePassword = true;

  final _signUpFormKey = GlobalKey<FormState>();

  String studentID = '';
  String fullName = '';
  String mobileNumber = '';
  String password = '';

  ReturnObject returnObject =
      ReturnObject(data: null, success: false, message: 'message');

  User user = User(name: '', phoneNumber: '', userName: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            // padding: EdgeInsets.all(20),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(
                    image: AssetImage('assets/img/auth_attendance_sheets.png')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 48),
                        ),
                        Text(
                          'Create a New Account',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _signUpFormKey,
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
                              return 'Student ID cannot be empty';
                            } else {
                              studentID = value;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_box),
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Student ID',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full Name cannot be empty';
                            } else {
                              fullName = value;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Full Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          // initialValue: mobileNumber,
                          // autocorrect: true,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mobile Number cannot be empty';
                            } else {
                              mobileNumber = value;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              fillColor: Colors.grey[200],
                              filled: false,
                              hintText: 'Mobile Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(height: 15.0),
                        TextFormField(
                          obscureText: hidePassword,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                icon: hidePassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            fillColor: Colors.grey[200],
                            filled: false,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            } else {
                              password = value;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthLoginView()));
                        },
                        child: Text(
                          'ALREADY HAVE AN ACCOUNT?',
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: InkWell(
          onTap: () async {
            //////////////////////////////////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////////////////////////////////
            if (_signUpFormKey.currentState!.validate()) {
              final userName = studentID;

              try {
                MyAlertDialog.showAlertDialog(context);
                returnObject = await AccountsRepository().signUp(
                    fullName, studentID, mobileNumber, userName, password);

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
                  ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                          text: returnObject.message,
                          type: ArtSweetAlertType.danger));
                }
              } catch (exception) {
                if (exception.runtimeType == SocketException) {
                  Navigator.pop(context);
                  ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                          text: 'check internet connection!',
                          type: ArtSweetAlertType.danger));
                } else {
                  Navigator.pop(context);
                  ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                          text: 'Oops something went wrong!',
                          type: ArtSweetAlertType.danger));
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
                'SIGN UP',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
