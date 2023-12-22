import 'package:flutter/material.dart';

class SidebarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200,
            padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0.0),
            child: Center(
              child: Image.asset(
                'assets/images/putra-t-sidebar-logo.png',
                height: 100,
              ),
            ),
          ),
          _divider(),
          _buildDrawerItem(Icons.info, 'About', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.code, 'For Developers', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.map, 'Campus Map', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.directions_bus, 'Transit Map', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.access_time, 'Bus Schedule', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.feedback, 'Feedback', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.settings, 'Settings', () {
            Navigator.pop(context);
          }),
          _divider(), // Divider below Settings

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              width: 10, // Set a specific width for the button
              child: OutlinedButton(
                onPressed: () {
                  // Define what happens when the button is pressed
                },
                child: Text(
                  'Driver Mode',
                  style: TextStyle(color: Color(0xFF00D161)),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFF00D161), width: 2.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        color: Colors.grey,
        thickness: 0.5,
      ),
    );
  }
}
