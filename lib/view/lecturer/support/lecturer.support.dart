import 'package:flutter/material.dart';

class LecturerSupportView extends StatelessWidget {
  const LecturerSupportView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Support'),
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