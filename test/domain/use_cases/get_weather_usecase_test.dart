import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/domain/repositories/weather_repository.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_weather_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeatherEntity extends Mock implements WeatherEntity {}

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late UCGetWeather getWeatherUsecase;
  late MockWeatherEntity mockWeatherEntity;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeatherUsecase = UCGetWeather(repository: mockWeatherRepository);
    mockWeatherEntity = MockWeatherEntity();
  });

  group('Get Weather Usecase Test', () {
    test('Should return a weather entity when there is no exception', () async {
      const double latitude = 12.34;
      const double longitude = 56.78;
      when(() => mockWeatherRepository.getWeatherData(lat: latitude, long: longitude))
          .thenAnswer((_) async => Right(mockWeatherEntity));
      final result = await getWeatherUsecase.call(lat: latitude, long: longitude);

      verify(() => getWeatherUsecase.call(lat: latitude, long: longitude));
      expect(result, isA<Right<Failure, WeatherEntity>>());
    });

    test('Should return NetworkFailure when there is an exception', () async {
      const double latitude = 12.34;
      const double longitude = 56.78;
      when(() => mockWeatherRepository.getWeatherData(lat: latitude, long: longitude))
          .thenAnswer((_) async => Left(NetworkFailure()));
      final result = await getWeatherUsecase.call(lat: latitude, long: longitude);

      verify(() => getWeatherUsecase.call(lat: latitude, long: longitude));
      expect(result, isA<Left<Failure, WeatherEntity>>());
    });
  });
}
