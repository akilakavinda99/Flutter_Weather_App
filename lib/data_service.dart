import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/models.dart';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
class DataService{
  Future<WeatherResponse> getWeather(String city) async{
    final queryParametres = {'q': city, 'appid':'6f99327e83af4a3272ed1ab8b174894e','units':'metric'};
    // base url,path,query
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParametres);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
