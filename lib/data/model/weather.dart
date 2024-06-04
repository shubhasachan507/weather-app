import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  SunPosition? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  Weather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable()
class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@JsonSerializable()
class WeatherData {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherData({this.id, this.main, this.description, this.icon});
  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@JsonSerializable()
class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@JsonSerializable()
class Clouds {
  int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
class SunPosition {
  String? country;
  int? sunrise;
  int? sunset;

  SunPosition({this.country, this.sunrise, this.sunset});

  factory SunPosition.fromJson(Map<String, dynamic> json) =>
      _$SunPositionFromJson(json);
}
