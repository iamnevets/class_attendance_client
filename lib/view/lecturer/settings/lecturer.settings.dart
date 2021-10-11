import 'package:flutter/material.dart';


class LecturerSettingsView extends StatefulWidget {
  const LecturerSettingsView({ Key? key }) : super(key: key);

  @override
  _LecturerSettingsViewState createState() => _LecturerSettingsViewState();
}

class _LecturerSettingsViewState extends State<LecturerSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings'),
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