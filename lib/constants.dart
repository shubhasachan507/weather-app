import 'package:flutter/material.dart';

class AppStrings {
  static const String searchForCity = 'Search for City';
  static const String imageUrl = "https://openweathermap.org/img/wn/";
  static const String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather";
}

class AppColors {
  static const background = RadialGradient(colors: [
    Color.fromARGB(255, 224, 174, 174),
    Color.fromARGB(255, 88, 146, 204),
  ], center: Alignment.center, radius: 1);
}
