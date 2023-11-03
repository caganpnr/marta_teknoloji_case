import 'package:geolocator/geolocator.dart';
import 'package:marta_teknoloji_case/core/clients/location/location_client.dart';

abstract interface class LocationDataSource {
  Future<bool> isLocationServiceEnabled();
  Future<LocationPermissionStatus> getPermission();
  Future<Position> determinePosition();
}

final class LocationDataSourceImpl implements LocationDataSource {
  LocationDataSourceImpl({required LocationClient locationClient}) : _locationClient = locationClient;

  final LocationClient _locationClient;

  @override
  Future<bool> isLocationServiceEnabled() async {
    return _locationClient.isLocationServiceEnabled();
  }

  @override
  Future<LocationPermissionStatus> getPermission() async {
    return _locationClient.getPermission();
  }

  @override
  Future<Position> determinePosition() async {
    return _locationClient.determinePosition();
  }
}
