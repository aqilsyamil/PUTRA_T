import 'package:flutter/material.dart';

class DutyPageRoute4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Duty',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Column(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft, // Align text to the left
            padding: EdgeInsets.only(left: 40.0), // Add some padding on the left
            child: Text(
              'Route 4',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'This is Duty Page Route 4',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}