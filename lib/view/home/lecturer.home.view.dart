import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/alert_dialog.repository.dart';
import 'package:flutter/material.dart';

class LecturerHomeView extends StatefulWidget {
  const LecturerHomeView({Key? key}) : super(key: key);

  @override
  _LecturerHomeViewState createState() => _LecturerHomeViewState();
}

class _LecturerHomeViewState extends State<LecturerHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Colors.white,),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryVariant,
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          'Dr. Ezer Yeboah-Boateng',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text('Lecturer')
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-home');
              },
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-attendance-list');
              },
              leading: Icon(Icons.list_alt),
              title: Text('Attendance List'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-timetable');
              },
              leading: Icon(Icons.table_chart_outlined),
              title: Text('Timetable'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-classes');
              },
              leading: Icon(Icons.class__outlined),
              title: Text('Classes'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-students');
              },
              leading: Icon(Icons.account_circle),
              title: Text('Students'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-reports');
              },
              leading: Icon(Icons.report),
              title: Text('Reports'),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-support');
              },
              leading: Icon(Icons.help_center),
              title: Text('Support'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/lecturer-settings');
              },
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              onTap: () async {
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
              },
              leading: Icon(Icons.exit_to_app_rounded),
              title: Text('Sign Out'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // SizedBox(height: 80,),
              Text(
                'Recent',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20.0,
              ),
              DashboardCards(),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Attendance Analysis',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/lecturer-students');
                              },
                              child: Text('See All', style: TextStyle(color: Colors.white)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/img/img_2.jpg'),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Kofi Boakye Dokuno',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text('023197501'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                     backgroundImage: AssetImage('assets/img/img_4.jpg')),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ama Naa Boateng',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text('030116037'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/img/img_1.jpg')),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Emmanuel Orifia',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text('030116037'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/img/img_3.jpg')),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Emmanuel Quofie',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text('030116037'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/img/img_5.jpg')),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Aurora Asmah-Frimpong',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text('030116037'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/img/img_4.jpg')),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stella Manye',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text('030116037'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/lecturer-host-class');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}










// Dashboard Cards

class DashboardCards extends StatelessWidget {
  const DashboardCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      // color: Theme.of(context).colorScheme.primary,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/lecturer-reports');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '189',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text('Absentees')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, '/lecturer-attendance-list');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '54',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text('Attendances'),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 200,
              height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '87%',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text('Attendance Performance'),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/lecturer-classes');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text('Classes Taught'),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

//   Widget dashboardCard(String title, String detail) {
//     double width = 200;
//     double height = 200;
//     Color? color = Colors.grey[200];
//     String title = '';
//     String detail = '';

//     return Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Text('detail')
//           ],
//         ));
//   }
// }