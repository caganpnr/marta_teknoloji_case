import 'package:dartz/dartz.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';

/// [WeatherRepository] is a contract class which defines the methods
/// that any implementation of [WeatherRepository] must implement.
abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherData({required double lat, required double long});
}
