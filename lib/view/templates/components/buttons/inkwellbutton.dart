import 'package:flutter/material.dart';

class AppInkwellButton extends StatelessWidget {
  const AppInkwellButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    required this.navigateTo, this.color,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final String navigateTo;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.secondary,
      onTap: () async {
        

        Navigator.pushNamed(context, navigateTo);
      },
      child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1,
                  color: color
                ),
              ),
            ],
          )),
    );
  }
}
