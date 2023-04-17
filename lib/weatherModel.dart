class Weather {
  var city;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;

  Weather(
      {required this.city,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.uv,
      required this.pressure,
      required this.pricipe,
      required this.last_update});
  Weather.fromJson(Map<String, dynamic> json) {
    city = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    last_update = json['current']['last_updated'];
  }
}
