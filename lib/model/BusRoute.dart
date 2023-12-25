import 'Bus.dart';
import 'RoutePoint.dart';

class BusRoute {
  RoutePoint _routePoint;
  Bus _bus;

  // Constructor
  BusRoute({
    required RoutePoint routePoint,
    required Bus bus,
  })  : _routePoint = routePoint,
        _bus = bus;

  // Getters
  RoutePoint get routePoint => _routePoint;

  Bus get bus => _bus;

  // Setters
  set routePoint(RoutePoint value) {
    _routePoint = value;
  }

  set bus(Bus value) {
    _bus = value;
  }
}