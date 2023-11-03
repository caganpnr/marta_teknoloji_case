import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/data/datasources/remote/weather_remote_datasource.dart';
import 'package:marta_teknoloji_case/data/model/weather_model.dart';
import 'package:marta_teknoloji_case/data/repositories/weather_repository_impl.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/domain/repositories/weather_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

class MockWeatherModel extends Mock implements WeatherModel {}

class MockWeatherEntity extends Mock implements WeatherEntity {}

void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepository weatherRepository;
  late MockWeatherModel mockWeatherModel;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();

    weatherRepository = WeatherRepositoryImpl(
      dataSource: mockWeatherRemoteDataSource,
    );
    mockWeatherModel = MockWeatherModel();
  });

  group('Get Weather', () {
    test('Should return weather entity when there is no exception', () async {
      // Mock latitude and longitude values
      const double latitude = 12.34;
      const double longitude = 56.78;
      when(() => mockWeatherRemoteDataSource.getWeatherData(lat: latitude, long: longitude))
          .thenAnswer((_) async => mockWeatherModel);
      final result = await weatherRepository.getWeatherData(lat: latitude, long: longitude);

      verify(() => mockWeatherRemoteDataSource.getWeatherData(lat: latitude, long: longitude));
      expect(result, isA<Right<Failure, WeatherEntity>>());
    });

    test('Should return a Failure type of object when there is an exception', () async {
      // Mock latitude and longitude values
      const double latitude = 12.34;
      const double longitude = 56.78;

      when(() => mockWeatherRemoteDataSource.getWeatherData(lat: latitude, long: longitude)).thenThrow(Exception());

      final result = await weatherRepository.getWeatherData(lat: latitude, long: longitude);

      verify(() => mockWeatherRemoteDataSource.getWeatherData(lat: latitude, long: longitude));
      expect(result, isA<Left<Failure, WeatherEntity>>());
    });
  });
}
