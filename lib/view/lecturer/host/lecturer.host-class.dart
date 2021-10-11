import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LecturerHostClassView extends StatefulWidget {
  const LecturerHostClassView({Key? key}) : super(key: key);

  @override
  _LecturerHostClassViewState createState() => _LecturerHostClassViewState();
}

class _LecturerHostClassViewState extends State<LecturerHostClassView> {
  bool? checkValue = false;
  // bool? switchCheckValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Start New Class'),
        backgroundColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.primaryVariant),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'New class started.',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              ' Students can now connect.',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitRipple(
              size: 200,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              ' Connected Students.',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 20,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/img/img_2.jpg'),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kofi Boakye Dokuno',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Text('023197501'),
                                  ],
                                ),
                                Checkbox(
                                  value: checkValue,
                                  onChanged: (bool? switchCheckValue) {
                                    setState(() {
                                      switchCheckValue = checkValue;
                                    });
                                  },
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
                                    backgroundImage:
                                        AssetImage('assets/img/img_4.jpg')),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ama Naa Boateng',
                                      style:
                                          Theme.of(context).textTheme.headline6,
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
                                    backgroundImage:
                                        AssetImage('assets/img/img_1.jpg')),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kojo Mason',
                                      style:
                                          Theme.of(context).textTheme.headline6,
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
                                    backgroundImage:
                                        AssetImage('assets/img/img_1.jpg')),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Emmanuel Orifia',
                                      style:
                                          Theme.of(context).textTheme.headline6,
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
                    ]))
          ],
        ),
      ),
    );
  }
}
