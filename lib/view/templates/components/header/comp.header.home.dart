import 'package:flutter/material.dart';

class HomeHeaderComponent extends StatelessWidget {
  const HomeHeaderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text(
                  'Now', 
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
                Text(
                  'Visual Basic', 
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                Text(
                  '02:48', 
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
              ],
            ),
          ),
          // IconButton(icon: Icon(Icons.calendar_today, color: Colors.white), onPressed: (){},)
        ],
      ),
    );
  }
}
