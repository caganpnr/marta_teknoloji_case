import 'package:json_annotation/json_annotation.dart';
import 'package:marta_teknoloji_case/domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  LocationModel? location;
  CurrentModel? current;

  WeatherModel({this.location, this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  WeatherEntity toEntity() {
    return WeatherEntity(
      location: location != null ? location!.toEntity() : LocationEntity(),
      current: current != null ? current!.toEntity() : CurrentEntity(),
    );
  }
}

@JsonSerializable()
class LocationModel {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  @JsonKey(name: "tz_id")
  final String? tzId;
  @JsonKey(name: "localtime_epoch")
  final int? localtimeEpoch;
  final String? localtime;

  LocationModel(
      {this.name, this.region, this.country, this.lat, this.lon, this.tzId, this.localtimeEpoch, this.localtime});

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  LocationEntity toEntity() {
    return LocationEntity(
      name: name ?? '',
      region: region ?? '',
      country: country ?? '',
      lat: lat ?? 0.0,
      lon: lon ?? 0.0,
      tzId: tzId ?? '',
      localtimeEpoch: localtimeEpoch ?? 0,
      localtime: localtime ?? '',
    );
  }
}

@JsonSerializable()
class CurrentModel {
  @JsonKey(name: "last_updated_epoch")
  final int? lastUpdatedEpoch;
  @JsonKey(name: "last_updated")
  final String? lastUpdated;
  @JsonKey(name: "temp_c")
  final double? tempC;
  @JsonKey(name: "temp_f")
  final double? tempF;
  @JsonKey(name: "is_day")
  final int? isDay;
  final ConditionModel? condition;
  @JsonKey(name: "wind_mph")
  final double? windMph;
  @JsonKey(name: "wind_kph")
  final double? windKph;
  @JsonKey(name: "wind_degree")
  final int? windDegree;
  @JsonKey(name: "wind_dir")
  final String? windDir;
  @JsonKey(name: "pressure_mb")
  final double? pressureMb;
  @JsonKey(name: "pressure_in")
  final double? pressureIn;
  @JsonKey(name: "precip_mm")
  final double? precipMm;
  @JsonKey(name: "precip_in")
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: "feelslike_c")
  final double? feelslikeC;
  @JsonKey(name: "feelslike_f")
  final double? feelslikeF;
  @JsonKey(name: "vis_km")
  final double? visKm;
  @JsonKey(name: "vis_miles")
  final double? visMiles;
  final double? uv;
  @JsonKey(name: "gus_mph")
  final double? gustMph;
  @JsonKey(name: "gus_kph")
  final double? gustKph;

  CurrentModel(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  factory CurrentModel.fromJson(Map<String, dynamic> json) => _$CurrentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);

  CurrentEntity toEntity() {
    return CurrentEntity(
      lastUpdatedEpoch: lastUpdatedEpoch ?? 0,
      lastUpdated: lastUpdated ?? '',
      tempC: tempC ?? 0.0,
      tempF: tempF ?? 0.0,
      isDay: isDay ?? 0,
      condition: condition != null ? condition!.toEntity() : const ConditionEntity(),
      windMph: windMph ?? 0.0,
      windKph: windKph ?? 0.0,
      windDegree: windDegree ?? 0,
      windDir: windDir ?? '',
      pressureMb: pressureMb ?? 0.0,
      pressureIn: pressureIn ?? 0.0,
      precipMm: precipMm ?? 0.0,
      precipIn: precipIn ?? 0.0,
      humidity: humidity ?? 0,
      cloud: cloud ?? 0,
      feelslikeC: feelslikeC ?? 0.0,
      feelslikeF: feelslikeF ?? 0.0,
      visKm: visKm ?? 0.0,
      visMiles: visMiles ?? 0.0,
      uv: uv ?? 0.0,
      gustMph: gustMph ?? 0.0,
      gustKph: gustKph ?? 0.0,
    );
  }
}

@JsonSerializable()
class ConditionModel {
  final String? text;
  final String? icon;
  final int? code;

  ConditionModel({this.text, this.icon, this.code});

  factory ConditionModel.fromJson(Map<String, dynamic> json) => _$ConditionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);

  ConditionEntity toEntity() {
    return ConditionEntity(
      text: text ?? '',
      icon: icon ?? '',
      code: code ?? 0,
    );
  }
}
