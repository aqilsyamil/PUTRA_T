// import 'package:flutter/material.dart';
// import 'SidebarPage.dart';
//
// class NavigationPage extends StatefulWidget {
//
//   final String initialEndLocation;
//   final String endLocation;
//   final String mainStatus;
//   // NavigationPage({this.initialEndLocation = ''});
//   NavigationPage({
//     Key? key,
//     this.initialEndLocation = '',
//     this.endLocation = '',
//     required this.mainStatus
//   }) : super(key: key);
//
//   @override
//   NavigationPageState createState() => NavigationPageState();
// }
//
// class NavigationPageState extends State<NavigationPage> {
//   TextEditingController startLocationController = TextEditingController();
//   TextEditingController endLocationController = TextEditingController();
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     // Set the initial value for the start location
//     endLocationController.text = widget.initialEndLocation;
//   }
//
//   void setEndLocation(String location) {
//     setState(() {
//       endLocationController.text = location; // Update the controller's text
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     setEndLocation(widget.endLocation);
//
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Image.asset('assets/images/p_logo.png'),// Use your own asset image
//           iconSize: 40,
//           onPressed: () {
//             // Handle icon button press
//           },
//         ),
//         titleSpacing: 0.0, // This removes the default spacing on the left of the title
//         centerTitle: false,
//         title: Text(
//           'Navigation',
//           style: TextStyle(
//             color: Colors.white, // Set the title font color to white
//             fontWeight: FontWeight.w600, // Set the title font weight to bold
//           ),
//           textAlign: TextAlign.left,
//         ),
//         backgroundColor: Color(0xFF00D161),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.menu, color: Colors.white), // Hamburger icon
//             onPressed: () {
//               _scaffoldKey.currentState?.openDrawer();
//             },
//           ),
//         ],// Set the background color of the AppBar
//       ),
//       drawer: SidebarPage(mainStatus: widget.mainStatus),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//               children: [
//                 SizedBox(height: 16),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: startLocationController,
//                         decoration: InputDecoration(
//                           hintText: 'Start Location',
//                           labelText: 'Start location',
//                           floatingLabelBehavior: FloatingLabelBehavior.never,
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(4.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.close),
//                       onPressed: () {
//                         startLocationController.clear();
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10), // Add some spacing
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: endLocationController,
//                         decoration: InputDecoration(
//                           hintText: 'End Location',
//                           labelText: 'End location',
//                           floatingLabelBehavior: FloatingLabelBehavior.never,
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(4.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.swap_vert),
//                       onPressed: () {
//                         String temp = startLocationController.text;
//                         startLocationController.text = endLocationController.text;
//                         endLocationController.text = temp;
//                       },
//                     ),
//
//                   ],
//                 ),
//
//                 // Space after the custom separator
//                 SizedBox(height: 20),
//                 // Thick grey line with text inside it
//                 Container(
//                   height: 25,
//                   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2), // Adjusted padding
//                   alignment: Alignment.centerLeft,
//                   color: Colors.grey[200],
//                   child: Text(
//                     'Available Routes',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ),
//
//               ]
//           ),
//         ),
//       ),
//     );
//   }
//
// }


//frfrfrfrfrffr

import 'package:flutter/material.dart';
import 'SidebarPage.dart'; // Ensure this import points to your actual SidebarPage file

class NavigationPage extends StatefulWidget {
  final String initialEndLocation;
  final String endLocation;
  final String mainStatus;

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController startLocationController = TextEditingController();
  TextEditingController endLocationController = TextEditingController();
  OverlayEntry? _overlayEntry;

  final GlobalKey startLocationKey = GlobalKey();
  final GlobalKey endLocationKey = GlobalKey();
  final GlobalKey availableRoutesKey = GlobalKey();

  List<Map<String, String>> _filteredBusStops = [];
  List<Map<String, String>> busStops = [
    {'name': 'Academic Complex A (Opp FBMK)', 'shortName': 'KAA'},
    {'name': 'Banquet Hall', 'shortName': 'Banquet'},
    {'name': 'Centre of Foundation Studies for Agricultural Science', 'shortName': 'ASPer'},
    {'name': 'Faculty of Agriculture', 'shortName': 'FP'},
    {'name': 'Faculty of Agriculture Cafeteria', 'shortName': 'FPC'},
    {'name': 'Faculty of Biotechnology and Biomolecular Sciences', 'shortName': 'FBSB'},
    {'name': 'Faculty of Computer Science & Information Technology', 'shortName': 'FSKTM'},
    {'name': 'Faculty of Design & Architecture', 'shortName': 'FRSB'},
    {'name': 'Faculty of Food Science & Technology', 'shortName': 'FSTM'},
    {'name': 'Faculty of Modern Languages & Communication', 'shortName': 'FBMK'},
    {'name': 'Faculty of Science', 'shortName': 'FS'},
    {'name': 'Fourteenth College', 'shortName': 'K14'},
    {'name': 'Institute for Mathematical Research', 'shortName': 'INSPEM'},
    {'name': 'Institute of Bioscience', 'shortName': 'IBS'},
    {'name': 'Putra Foodcourt', 'shortName': 'PFC'},
    {'name': 'School of Graduate Studies', 'shortName': 'SGS'},
    {'name': 'Serumpun Foodcourt', 'shortName': 'SFC'},
    {'name': 'Sports Academy', 'shortName': 'Academy'},
    {'name': 'Sultan Abdul Samad Library', 'shortName': 'PSAS'},
    {'name': 'Tenth College', 'shortName': 'K10'},
    {'name': 'Tan Sri Aishah Ghani College', 'shortName': 'KTAG'},
    {'name': 'Tan Sri Mustaffa Babjee', 'shortName': 'KMB'},
    {'name': 'Central (Great Hall & Experimental Theatre)', 'shortName': 'Central'},
    // Add other bus stops as needed
  ];


