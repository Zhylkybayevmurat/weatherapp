import 'dart:convert';
import 'package:weatherapp/search.dart';

import 'package:http/http.dart' as http;

var url =
    'https://api.openweathermap.org/data/2.5/weather?q=\$city&appid=a9efde0d803152d5d9b750266a4ef315';

class CityWeatherData {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var city;

  CityWeatherData({
    required this.temp,
    required this.description,
    required this.currently,
    required this.humidity,
    required this.windSpeed,
    required this.city,
  });

  factory CityWeatherData.fromJson(Map<String, dynamic> json) {
    return CityWeatherData(
      temp: json['main']['temp'],
      description: json['weather'][0]['description'],
      currently: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      city: json['name'],
    );
  }

}

Future<CityWeatherData> fetchWeatherDataBycity() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return CityWeatherData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to fetch data.');
  }
}