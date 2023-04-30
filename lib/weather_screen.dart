import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_appnlcntt/getLocation.dart';
import 'package:weather_appnlcntt/weather_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'getLocation.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

var dayInfo = DateTime.now();
var dayFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class WeatherScreen extends StatelessWidget {
  WeatherData client = WeatherData();
  // ignore: prefer_typing_uninitialized_variables
  final user = FirebaseAuth.instance.currentUser!;
  var data;

  WeatherScreen({super.key});

  info() async {
    var position = await GetPosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/images/bg1.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(user.email!),
            backgroundColor:
                Colors.transparent, // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0, // <-- ELEVATION ZEROED
          ),
          body: FutureBuilder(
              future: info(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * 1,
                        width: MediaQuery.of(context).size.width * 1,
                        padding: const EdgeInsets.only(top: 70),
                        margin:
                            const EdgeInsets.only(right: 10, left: 10, top: 40),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 235, 235)
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(children: [
                          Text(
                            '${data?.city}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 90, 90, 90)
                                    .withOpacity(0.9),
                                fontSize: 35,
                                fontFamily: 'Roboto'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            dayFormat,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 15,
                                fontFamily: 'Roboto'),
                          ),
                          Image.network(
                            'https:${data?.icon}',
                            fit: BoxFit.fill,
                          ),
                          Text(
                            '${data?.condition}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.temp} ' 'º',
                            style: TextStyle(
                                color: Color.fromARGB(255, 90, 90, 90)
                                    .withOpacity(0.9),
                                fontSize: 75,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Roboto'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Last Update:  ${data.last_update}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                        ]),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 50, right: 10, left: 10),
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 235, 235)
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/wind.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${data?.wind} km/h',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90)
                                        .withOpacity(0.9),
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90)
                                        .withOpacity(0.9),
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/humidity.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${data?.humidity}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90)
                                        .withOpacity(0.9),
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90)
                                        .withOpacity(0.9),
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/wind-direction.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${data?.wind_dr} ',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90)
                                        .withOpacity(0.9),
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Wind direction',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90)
                                        .withOpacity(0.9),
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      )
                    ]),
                  );
                } else {
                  return const Center(
                    child: SpinKitFadingCube(
                      color: Colors.black,
                      size: 25,
                    ),
                  );
                }
              }),
        )
      ],
    );
  }
}
