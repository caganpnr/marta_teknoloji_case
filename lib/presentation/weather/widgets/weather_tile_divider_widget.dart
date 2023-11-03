import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/theme/app_theme.dart';

class WeatherTileDivider extends StatelessWidget {
  const WeatherTileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: 1,
        height: 30,
        color: AppTheme.lightTheme.dividerColor,
      ),
    );
  }
}
