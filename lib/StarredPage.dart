import 'package:flutter/material.dart';

// class StarredPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: Text('Starred Page'),
//       ),
//     );
//   }
// }
class StarredPage extends StatelessWidget {
  final List<String> starredBusStops;
  final Function(String) removeFromStarred;

  StarredPage({
    required this.starredBusStops,
    required this.removeFromStarred,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Starred',
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
              // Handle hamburger menu button press
            },
          ),
        ],// Set the background color of the AppBar
      ),
      body: ListView.builder(
        itemCount: starredBusStops.length,
        itemBuilder: (context, index) {
          String starredBusStop = starredBusStops[index];

          // Split the combined string into name and shortName
          List<String> parts = starredBusStop.split('|');
          String busStopName = parts[0];
          String busStopShortName = parts[1];

          return Column(
            children: [
              ListTile(
                title: Text(
                  busStopName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(busStopShortName),
                trailing: IconButton(
                  icon: Icon(Icons.star, color: Colors.orange),
                  onPressed: () {
                    removeFromStarred(starredBusStop);
                  },
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5, // Set the thickness of the divider
              ),
            ],
          );
        },
      ),
    );
  }
}
