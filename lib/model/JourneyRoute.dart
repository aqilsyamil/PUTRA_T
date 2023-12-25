import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'BusRoute.dart';

class JourneyRoute {
  String _journeyRouteID;
  LatLng _startPoint;
  LatLng _endPoint;
  LatLng _userLocation;
  BusRoute _transitMap;

  // Constructor
  JourneyRoute({
    required String journeyRouteID,
    required LatLng startPoint,
    required LatLng endPoint,
    required LatLng userLocation,
    required BusRoute transitMap,
  })  : _journeyRouteID = journeyRouteID,
        _startPoint = startPoint,
        _endPoint = endPoint,
        _userLocation = userLocation,
        _transitMap = transitMap;

  // Getters
  String get journeyRouteID => _journeyRouteID;

  LatLng get startPoint => _startPoint;

  LatLng get endPoint => _endPoint;

  LatLng get userLocation => _userLocation;

  BusRoute get transitMap => _transitMap;

  // Setters
  set journeyRouteID(String value) {
    _journeyRouteID = value;
  }

  set startPoint(LatLng value) {
    _startPoint = value;
  }

  set endPoint(LatLng value) {
    _endPoint = value;
  }

  set userLocation(LatLng value) {
    _userLocation = value;
  }

  set transitMap(BusRoute value) {
    _transitMap = value;
  }
}