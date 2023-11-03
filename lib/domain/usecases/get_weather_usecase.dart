import 'package:dartz/dartz.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/domain/repositories/weather_repository.dart';

final class UCGetWeather {
  UCGetWeather({required WeatherRepository repository}) : _repository = repository;

  /// Interacts with the getWeatherData method of the [WeatherRepository] and returns
  /// either [Failure] or List of [WeatherEntity]
  final WeatherRepository _repository;

  /// Returns either [Failure] or List of [WeatherEntity]
  Future<Either<Failure, WeatherEntity>> call({required double lat, required double long}) {
    return _repository.getWeatherData(lat: lat, long: long);
  }
}
