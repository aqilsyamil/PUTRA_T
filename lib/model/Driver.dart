import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'User.dart';

class Driver extends User {
  String _driverID;
  String _fullName;
  String _phoneNo;
  String _password;
  LatLng _busDriverLocation;
  String _driverPhoto;

  // Constructor
  Driver({
         required String driverID,
         required String fullName,
         required String phoneNo,
         required String password,
         LatLng busDriverLocation = const LatLng(0,0),
         required String driverPhoto
  })
      : _driverID = driverID,
        _fullName = fullName,
        _phoneNo = phoneNo,
        _password = password,
        _busDriverLocation = busDriverLocation,
        _driverPhoto = driverPhoto,
        super(userID: driverID, userLocation: busDriverLocation);

  // Getter for userID
  String get driverID {
    return super.userID;
  }

  // Setter for userID
  set driverID(String driverID) {
    driverID = super.userID;
  }

  // Getter for full name
  String get fullName => _fullName;

  // Setter for full name
  set fullName(String value) {
    _fullName = value;
  }

  // Getter for phone number
  String get phoneNo => _phoneNo;

  // Setter for phone number
  set phoneNo(String value) {
    _phoneNo = value;
  }

  // Getter for password
  String get password => _password;

  // Setter for password
  set password(String value) {
    _password = value;
  }

  // Getter for bus driver location
  LatLng get busDriverLocation {
    return super.userLocation;
  }

  // Setter for bus driver location
  set busDriverLocation(LatLng busDriverLocation) {
    _busDriverLocation = busDriverLocation;
  }

  // Getter for driver photo
  String get driverPhoto => _driverPhoto;

  // Setter for driver photo
  set driverPhoto(String value) {
    _driverPhoto = value;
  }
}
