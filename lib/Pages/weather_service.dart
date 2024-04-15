import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static const String apiKey = 'YOUR_API_KEY'; // Replace with your API key

  Future<String?> getWeatherDescription(double lat, double long) async {
    var apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      return weatherData['weather'][0]['description'];
    } else {
      print('Error fetching weather data');
      return null;
    }
  }
}
