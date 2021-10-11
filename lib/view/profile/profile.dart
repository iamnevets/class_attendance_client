// ignore_for_file: prefer_const_constructors

import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/model/user.model.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User? user = User(name: '', userName: '', password: '');

  @override
  void initState() {
    super.initState();
    user = AccountsRepository.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.grey[500]),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.grey[500],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/img_3.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user!.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Attendance'),
                      Text(
                        '104',
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Role'),
                      Text(
                        'Student',
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    // width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'School',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          'GCTU',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Class',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          'Informatics A',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Courses',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          'Entrepreneurship',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Visual Basic',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Networking',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'System Analysis and Design',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'C++',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
