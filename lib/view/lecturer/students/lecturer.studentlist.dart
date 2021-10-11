import 'package:flutter/material.dart';

class LecturerStudentsView extends StatefulWidget {
  const LecturerStudentsView({Key? key}) : super(key: key);

  @override
  _LecturerStudentsViewState createState() => _LecturerStudentsViewState();
}

class _LecturerStudentsViewState extends State<LecturerStudentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
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
                          // Padding(
                          //   padding: const EdgeInsets.all(20.0),
                          //   child: Row(
                          //     children: [
                          //       Row(
                          //         children: [
                          //           CircleAvatar(
                          //             backgroundImage: AssetImage('assets/img/img_3.jpg')),
                          //           SizedBox(
                          //             width: 20.0,
                          //           ),
                          //           Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 'Emmanuel Quofie',
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .headline6,
                          //               ),
                          //               Text('030116037'),
                          //             ],
                          //           ),
                          //           Divider(
                          //             height: 10,
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Divider(),
                          // Padding(
                          //   padding: const EdgeInsets.all(20.0),
                          //   child: Row(
                          //     children: [
                          //       Row(
                          //         children: [
                          //           CircleAvatar(
                          //             backgroundImage: AssetImage('assets/img/img_5.jpg')),
                          //           SizedBox(
                          //             width: 20.0,
                          //           ),
                          //           Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 'Aurora Asmah-Frimpong',
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .headline6,
                          //               ),
                          //               Text('030116037'),
                          //             ],
                          //           ),
                          //           Divider(
                          //             height: 10,
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Divider(),
                          
                        ],
      ),
    );
  }
}
