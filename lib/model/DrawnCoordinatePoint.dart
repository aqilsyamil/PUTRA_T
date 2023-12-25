import 'package:google_maps_flutter/google_maps_flutter.dart';
class DrawnCoordinatePoint {
  LatLng _subsequentCoordinatePoint;
  LatLng _consequentCoordinatePoint;

  // Constructor
  DrawnCoordinatePoint({
    required LatLng subsequentCoordinatePoint,
    required LatLng consequentCoordinatePoint,
  })  : _subsequentCoordinatePoint = subsequentCoordinatePoint,
        _consequentCoordinatePoint = consequentCoordinatePoint;

  // Getters
  LatLng get subsequentCoordinatePoint => _subsequentCoordinatePoint;

  LatLng get consequentCoordinatePoint => _consequentCoordinatePoint;

  // Setters
  set subsequentCoordinatePoint(LatLng value) {
    _subsequentCoordinatePoint = value;
  }

  set consequentCoordinatePoint(LatLng value) {
    _consequentCoordinatePoint = value;
  }
}