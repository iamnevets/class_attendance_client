// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/alert_dialog.repository.dart';
import 'package:class_attendance/model/settings.model.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<SettingItem> settings = [
    SettingItem(name: 'About', icon: Icon(Icons.help), jumpTo: '/about'),
    SettingItem(name: 'Support', icon: Icon(Icons.support), jumpTo: '/help'),
    // SettingItem(
    //     name: 'Sign Out', icon: Icon(Icons.arrow_forward), jumpTo: '/login.auth')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Column(
                  children: settings
                      .map((item) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, item.jumpTo);
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name),
                                    item.icon,
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          ))
                      .toList()),
              ListTile(
                onTap: () async {
                  // Your code here
                  ArtDialogResponse dialogResponse = await ArtSweetAlert.show(
                      context: context,
                      artDialogArgs:
                          ArtDialogArgs(text: 'Confirm logout', confirmButtonText: 'logout', showCancelBtn: true, cancelButtonColor: Colors.red));

                  if (dialogResponse.isTapConfirmButton) {
                    try {
                      MyAlertDialog.showAlertDialog(context);
                      var returnObject = await AccountsRepository().logout();

                      if (returnObject.success!) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login.auth');
                        await Flushbar(
                                message: returnObject.message,
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green.shade700,
                                flushbarPosition: FlushbarPosition.TOP)
                            .show(context);
                      } else {
                        ArtSweetAlert.show(
                            context: context, artDialogArgs: ArtDialogArgs(text: returnObject.message, type: ArtSweetAlertType.danger));
                      }
                    } catch (exception) {
                      if (exception.runtimeType == SocketException) {
                        Navigator.pop(context);
                        ArtSweetAlert.show(
                            context: context, artDialogArgs: ArtDialogArgs(text: 'check internet connection!', type: ArtSweetAlertType.danger));
                      } else {
                        ArtSweetAlert.show(
                            context: context, artDialogArgs: ArtDialogArgs(text: 'Oops something went wrong!', type: ArtSweetAlertType.danger));
                      }
                    }
                    return;
                  }

                  if (dialogResponse.isTapCancelButton) {
                    return;
                  }

                  Navigator.pushNamed(context, '/login.auth');
                },
                title: Text('Sign Out'),
                leading: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
      ),
    );
  }
}
