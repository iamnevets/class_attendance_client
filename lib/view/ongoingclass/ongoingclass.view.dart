import 'package:class_attendance/Repositories/classSignedIn.dart';
import 'package:class_attendance/model/student.model.dart';
import 'package:class_attendance/view/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

class OngoingClassView extends StatefulWidget {
  const OngoingClassView({Key? key}) : super(key: key);

  @override
  _OngoingClassViewState createState() => _OngoingClassViewState();
}

class _OngoingClassViewState extends State<OngoingClassView> {
  var progressValue = 10.0;
  bool isAttendanceSigned = false;

  @override
  void initState() {
    super.initState();
    isAttendanceSigned = IsSignedIn.isSignedIn;
  }

  final List<Student> listStudents = [
    Student(
        id: 1,
        name: 'Kofi Aboagye',
        imgUrl: 'assets/img/img_3.jpg',
        studentID: '030118901'),
    Student(
        id: 2,
        name: 'Xena Mankye',
        imgUrl: 'assets/img/img_4.jpg',
        studentID: '030118901'),
    Student(
        id: 3,
        name: 'Eric Opoku',
        imgUrl: 'assets/img/img-11.jpeg',
        studentID: '030118901'),
    Student(
        id: 4,
        name: 'Steven Amakye',
        imgUrl: 'assets/img/img-7.jpeg',
        studentID: '030118901'),
    Student(
        id: 5,
        name: 'Moses Regan',
        imgUrl: 'assets/img/img-8.jpeg',
        studentID: '030118901'),
    Student(
        id: 11,
        name: 'Ophelia Tomoe',
        imgUrl: 'assets/img/img-10.jpeg',
        studentID: '030118901'),
    Student(
        id: 6,
        name: 'Hafiz Nuhu',
        imgUrl: 'assets/img/img-6.jpeg',
        studentID: '030118901'),
    Student(
        id: 7,
        name: 'Paul Faye',
        imgUrl: 'assets/img/img-7.jpeg',
        studentID: '030118901'),
    Student(
        id: 8,
        name: 'Ismaiela Peterson',
        imgUrl: 'assets/img/img-12.jpeg',
        studentID: '030118901'),
    Student(
        id: 9,
        name: 'Gabriel Atoh',
        imgUrl: 'assets/img/img_1.jpg',
        studentID: '030118901'),
    Student(
        id: 9,
        name: 'Daniella Okyere',
        imgUrl: 'assets/img/img_5.jpg',
        studentID: '030118901'),
    Student(
        id: 10,
        name: 'Susan Frimpong',
        imgUrl: 'assets/img/img-9.jpeg',
        studentID: '030118901'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Artificial Intelligence',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              pinned: true,
              floating: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: 150,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              )),
          buildClassAttendanceList(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        child: ElevatedButton(
          child: isAttendanceSigned
              ? Text(
                  'SIGNED',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  'SIGN ATTENDANCE',
                  style: TextStyle(color: Colors.white),
                ),
          style: ButtonStyle(
            backgroundColor: isAttendanceSigned
                ? MaterialStateProperty.all<Color>(Colors.green)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary),
          ),
          onPressed: () async {
            setState(() {
              IsSignedIn.setSignInValue(true);
              isAttendanceSigned = true;
            });
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => OngoingClassView()));
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////
          },
        ),
      ),
    );
  }

  Widget buildClassAttendanceList() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // courseTimer(),
                Text('3H : ', style: TextStyle(fontSize: 20),),Text('30mins', style: TextStyle(fontSize: 20),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lecturer',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/img-11.jpeg'),
                    radius: 25,
                  ),
                  title: Text(
                    'Dr. Ezer Ebenezer Yeboah',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Divider(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Students',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listStudents
                    .map((student) => Column(
                          children: [
                            // SizedBox(height: 20,),
                            ListTile(
                              trailing: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(student.imgUrl),
                                radius: 25,
                              ),
                              title: Text(
                                student.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                              subtitle: Text(
                                student.studentID,
                              ),
                            ),
                            Divider(
                              height: 20,
                            ),
                          ],
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }

  Container courseTimer() {
    return Container(
      height: 100,
      width: 100,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            pointers: [
              RangePointer(
                  value: progressValue,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.startCurve,
                  gradient: SweepGradient(colors: <Color>[
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primaryVariant,
                  ], stops: <double>[
                    0.25,
                    0.75
                  ])),
              MarkerPointer(
                value: progressValue,
                markerType: MarkerType.circle,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              cornerStyle: CornerStyle.bothFlat,
              color: Theme.of(context).colorScheme.primary.withAlpha(50),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
          )
        ],
      ),
    );
  }
}
