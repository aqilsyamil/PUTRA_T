import 'package:flutter/material.dart';
import 'SidebarPage.dart';
import 'SidebarPageDriver.dart';

class DutyPage extends StatefulWidget {
  String mainStatus;

  DutyPage({
    required this.mainStatus
  });

  @override
  _DutyPage createState() => _DutyPage();
}

class _DutyPage extends State<DutyPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/p_logo.png'),
          iconSize: 40,
          onPressed: () {},
        ),
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(), // Open drawer
          ),
        ],
      ),
      drawer: widget.mainStatus != 'driver' ?
      SidebarPage(mainStatus: widget.mainStatus) :
      SidebarPageDriver(mainStatus: widget.mainStatus),
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
