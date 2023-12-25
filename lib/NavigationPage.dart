import 'package:flutter/material.dart';
import 'SidebarPage.dart';

class NavigationPage extends StatefulWidget {

  final String initialEndLocation;
  final String endLocation;
  final String mainStatus;
  // NavigationPage({this.initialEndLocation = ''});
  NavigationPage({
    Key? key,
    this.initialEndLocation = '',
    this.endLocation = '',
    required this.mainStatus
  }) : super(key: key);

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  TextEditingController startLocationController = TextEditingController();
  TextEditingController endLocationController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Set the initial value for the start location
    endLocationController.text = widget.initialEndLocation;
  }

  void setEndLocation(String location) {
    setState(() {
      endLocationController.text = location; // Update the controller's text
    });
  }

  @override
  Widget build(BuildContext context) {

    setEndLocation(widget.endLocation);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/p_logo.png'),// Use your own asset image
          iconSize: 40,
          onPressed: () {
            // Handle icon button press
          },
        ),
        titleSpacing: 0.0, // This removes the default spacing on the left of the title
        centerTitle: false,
        title: Text(
          'Navigation',
          style: TextStyle(
            color: Colors.white, // Set the title font color to white
            fontWeight: FontWeight.w600, // Set the title font weight to bold
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white), // Hamburger icon
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ],// Set the background color of the AppBar
      ),
      drawer: SidebarPage(mainStatus: widget.mainStatus),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: startLocationController,
                        decoration: InputDecoration(
                          hintText: 'Start Location',
                          labelText: 'Start location',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        startLocationController.clear();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10), // Add some spacing
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: endLocationController,
                        decoration: InputDecoration(
                          hintText: 'End Location',
                          labelText: 'End location',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.swap_vert),
                      onPressed: () {
                        String temp = startLocationController.text;
                        startLocationController.text = endLocationController.text;
                        endLocationController.text = temp;
                      },
                    ),

                  ],
                ),

                // Space after the custom separator
                SizedBox(height: 20),
                // Thick grey line with text inside it
                Container(
                  height: 25,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2), // Adjusted padding
                  alignment: Alignment.centerLeft,
                  color: Colors.grey[200],
                  child: Text(
                    'Available Routes',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),

              ]
          ),
        ),
      ),
    );
  }

}
