import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/constants.dart';

import 'package:weatherapp/data/model/weather.dart';

String key = dotenv.env['API_KEY'] ?? '';

Future<Weather> fetchWeatherData(String cityName) async {
  final uri = Uri.parse(AppStrings.baseUrl).replace(
    queryParameters: {
      'q': cityName,
      'appid': key,
      'units': 'metric',
    },
  );
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Weather.fromJson(jsonResponse);
    } else {
      throw Exception("Not able to fetch weather");
    }
  } catch (error) {
    if (error is SocketException) {
      throw Exception('No Internet Connection. Please try again later.');
    } else {
      throw Exception("Not able to fetch weather");
    }
  }
}
