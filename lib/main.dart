import 'package:class_attendance/view/auth/lecturer.auth.login.dart';
import 'package:class_attendance/view/auth/login.auth.dart';
import 'package:class_attendance/view/auth/signup.auth.dart';
import 'package:class_attendance/view/config/themePreference.dart';
import 'package:class_attendance/view/home/home.dart';
import 'package:class_attendance/view/lecturer/attendance-list/lecturer.attendanceList.dart';
import 'package:class_attendance/view/lecturer/classes/lecturer.classes.dart';
import 'package:class_attendance/view/lecturer/host/lecturer.host-class.dart';
import 'package:class_attendance/view/lecturer/reports/lecturer.reports.dart';
import 'package:class_attendance/view/lecturer/settings/lecturer.settings.dart';
import 'package:class_attendance/view/lecturer/students/lecturer.studentlist.dart';
import 'package:class_attendance/view/lecturer/support/lecturer.support.dart';
import 'package:class_attendance/view/lecturer/timetable/lecturer.timetable.dart';
import 'package:class_attendance/view/new-class/new.class.dart';
import 'package:class_attendance/view/notifications/notifications.dart';
import 'package:class_attendance/view/profile/profile.dart';
import 'package:class_attendance/view/settings/about/about.dart';
import 'package:class_attendance/view/settings/settings.dart';
import 'package:class_attendance/view/settings/support/help.dart';
import 'package:class_attendance/view/splash/splash.dart';
import 'package:class_attendance/view/timetable/timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/home/lecturer.home.view.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  
}

class _MyAppState extends State<MyApp> {
  // DarkThemeProvider themeChangeProvider =  DarkThemeProvider();

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentAppTheme();
  // }

  // void getCurrentAppTheme() async {
  //   themeChangeProvider.darkTheme =
  //       (await themeChangeProvider.darkThemePreference.getTheme())!;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheming.lightThemeData(),
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheming.darkThemeData(),
        // home: NewClassView(),
        routes: {
          '/': (context) => SplashView(),
          '/home': (context) => HomeView(),
          '/profile': (context) => ProfileView(),
          '/join-class': (context) => NewClassView(),
          '/settings': (context) => SettingsView(),
          '/notifications': (context) => NotificationsView(),
          '/timetable': (context) => TimeTableView(),
          '/login.auth': (context) => AuthLoginView(),
          '/signup.auth': (context) => AuthSignupView(),
          '/about': (context) => AboutView(),
          '/help': (context) => HelpView(),


          // Lecturer's navigation routes
          '/lecturer-login': (context) => LecturerLoginView(),
          '/lecturer-home': (context) => LecturerHomeView(),
          '/lecturer-attendance-list': (context) => LecturerAttendanceListView(),
          '/lecturer-timetable': (context) => LecturerTimetableView(),
          '/lecturer-classes': (context) => LecturerClassesView(),
          '/lecturer-students': (context) => LecturerStudentsView(),
          '/lecturer-reports': (context) => LecturerReportsView(),
          '/lecturer-support': (context) => LecturerSupportView(),
          '/lecturer-settings': (context) => LecturerSettingsView(),
          '/lecturer-host-class': (context) => LecturerHostClassView(),

        });
  }
}
