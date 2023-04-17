import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_appnlcntt/weatherModel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitue) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=0a6d1316c8094655add95208231704&q=$latitude,$longitue&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
