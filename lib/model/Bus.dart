
import 'Driver.dart';
import 'User.dart';

class Bus {
  String _busID;
  Driver _driver;
  User _user;
  String _plateNo;
  int _busCapacity;

  Bus({
    required String busID,
    required Driver driver,
    required User user,
    required String plateNo,
    required int busCapacity,
  })   : _busID = busID,
        _driver = driver,
        _user = user,
        _plateNo = plateNo,
        _busCapacity = busCapacity;

  String get busID => _busID;

  set busID(String value) {
    _busID = value;
  }

  Driver get driver => _driver;

  set driver(Driver value) {
    _driver = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  String get plateNo => _plateNo;

  set plateNo(String value) {
    _plateNo = value;
  }

  int get busCapacity => _busCapacity;

  set busCapacity(int value) {
    _busCapacity = value;
  }
}
