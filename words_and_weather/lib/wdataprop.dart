import 'package:weather/weather.dart';
//import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class WeatherData{
  final String areaName;
  final double cloudiness;
  final String country;
  final DateTime date;
  final double humudity;
  final double latitude;
  final double longitude;
  final double pressure;
  final double rainLast3Hours;
  final double rainLastHour;
  final double snowLast3Hours;
  final double snowLastHour;
  final DateTime sunrise;
  final DateTime sunset;
  final Temperature temperature;
  final Temperature tempMax;
  final Temperature tempMin;
  final String weatherDescription;
  final String weatherIcon;
  final String weatherMain;
  final double windDegree;
  final double windSpeed;
  final DateTime lastUpdated;

  

  WeatherData(
      {this.areaName,
      this.country,
      this.cloudiness,
      this.date,
      this.humudity,
      this.latitude,
      this.longitude,
      this.pressure,
      this.rainLast3Hours,
      this.rainLastHour,
      this.snowLast3Hours,
      this.snowLastHour,
      this.sunrise,
      this.sunset,
      this.temperature,
      this.tempMax,
      this.tempMin,
      this.weatherDescription,
      this.weatherIcon,
      this.weatherMain,
      this.windDegree,
      this.lastUpdated,
      this.windSpeed,});

  static WeatherData fromApi(Weather weatherResp) {
      final assembledWeather = weatherResp;

      return WeatherData(
        areaName: assembledWeather.areaName,
        country: assembledWeather.country,
        cloudiness: assembledWeather.cloudiness,
        date: assembledWeather.date,
        humudity: assembledWeather.humidity,
        latitude: assembledWeather.latitude,
        longitude: assembledWeather.longitude,
        pressure: assembledWeather.pressure,
        rainLast3Hours: assembledWeather.rainLast3Hours,
        rainLastHour: assembledWeather.rainLastHour,
        snowLast3Hours: assembledWeather.snowLast3Hours,
        snowLastHour: assembledWeather.snowLastHour,
        sunrise: assembledWeather.sunrise,
        sunset: assembledWeather.sunset,
        temperature: assembledWeather.temperature,
        tempMax: assembledWeather.tempMax,
        tempMin: assembledWeather.tempMin,
        weatherDescription: assembledWeather.weatherDescription,
        weatherIcon: assembledWeather.weatherIcon,
        windDegree: assembledWeather.windDegree,
        windSpeed: assembledWeather.windSpeed,
        weatherMain: assembledWeather.weatherMain,
        lastUpdated: DateTime.now(),
      );
  }


  static WeatherCondition _mapStringToWeatherCondition(String input){
      WeatherCondition state;
      return state;
  }
}
