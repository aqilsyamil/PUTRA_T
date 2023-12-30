import 'package:flutter/cupertino.dart';

import 'model/Buses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print('hello');
  Buses buses = Buses();
  buses.getData();
}