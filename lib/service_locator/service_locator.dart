import 'package:get_it/get_it.dart';
import 'package:weatherapp/data/store/weather_store.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<WeatherStore>(WeatherStore());
}
