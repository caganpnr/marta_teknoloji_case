import 'package:marta_teknoloji_case/app/enums/view_state.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_weather_usecase.dart';
import 'package:stacked/stacked.dart';

class WeatherViewModel extends BaseViewModel {
  WeatherViewModel({required UCGetWeather ucGetWeather, required this.lat, required this.long})
      : _ucGetWeather = ucGetWeather;

  final UCGetWeather _ucGetWeather;
  final double lat;
  final double long;

  // State variables
  Failure? failure;
  WeatherEntity? weatherEntity;
  ViewState viewState = ViewState.loading;

  Future<void> getWeatherData() async {
    viewState = ViewState.loading;
    notifyListeners();
    final response = await _ucGetWeather.call(lat: lat, long: long);

    response.fold(
      (failure) {
        viewState = ViewState.failure;
        this.failure = failure;
      },
      (weatherEntity) {
        viewState = ViewState.success;
        this.weatherEntity = weatherEntity;
      },
    );
    notifyListeners();
  }
}