  Map<String, List<String>> busStopRoutes = {
    'PFC': ['1', '5'],
    'KTAG': ['1', '2', '5'],
    'SFC': ['2', '5'],
    'Central': ['1', '2', '3', '4'],
    'FBMK': ['1', '2', '3', '4'],
    // 'FBSB': [], // Uncomment if FBSB has specific routes
    'FP': ['5'],
    'FPC': ['5'],
    'FRSB': ['3'],
    'FS': ['1', '2', '3', '4'],
    'FSKTM': ['1', '2', '3'],
    'FSTM': ['1', '2', '3', '4'],
    'IBS': ['1', '2'],
    // 'Opp INSPEM': [], // Uncomment if Opp INSPEM has specific routes
    'K10': ['3'],
    'K14': ['1', '2'],
    'KMB': ['4'],
    'PSAS': ['1', '2', '3', '4'],
    'SGS': ['5'],
    'Banquet': ['5'],
    // 'ASPer': [], // Uncomment if ASPer has specific routes
    'KAA': ['3', '4'],
    'Academy': ['5'],
    // Add other bus stop routes as needed
  };

  @override
  void initState() {
    super.initState();
    endLocationController.text = widget.initialEndLocation;
    _filteredBusStops = busStops;
  }

  void _selectBusStop(TextEditingController controller, String busStopName) {
    setState(() {
      controller.text = busStopName;
    });
  }

  void setEndLocation(String location) {
    setState(() {
      endLocationController.text = location;
    });
  }

  void _filterBusStops(String enteredText) {
    setState(() {
      _filteredBusStops = busStops.where((busStop) {
        return busStop['name']!.toLowerCase().contains(enteredText.toLowerCase()) ||
            busStop['shortName']!.toLowerCase().contains(enteredText.toLowerCase());
      }).toList();
    });
  }

  void _showOverlay(BuildContext context, TextEditingController controller, GlobalKey key) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    if (controller.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
        var size = renderBox.size;
        var offset = renderBox.localToGlobal(Offset.zero);

        _overlayEntry = _createOverlayEntry(context, controller, size, offset);
        Overlay.of(context)!.insert(_overlayEntry!);
      });
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext context, TextEditingController controller, Size size, Offset offset) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 8.0,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: _filteredBusStops.map<Widget>((busStop) {
                return ListTile(
                  title: Text(busStop['name']!),
                  subtitle: Text(busStop['shortName']!),
                  onTap: () {
                    _selectBusStop(controller, busStop['name']!);
                    _overlayEntry!.remove();
                    _overlayEntry = null;
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  List<String> findOverlappingRoutes(String startShortName, String endShortName) {
    var startRoutes = busStopRoutes[startShortName] ?? [];
    var endRoutes = busStopRoutes[endShortName] ?? [];
    return startRoutes.toSet().intersection(endRoutes.toSet()).toList();
  }

  String _extractShortName(String busStopName) {
    var foundStop = busStops.firstWhere(
            (stop) => stop['name'] == busStopName,
        orElse: () => {'shortName': ''}
    );
    return foundStop['shortName'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    String startShortName = _extractShortName(startLocationController.text);
    String endShortName = _extractShortName(endLocationController.text);
    List<String> overlappingRoutes = findOverlappingRoutes(startShortName, endShortName);

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
          'Navigation',
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
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ],
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
                      key: startLocationKey,
                      controller: startLocationController,
                      decoration: InputDecoration(
                        labelText: startLocationController.text.isEmpty ? 'Start Location' : '',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,               // Set to true for a filled background
                        fillColor: Colors.grey[200], // Change this to the grey color you prefer
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      onTap: () => _showOverlay(context, startLocationController, startLocationKey),
                      onChanged: (value) {
                        _filterBusStops(value);
                        _showOverlay(context, startLocationController, startLocationKey);
                      },
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
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      key: endLocationKey,
                      controller: endLocationController,
                      decoration: InputDecoration(
                        labelText: endLocationController.text.isEmpty ? 'End Location' : endLocationController.text,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,               // Set to true for a filled background
                        fillColor: Colors.grey[200], // Change this to the grey color you prefer
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      onTap: () => _showOverlay(context, endLocationController, endLocationKey),
                      onChanged: (value) {
                        _filterBusStops(value);
                        _showOverlay(context, endLocationController, endLocationKey);
                      },
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
                key: availableRoutesKey,
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
              if (overlappingRoutes.isNotEmpty)
              Wrap(
                spacing: 8.0,
                children: overlappingRoutes.map((route) => ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('Route $route'),
                )).toList(),
                 )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'No available routes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700], // Dark grey color
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    startLocationController.dispose();
    endLocationController.dispose();
    _overlayEntry?.dispose();
    super.dispose();
  }
}
