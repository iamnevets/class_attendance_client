import 'package:flutter/material.dart';


class HelpView extends StatelessWidget {
  const HelpView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Help'),
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