import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/theme/app_theme.dart';

class WeatherTile extends StatelessWidget {
  final String label;
  final String value;

  const WeatherTile(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.lightTheme.disabledColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.lightTheme.disabledColor,
          ),
        ),
      ],
    );
  }
}
