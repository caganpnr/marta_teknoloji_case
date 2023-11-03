import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marta_teknoloji_case/app/env/env.dart';
import 'package:marta_teknoloji_case/core/clients/location/location_client.dart';
import 'package:marta_teknoloji_case/core/clients/network/network_client.dart';
import 'package:marta_teknoloji_case/data/datasources/local/location_local_datasource.dart';
import 'package:marta_teknoloji_case/data/datasources/remote/weather_remote_datasource.dart';
import 'package:marta_teknoloji_case/data/repositories/location_repository_impl.dart';
import 'package:marta_teknoloji_case/data/repositories/weather_repository_impl.dart';
import 'package:marta_teknoloji_case/domain/repositories/location_repository.dart';
import 'package:marta_teknoloji_case/domain/repositories/weather_repository.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_location_usecase.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_weather_usecase.dart';

final getIt = GetIt.instance;

void initServices() {
  getIt

    // Use cases
    ..registerFactory(
      () => UCGetWeather(
        repository: getIt(),
      ),
    )
    ..registerFactory(
      () => UCGetLocation(
        repository: getIt(),
      ),
    )

    // Repository
    ..registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(
        dataSource: getIt(),
      ),
    )
    ..registerFactory<LocationRepository>(
      () => LocationRepositoryImpl(
        locationDataSource: getIt(),
      ),
    )

    // Datasource
    ..registerFactory<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(
        networkClient: getIt(),
      ),
    )
    ..registerFactory<LocationDataSource>(
      () => LocationDataSourceImpl(
        locationClient: getIt(),
      ),
    )

    // Core
    ..registerLazySingleton(
      () => NetworkClient(
        dio: getIt(),
        baseUrl: Env.baseUrl,
      ),
    )
    ..registerFactory(() => Dio())
    ..registerFactory(() => LocationClient());
}
