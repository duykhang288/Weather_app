import 'dart:convert';

class Weather {
  var city;
  var icon;
  var condition;
  var temp;
  var wind;
  var wind_dr;
  var humidity;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;
  var day1;
  var day2;
  var day3;
  var day4;
  var day5;
  var day6;
  var day7;
  var icond1;
  var icond2;
  var icond3;
  var icond4;
  var icond5;
  var icond6;
  var icond7;
  var tempd1;
  var tempd2;
  var tempd3;
  var tempd4;
  var tempd5;
  var tempd6;
  var tempd7;

  Weather({
    required this.city,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.wind_dr,
    required this.humidity,
    required this.uv,
    required this.pressure,
    required this.pricipe,
    required this.last_update,
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
    required this.icond1,
    required this.icond2,
    required this.icond3,
    required this.icond4,
    required this.icond5,
    required this.icond6,
    required this.icond7,
    required this.tempd1,
    required this.tempd2,
    required this.tempd3,
    required this.tempd4,
    required this.tempd5,
    required this.tempd6,
    required this.tempd7,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    city = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    wind_dr = json['current']['wind_dir'];
    humidity = json['current']['humidity'];
    last_update = json['current']['last_updated'];
    day1 = json['forecast']['forecastday'][1]['date'];
    day2 = json['forecast']['forecastday'][2]['date'];
    day3 = json['forecast']['forecastday'][3]['date'];
    day4 = json['forecast']['forecastday'][4]['date'];
    day5 = json['forecast']['forecastday'][5]['date'];
    day6 = json['forecast']['forecastday'][6]['date'];
    day7 = json['forecast']['forecastday'][7]['date'];
    icond1 = json['forecast']['forecastday'][1]['day']['condition']['icon'];
    icond2 = json['forecast']['forecastday'][2]['day']['condition']['icon'];
    icond3 = json['forecast']['forecastday'][3]['day']['condition']['icon'];
    icond4 = json['forecast']['forecastday'][4]['day']['condition']['icon'];
    icond5 = json['forecast']['forecastday'][5]['day']['condition']['icon'];
    icond6 = json['forecast']['forecastday'][6]['day']['condition']['icon'];
    icond7 = json['forecast']['forecastday'][7]['day']['condition']['icon'];
    tempd1 = json['forecast']['forecastday'][1]['day']['avgtemp_c'];
    tempd2 = json['forecast']['forecastday'][2]['day']['avgtemp_c'];
    tempd3 = json['forecast']['forecastday'][3]['day']['avgtemp_c'];
    tempd4 = json['forecast']['forecastday'][4]['day']['avgtemp_c'];
    tempd5 = json['forecast']['forecastday'][5]['day']['avgtemp_c'];
    tempd6 = json['forecast']['forecastday'][6]['day']['avgtemp_c'];
    tempd7 = json['forecast']['forecastday'][7]['day']['avgtemp_c'];
  }
}
