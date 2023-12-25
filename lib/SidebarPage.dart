import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SettingPage.dart';

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
          _buildDrawerItem(Icons.code, 'For Developers', () async {
            const url = 'https://github.com/aqilsyamil/PUTRA_T';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          }),
          _buildDrawerItem(Icons.map, 'Campus Map', () {
            _showTransitMap(context, 'assets/images/campus-map-north.jpeg');
          }),
          _buildDrawerItem(Icons.directions_bus, 'Transit Map', () {
            _showTransitMap(context, 'assets/images/transit_map.png');
          }),
          _buildDrawerItem(Icons.access_time, 'Bus Schedule', () async {
            const url = 'https://hep.upm.edu.my/perkhidmatan_utama/seksyen_pengurusan_kenderaan/jadual_perkhidmatan_bas_kampus_upm-63338?L=en';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          }),
          _buildDrawerItem(Icons.feedback, 'Feedback', () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'bhep@upm.edu.my',
              query: Uri.encodeFull(
                  'subject=UPM Bus Feedback&body=Name of Informant:\n'
                      'Incident Date:\n'
                      'Incident Time:\n'
                      'Bus Route:\n'
                      'Bus Plate No.:\n'
                      'Bus Stop:\n'
                      'Details:\n'),
            );
            if (await canLaunch(emailLaunchUri.toString())) {
              await launch(emailLaunchUri.toString());
            } else {
              print('Could not launch $emailLaunchUri');
            }
          }),
          _buildDrawerItem(Icons.settings, 'Settings', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
            );
          }),
          _divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              width: 10,
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
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(color: Colors.grey, thickness: 0.5),
    );
  }

  void _showTransitMap(BuildContext context, String imagePath) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black, // Full black background
          body: Stack(
            children: <Widget>[
              Center(
                child: InteractiveViewer(
                  panEnabled: true, // Set it to false if you don't want the user to pan the image.
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 4,
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 80.0,
                right: 5.0,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
      barrierDismissible: true, // Set to false if you don't want to dismiss the dialog by tapping outside
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );
  }
}
