import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:marta_teknoloji_case/app/errors/exceptions.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/data/datasources/remote/weather_remote_datasource.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/domain/repositories/weather_repository.dart';

final class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required WeatherRemoteDataSource dataSource}) : _dataSource = dataSource;

  final WeatherRemoteDataSource _dataSource;
  @override
  // Gets a [WeatherModel] from the remote data source. and returns a [WeatherEntity] or a [Failure].
  Future<Either<Failure, WeatherEntity>> getWeatherData({required double lat, required double long}) async {
    try {
      // Get list of [WeatherModel] from the remote data source.
      final response = await _dataSource.getWeatherData(lat: lat, long: long);
      // Parse [WeatherModel] to a [WeatherEntity].
      return right(response.toEntity());
      // On DioException, return a [NetworkFailure].
    } on DioException {
      return left(NetworkFailure());
      // On NullResponseException, return a [NullResponseFailure].
    } on NullResponseException {
      return left(NullResponseFailure());
      // On any other exception, return a [UnknownFailure] and print the error.
    } catch (e) {
      debugPrint(e.toString());
      return left(UnknownFailure());
    }
  }
}
