import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'BusStop.dart';
import 'DrawnPath.dart';

class RoutePointPath {
  String _routePointPathID;
  BusStop _fromBusStop;
  BusStop _toBusStop;
  List<DrawnPath> _drawnPaths;

  // Constructor
  RoutePointPath({
    required String routePointPathID,
    required BusStop fromBusStop,
    required BusStop toBusStop,
    required List<DrawnPath> drawnPaths,
  })  : _routePointPathID = routePointPathID,
        _fromBusStop = fromBusStop,
        _toBusStop = toBusStop,
        _drawnPaths = drawnPaths;

  // Getters
  String get routePointPathID => _routePointPathID;

  BusStop get fromBusStop => _fromBusStop;

  BusStop get toBusStop => _toBusStop;

  List<DrawnPath> get drawnPaths => _drawnPaths;

  // Setters
  set routePointPathID(String value) {
    _routePointPathID = value;
  }

  set fromBusStop(BusStop value) {
    _fromBusStop = value;
  }

  set toBusStop(BusStop value) {
    _toBusStop = value;
  }

  set drawnPaths(List<DrawnPath> value) {
    _drawnPaths = value;
  }
}