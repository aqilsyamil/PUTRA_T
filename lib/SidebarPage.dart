import 'package:flutter/material.dart';

class SidebarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // Set the background color of the entire drawer to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200, // Adjust the height as needed
            padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0.0), // Increase top padding
            child: Center(
              child: Image.asset(
                'assets/images/putra-t-sidebar-logo.png',
                height: 100, // Adjust the height as needed
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Update the state of the app
              // Close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_bus),
            title: Text('Bus Schedule'),
            onTap: () {
              // Update the state of the app
              // Close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Campus Map'),
            onTap: () {
              // Update the state of the app
              // Close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              // Update the state of the app
              // Close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // Close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
