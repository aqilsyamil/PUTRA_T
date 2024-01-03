import 'package:flutter/material.dart';
import 'BusRoutePage.dart';
import 'DutyPage.dart';
import 'MessagesPage.dart';

void main() {
  runApp(MyAppDriver());
}

class MyAppDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePageDriver(),
    );
  }
}

class MyHomePageDriver extends StatefulWidget {
  final int initialIndex;
  String mainStatus;

  MyHomePageDriver({
    this.initialIndex = 0,
    this.mainStatus = 'driver',
  });

  @override
  _MyHomePageStateDriver createState() => _MyHomePageStateDriver(initialIndex);
}

class _MyHomePageStateDriver extends State<MyHomePageDriver> {
  int _currentIndex;

  _MyHomePageStateDriver(int initialIndex) : _currentIndex = initialIndex;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          BusRoutePage(mainStatus: widget.mainStatus),
          DutyPage(mainStatus: widget.mainStatus),
          MessagesPage(mainStatus: widget.mainStatus),
        ],
      ),
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
              Icons.directions_bus,
              color: _currentIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
              color: _currentIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Duty',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _currentIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Messages',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
