import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_launcher_icons/utils.dart';
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
    printStatus(position.longitude.toString());
    printStatus(position.latitude.toString());
    data = await client.getData(position.longitude, position.latitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fem = MediaQuery.of(context).size.width;
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
          body: FutureBuilder(
              future: info(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * 1,
                        width: MediaQuery.of(context).size.width * 1,
                        padding: const EdgeInsets.only(top: 50),
                        margin:
                            const EdgeInsets.only(right: 10, left: 10, top: 50),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 235, 235)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(75, 145, 145, 145),
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Color.fromRGBO(255, 255, 255, 0.313),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
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
                                color: Color.fromARGB(255, 90, 90, 90)
                                    .withOpacity(0.9),
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
                                color: Color.fromARGB(179, 34, 34, 34),
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
                                fontSize:
                                    0.1 * MediaQuery.of(context).size.height,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Roboto'),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Last Update: ${data?.last_update} ',
                            style: const TextStyle(
                                color: Color.fromARGB(165, 58, 58, 58),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                        ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 20, right: 10, left: 10, bottom: 20),
                        padding: const EdgeInsets.only(
                            top: 10, right: 10, left: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 235, 235)
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(30),
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
                                  '${data?.humidity} %',
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
                      ),
                      SizedBox(
                          height: 170,
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond1}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd1} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day1 ?? '2023-05-08')),
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
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond2}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd2} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day2 ?? '2023-05-08')),
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
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond3}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd3} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day3 ?? '2023-05-08')),
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
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond4}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd4} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day4 ?? '2023-05-08')),
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
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond5}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd5} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day5 ?? '2023-05-08')),
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
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond6}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd6} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day6 ?? '22023-05-08')),
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
                              Container(
                                  width: 130,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 10, right: 10),
                                  padding: EdgeInsets.only(
                                      top: 13, bottom: 13, left: 13, right: 13),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 235, 235, 235)
                                        .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https:${data?.icond7}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${data?.tempd7} º',
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
                                        DateFormat('EEEE').format(
                                            DateTime.parse(
                                                data?.day7 ?? '2023-05-08')),
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
                          )),
                    ],
                  ));
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
