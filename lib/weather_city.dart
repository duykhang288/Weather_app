import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_appnlcntt/weatherModel.dart';

class WeatherData {
  Future<Weather> getDataCity(var cityname) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=d9269ec5b5164777804143240230305&q=$cityname&days=8&aqi=no&alerts=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
