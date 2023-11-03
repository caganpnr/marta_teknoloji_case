/// Domain layer data class that contains Weather data

class WeatherEntity {
  final LocationEntity location;
  final CurrentEntity current;

  WeatherEntity({
    required this.location,
    required this.current,
  });
}

class LocationEntity {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  LocationEntity({
    this.name = '',
    this.region = '',
    this.country = '',
    this.lat = 0.0,
    this.lon = 0.0,
    this.tzId = '',
    this.localtimeEpoch = 0,
    this.localtime = '',
  });
}

class CurrentEntity {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final ConditionEntity condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  CurrentEntity({
    this.lastUpdatedEpoch = 0,
    this.lastUpdated = '',
    this.tempC = 0.0,
    this.tempF = 0.0,
    this.isDay = 0,
    this.condition = const ConditionEntity(),
    this.windMph = 0.0,
    this.windKph = 0.0,
    this.windDegree = 0,
    this.windDir = '',
    this.pressureMb = 0.0,
    this.pressureIn = 0.0,
    this.precipMm = 0.0,
    this.precipIn = 0.0,
    this.humidity = 0,
    this.cloud = 0,
    this.feelslikeC = 0.0,
    this.feelslikeF = 0.0,
    this.visKm = 0.0,
    this.visMiles = 0.0,
    this.uv = 0.0,
    this.gustMph = 0.0,
    this.gustKph = 0.0,
  });
}

class ConditionEntity {
  final String text;
  final String icon;
  final int code;

  const ConditionEntity({
    this.text = '',
    this.icon = '',
    this.code = 0,
  });
}
