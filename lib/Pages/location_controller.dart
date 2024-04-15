import 'package:flut/Pages/weather_service.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  static LocationController get to => Get.find();

  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _weatherDescription = ''.obs;

  double get latitude => _latitude.value;
  double get longitude => _longitude.value;
  String get weatherDescription => _weatherDescription.value;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      await getWeather(
          _latitude.value, _longitude.value); // Call without static access
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> getWeather(double lat, double long) async {
    try {
      String? description = await WeatherService()
          .getWeatherDescription(lat, long); // Call non-static method
      if (description != null) {
        _weatherDescription.value = description;
      }
    } catch (e) {
      print('Error getting weather: $e');
    }
  }
}
