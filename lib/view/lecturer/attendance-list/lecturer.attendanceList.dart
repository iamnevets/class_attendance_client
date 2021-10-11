import 'package:flutter/material.dart';


class LecturerAttendanceListView extends StatefulWidget {
  const LecturerAttendanceListView({ Key? key }) : super(key: key);

  @override
  _LecturerAttendanceListViewState createState() => _LecturerAttendanceListViewState();
}

class _LecturerAttendanceListViewState extends State<LecturerAttendanceListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Attendance List'),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primaryVariant
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              color: Theme.of(context).colorScheme.primary,
              shadowColor: Theme.of(context).colorScheme.primaryVariant,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Research Methods', style: Theme.of(context).textTheme.headline5,),
                          Text('32 Students', style: Theme.of(context).textTheme.subtitle1,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}