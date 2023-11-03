// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/presentation/startup/startup_view.dart' as _i2;
import 'package:marta_teknoloji_case/presentation/weather/weather_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const startupView = '/';

  static const weatherView = '/weather-view';

  static const all = <String>{
    startupView,
    weatherView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.weatherView,
      page: _i3.WeatherView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.WeatherView: (data) {
      final args = data.getArgs<WeatherViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.WeatherView(key: args.key, lat: args.lat, long: args.long),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class WeatherViewArguments {
  const WeatherViewArguments({
    this.key,
    required this.lat,
    required this.long,
  });

  final _i4.Key? key;

  final double lat;

  final double long;

  @override
  String toString() {
    return '{"key": "$key", "lat": "$lat", "long": "$long"}';
  }

  @override
  bool operator ==(covariant WeatherViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.lat == lat && other.long == long;
  }

  @override
  int get hashCode {
    return key.hashCode ^ lat.hashCode ^ long.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToWeatherView({
    _i4.Key? key,
    required double lat,
    required double long,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return navigateTo<dynamic>(Routes.weatherView,
        arguments: WeatherViewArguments(key: key, lat: lat, long: long),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithWeatherView({
    _i4.Key? key,
    required double lat,
    required double long,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return replaceWith<dynamic>(Routes.weatherView,
        arguments: WeatherViewArguments(key: key, lat: lat, long: long),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
