import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'DrawnCoordinatePoint.dart';

class RoutePoint {
  String _routePointID;
  LatLng _fromBusStop;
  LatLng _toBusStop;
  List<DrawnCoordinatePoint> _drawnCoordinatePoint;

  // Constructor
  RoutePoint({
    required String routePointID,
    required LatLng fromBusStop,
    required LatLng toBusStop,
    required List<DrawnCoordinatePoint> drawnCoordinatePoint,
  })  : _routePointID = routePointID,
        _fromBusStop = fromBusStop,
        _toBusStop = toBusStop,
        _drawnCoordinatePoint = drawnCoordinatePoint;

  // Getters
  String get routePointID => _routePointID;

  LatLng get fromBusStop => _fromBusStop;

  LatLng get toBusStop => _toBusStop;

  List<DrawnCoordinatePoint> get drawnCoordinatePoint => _drawnCoordinatePoint;

  // Setters
  set routePointID(String value) {
    _routePointID = value;
  }

  set fromBusStop(LatLng value) {
    _fromBusStop = value;
  }

  set toBusStop(LatLng value) {
    _toBusStop = value;
  }

  set drawnCoordinatePoint(List<DrawnCoordinatePoint> value) {
    _drawnCoordinatePoint = value;
  }
}