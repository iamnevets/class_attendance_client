import 'package:flutter/material.dart';

class LecturerTimetableView extends StatefulWidget {
  const LecturerTimetableView({ Key? key }) : super(key: key);

  @override
  _LecturerTimetableViewState createState() => _LecturerTimetableViewState();
}

class _LecturerTimetableViewState extends State<LecturerTimetableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Timetable'),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primaryVariant
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}