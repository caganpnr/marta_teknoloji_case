import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/theme/app_theme.dart';
import 'package:marta_teknoloji_case/core/extensions/context_extensions.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_bottom_widget.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_main_widget.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_tile_divider_widget.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_tile_widget.dart';

class WeatherSuccessWidget extends StatelessWidget {
  const WeatherSuccessWidget({required this.weatherEntity, super.key});
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WeatherMain(weatherEntity: weatherEntity),
          const SizedBox(height: 25),
          Divider(
            color: AppTheme.lightTheme.highlightColor,
            thickness: 2,
          ),
          const SizedBox(height: 25),
          WeatherBottom(
            weatherEntity: weatherEntity,
          )
        ],
      ),
    );
  }
}
