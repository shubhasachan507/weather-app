import 'package:mobx/mobx.dart';
import 'package:weatherapp/data/api/fetch_weather.dart';
import 'package:weatherapp/data/model/weather.dart';

class WeatherStore with Store {
  final Observable<ObservableFuture<Weather>?> weatherResponse =
      Observable(null);
  final Observable<String?> weatherError = Observable(null);

  @action
  Future<void> getWeatherData(String city) async {
    try {
      final response = await fetchWeatherData(city);
      runInAction(
        () {
          weatherResponse.value = ObservableFuture.value(response);
          weatherError.value = null;
        },
      );
    } catch (error) {
      runInAction(
        () => weatherError.value = error.toString(),
      );
    }
  }
}
