import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('About'),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey[500],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}