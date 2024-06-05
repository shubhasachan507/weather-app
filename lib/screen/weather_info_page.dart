import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weatherapp/index.dart';

class WeatherInfoPage extends StatefulWidget {
  const WeatherInfoPage({
    super.key,
  });

  @override
  State<WeatherInfoPage> createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = getIt<WeatherStore>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Observer(builder: (context) {
          final error = store.weatherError.value;
          final icon = store.weatherResponse.value?.value?.weather?.first.icon;
          final description =
              store.weatherResponse.value?.value?.weather?.first.description;
          final name = store.weatherResponse.value?.value?.name;
          final temp = store.weatherResponse.value?.value?.main?.temp?.toInt();
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: AppColors.background,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                SearchBar(
                  hintText: AppStrings.searchForCity,
                  controller: _searchController,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onSubmitted: (value) {
                    store.getWeatherData(_searchController.text);
                    _searchController.clear();
                  },
                  leading: const Icon(Icons.search),
                ),
                const SizedBox(
                  height: 20,
                ),
                (error == null)
                    ? WeatherInformation(
                        name: name,
                        icon: icon,
                        description: description,
                        temp: temp)
                    : ErrorView(text: error),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
