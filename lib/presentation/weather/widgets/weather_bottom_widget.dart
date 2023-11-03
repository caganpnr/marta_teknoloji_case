import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/theme/app_theme.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_tile_divider_widget.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_tile_widget.dart';

class WeatherBottom extends StatelessWidget {
  const WeatherBottom({super.key, required this.weatherEntity});

  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WeatherTile("Wind Speed", '${weatherEntity.current.windKph} kph'),
            const SizedBox(width: 10),
            const WeatherTileDivider(),
            const SizedBox(width: 10),
            WeatherTile("Wind Direction", weatherEntity.current.windDir),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WeatherTile("UV Index", '${weatherEntity.current.uv.floor()}'),
            const SizedBox(width: 10),
            const WeatherTileDivider(),
            const SizedBox(width: 10),
            WeatherTile("Visibility", '${weatherEntity.current.visKm} km'),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          "Last Updated:\n",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 5,
            fontSize: 17,
            color: AppTheme.lightTheme.primaryColorDark,
          ),
        ),
        Text(
          weatherEntity.current.lastUpdated,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
            fontSize: 17,
            color: AppTheme.lightTheme.primaryColorDark,
          ),
        ),
      ],
    );
  }
}
