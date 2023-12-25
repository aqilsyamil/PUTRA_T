import 'package:flutter/material.dart';

class DutyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duty'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Duty Information',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Add widgets here to display duty-related information
            Text(
              'Shift: Morning Shift',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Date: January 10, 2023',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Bus Route: Route 101',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            // You can add more information widgets as needed
          ],
        ),
      ),
    );
  }
}
