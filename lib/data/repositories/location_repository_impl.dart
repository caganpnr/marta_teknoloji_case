import 'package:dartz/dartz.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/data/datasources/local/location_local_datasource.dart';
import 'package:marta_teknoloji_case/domain/repositories/location_repository.dart';
import 'package:marta_teknoloji_case/core/clients/location/location_client.dart';

final class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource _locationDataSource;

  LocationRepositoryImpl({required LocationDataSource locationDataSource}) : _locationDataSource = locationDataSource;

  @override
  Future<Either<PermissionFailure, (double lat, double long)>> getLocationData() async {
    final isEnabled = await _locationDataSource.isLocationServiceEnabled();
    if (isEnabled) {
      final hasPermission = await _locationDataSource.getPermission();
      switch (hasPermission) {
        case LocationPermissionStatus.denied:
          return left(NoPermissionFailure());
        case LocationPermissionStatus.deniedForever:
          return left(PermanentlyDeniedFailure());
        case LocationPermissionStatus.granted:
          final position = await _locationDataSource.determinePosition();
          return right((position.latitude, position.longitude));
      }
    }
    return left(LocationServiceDisabledFailure());
  }
}
