import 'package:flutter/material.dart';

class LecturerReportsView extends StatefulWidget {
  const LecturerReportsView({ Key? key }) : super(key: key);

  @override
  _LecturerReportsViewState createState() => _LecturerReportsViewState();
}

class _LecturerReportsViewState extends State<LecturerReportsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Reports'),
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