import 'package:flutter/material.dart';
import 'BusStopPage.dart';
import 'BusRoutePage.dart';
import 'NavigationPage.dart';
import 'StarredPage.dart';
import 'MessagesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<String> _starredBusStops = []; // Make it private
  GlobalKey<NavigationPageState> navigationPageKey = GlobalKey();
  String endLocation = "";


  void addToStarredBusStops(String busStop) {
    setState(() {
      _starredBusStops.add(busStop);
    });
  }

  void removeFromStarredBusStops(String busStop) {
    setState(() {
      _starredBusStops.remove(busStop);
    });
  }

  void onBusStopSelected(String busStopName, String busStopShortName) {
    String formatLocation = "$busStopName ($busStopShortName)";
    setState(() {
      _currentIndex = 2; // Index of NavigationPage
    });
    navigationPageKey.currentState?.setEndLocation(formatLocation);
  }

  void updateEndLocation(String location) {

    setState(() {
      _currentIndex = 2; // Navigate to NavigationPage
      endLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? BusStopPage(
        starredBusStops: _starredBusStops,
        addToStarred: addToStarredBusStops,
        removeFromStarred: removeFromStarredBusStops,
        onBusStopSelected: onBusStopSelected,
        updateEndLocation: updateEndLocation,
      )
          : _currentIndex == 1
          ? BusRoutePage()
          : _currentIndex == 2
          ? NavigationPage(
        key: navigationPageKey,
        endLocation: endLocation,
      )
          : _currentIndex == 3
          ? StarredPage(
        starredBusStops: _starredBusStops,
        removeFromStarred: removeFromStarredBusStops,
      )
          : MessagesPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: _currentIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Bus Stops',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_bus,
              color: _currentIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Bus Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation,
              color: _currentIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Navigation',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: _currentIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Starred',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _currentIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: 'Messages',
          ),
        ],
        selectedItemColor: Colors.black, // Color when selected
        unselectedItemColor: Colors.grey, // Color when not selected
      ),
    );
  }
}
