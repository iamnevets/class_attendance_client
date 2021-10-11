import 'package:flutter/material.dart';


class NotificationsView extends StatelessWidget {
  const NotificationsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                // Navigator.pushNamed(context, '/');
              },
              leading: Icon(Icons.list_alt),
              title: Text('Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}