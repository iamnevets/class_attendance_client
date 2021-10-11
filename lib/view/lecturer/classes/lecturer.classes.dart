import 'package:flutter/material.dart';


class LecturerClassesView extends StatefulWidget {
  const LecturerClassesView({ Key? key }) : super(key: key);

  @override
  _LecturerClassesViewState createState() => _LecturerClassesViewState();
}

class _LecturerClassesViewState extends State<LecturerClassesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Classes'),
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