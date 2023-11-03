import 'package:dartz/dartz.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';

/// [LocationRepository] is a contract class which defines the methods
/// that any implementation of [LocationRepository] must implement.
abstract interface class LocationRepository {
  Future<Either<PermissionFailure, (double lat, double long)>> getLocationData();
}
