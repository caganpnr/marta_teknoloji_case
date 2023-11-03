import 'package:dartz/dartz.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/domain/repositories/location_repository.dart';

final class UCGetLocation {
  final LocationRepository _repository;

  /// Interacts with the getAgent method of the [LocationRepository] and returns
  /// either [Failure] or a tuple
  UCGetLocation({required LocationRepository repository}) : _repository = repository;

  /// Returns either [Failure] or a tuple
  Future<Either<PermissionFailure, (double lat, double long)>> call() async {
    return _repository.getLocationData();
  }
}
