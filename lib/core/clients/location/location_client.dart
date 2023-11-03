import 'package:geolocator/geolocator.dart';

final class LocationClient {
  Future<bool> isLocationServiceEnabled() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    return true;
  }

  Future<LocationPermissionStatus> getPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationPermissionStatus.denied;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationPermissionStatus.deniedForever;
    }
    return LocationPermissionStatus.granted;
  }

  Future<Position> determinePosition() async {
    return await Geolocator.getCurrentPosition();
  }
}

enum LocationPermissionStatus {
  denied,
  deniedForever,
  granted,
}
