import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/theme/app_theme.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_tile_divider_widget.dart';
import 'package:marta_teknoloji_case/presentation/weather/widgets/weather_tile_widget.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({super.key, required this.weatherEntity});
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          weatherEntity.location.name.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 5,
            color: AppTheme.lightTheme.primaryColor,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          weatherEntity.current.condition.text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
            fontSize: 17,
            color: AppTheme.lightTheme.primaryColorDark,
          ),
        ),
        Image(
          image: NetworkImage("https:${weatherEntity.current.condition.icon}"),
          height: 100,
          width: 100,
        ),
        Text(
          '${weatherEntity.current.tempC}°',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkTheme.primaryColorLight,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WeatherTile("Feels Like", '${weatherEntity.current.feelslikeC}°'),
            const WeatherTileDivider(),
            WeatherTile("Humidity", '${weatherEntity.current.humidity}%'),
          ],
        ),
      ],
    );
  }
}
