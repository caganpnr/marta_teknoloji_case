import 'package:dio/dio.dart';
import 'package:marta_teknoloji_case/app/constants/app_endpoints.dart';
import 'package:marta_teknoloji_case/app/env/env.dart';
import 'package:marta_teknoloji_case/app/errors/exceptions.dart';
import 'package:marta_teknoloji_case/core/clients/network/network_client.dart';
import 'package:marta_teknoloji_case/data/model/weather_model.dart';

/// [WeatherRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [WeatherRemoteDataSource] must implement.
abstract interface class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherData({required double lat, required double long});
}

final class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;
  @override
  // Returns a [WeatherModel] from the remote API.
  Future<WeatherModel> getWeatherData({required double lat, required double long}) async {
    try {
      // Get weather data for given coordinates from API using [NetworkClient]
      final response = await _networkClient.get<Map<String, dynamic>>(AppEndpoints.getWeather, queryParameters: {
        "key": Env.apiKey,
        "q": "$lat,$long",
      });
      // If response is null or data is null, throw [NullResponseException]
      if (response.data == null || response.data == null) {
        throw NullResponseException();
      }
      final weatherData = response.data!;
      // Map the response to a  [WeatherModel]
      return WeatherModel.fromJson(weatherData);
      // Catch [DioException] and throw [DioException]
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
      // Throw [UnknownException] for any other exception
    } catch (_) {
      throw UnknownException();
    }
  }
}
