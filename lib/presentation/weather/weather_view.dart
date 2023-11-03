import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marta_teknoloji_case/app/enums/view_state.dart';
import 'package:marta_teknoloji_case/app/widget/custom_error_widget.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_weather_usecase.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_success_widget.dart';
import 'package:stacked/stacked.dart';

import 'weather_viewmodel.dart';

class WeatherView extends StackedView<WeatherViewModel> {
  const WeatherView({super.key, required this.lat, required this.long});

  final double lat;
  final double long;

  @override
  Widget builder(
    BuildContext context,
    WeatherViewModel viewModel,
    Widget? child,
  ) {
    final weatherEntity = viewModel.weatherEntity;

    return Scaffold(
        body: switch (viewModel.viewState) {
      ViewState.loading => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ViewState.failure => Center(
          child: CustomErrorWidget(
            failure: viewModel.failure!,
            onPressed: () => viewModel.getWeatherData(),
          ),
        ),
      ViewState.success => Center(
          child: WeatherSuccessWidget(weatherEntity: weatherEntity!),
        )
    });
  }

  @override
  WeatherViewModel viewModelBuilder(BuildContext context) {
    return WeatherViewModel(
      lat: lat,
      long: long,
      ucGetWeather: GetIt.instance<UCGetWeather>(),
    )..getWeatherData();
  }
}
