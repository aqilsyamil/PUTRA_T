import 'package:flutter/material.dart';
import 'BusStop.dart';
import 'SidebarPage.dart';

class StarredPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<String> starredBusStops;
  final Function(String) removeFromStarred;
  final Map<String, String> busStopImages;

  StarredPage({
    required this.scaffoldKey,
    required this.starredBusStops,
    required this.removeFromStarred,
    required this.busStopImages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/p_logo.png'),
          iconSize: 40,
          onPressed: () {
            // Handle icon button press
          },
        ),
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Starred',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Color(0xFF00D161),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
          ),
        ],
      ),
      drawer: SidebarPage(),
      body: ListView.builder(
        itemCount: starredBusStops.length,
        itemBuilder: (context, index) {
          String starredBusStop = starredBusStops[index];
          List<String> parts = starredBusStop.split('|');
          String busStopName = parts[0];
          String busStopShortName = parts[1];
          bool isStarred = true; // You may modify this based on your logic for starred bus stops
          String imagePath = busStopImages[busStopShortName] ?? 'assets/images/default.jpg';

          return BusStop(
            name: busStopName,
            shortName: busStopShortName,
            isStarred: isStarred,
            onStarPressed: () => removeFromStarred(starredBusStop),
            onSelect: () {
              // Optional: Add any action you want to perform on bus stop selection
            },
            imagePath: imagePath,
            updateEndLocation: (String location) {
              // Optional: Handle updating end location if needed
            },
          );
        },
      ),
    );
  }
}
