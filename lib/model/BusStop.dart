import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';
class BusStop {
  String _id;
  String _fullName;
  String _shortName;
  LatLng _position;
  String _imagePath;

  // Constructor
  BusStop({
    required String id,
    required String fullName,
    required String shortName,
    required LatLng position,
    String imagePath = 'assets/images/default.jpg',
  })  : _id = id,
        _fullName = fullName,
        _shortName = shortName,
        _position = position,
        _imagePath = imagePath;

  // Getters
  String get id => _id;

  String get fullName => _fullName;

  String get shortName => _shortName;

  LatLng get position => _position;

  bool checkImagePathExist(String imagePath) {
    File imageFile = File(imagePath);
    return imageFile.existsSync();
  }

  String get imagePath {
    if (!checkImagePathExist(imagePath)) {
       return 'assets/images/default.jpg';
    }

    return _imagePath;
  }

  // Setters
  set id(String value) {
    _id = value;
  }

  set fullName(String value) {
    _fullName = value;
  }

  set shortName(String value) {
    _shortName = value;
  }

  set position(LatLng value) {
    _position = value;
  }

  set imagePath(String value) {
    _imagePath = value;

    if (!checkImagePathExist(_imagePath)) {
      _imagePath = 'assets/images/default.jpg';
    }
  }
}