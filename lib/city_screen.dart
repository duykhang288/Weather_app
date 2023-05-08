import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_appnlcntt/getLocation.dart';
import 'package:weather_appnlcntt/weather_city.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'getLocation.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

var dayInfo = DateTime.now();
var dayFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class CityScreen extends StatelessWidget {
  CityScreen({super.key});
  WeatherData client = WeatherData();
  final user = FirebaseAuth.instance.currentUser!;
  var data1;
  var data2;
  var data3;
  var data4;
  var data5;
  var data6;
  info(var location1) async {
    data1 = await client.getDataCity(location1);

    return data1;
  }

  info1(var location1) async {
    data2 = await client.getDataCity(location1);

    return data2;
  }

  info2(var location1) async {
    data3 = await client.getDataCity(location1);

    return data3;
  }

  info3(var location1) async {
    data4 = await client.getDataCity(location1);

    return data4;
  }

  info4(var location1) async {
    data5 = await client.getDataCity(location1);

    return data5;
  }

  info5(var location1) async {
    data6 = await client.getDataCity(location1);

    return data6;
  }

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/bg1.jpg"), // <-- BACKGROUND IMAGE
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/bg1.jpg"), // <-- BACKGROUND IMAGE
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FutureBuilder(
                    future: info('Ho Chi Minh'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 50),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${data1?.city}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.027 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.030 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data1?.condition}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(179, 34, 34, 34),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0.025 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data1?.temp} ' 'º',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      'https:${data1?.icon}',
                                      fit: BoxFit.fill,
                                      height: 0.1 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ],
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
                FutureBuilder(
                    future: info1('Can Tho'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 50),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${data2?.city}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.027 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.030 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data2?.condition}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(179, 34, 34, 34),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0.025 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data2?.temp} ' 'º',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      'https:${data2?.icon}',
                                      fit: BoxFit.fill,
                                      height: 0.1 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ],
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
                FutureBuilder(
                    future: info2('Ha noi'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 50),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${data3?.city}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.027 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.030 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data3?.condition}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(179, 34, 34, 34),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0.025 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data3?.temp} ' 'º',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      'https:${data3?.icon}',
                                      fit: BoxFit.fill,
                                      height: 0.1 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ],
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
                FutureBuilder(
                    future: info3('Da nang'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 50),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${data4?.city}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.027 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.030 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data4?.condition}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(179, 34, 34, 34),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0.025 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data4?.temp} ' 'º',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      'https:${data4?.icon}',
                                      fit: BoxFit.fill,
                                      height: 0.1 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ],
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
                FutureBuilder(
                    future: info4('Hai Phong'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 50),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${data5?.city}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.027 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.030 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data5?.condition}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(179, 34, 34, 34),
                                          fontSize: 0.010 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0.025 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data5?.temp} ' 'º',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      'https:${data5?.icon}',
                                      fit: BoxFit.fill,
                                      height: 0.1 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ],
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
                FutureBuilder(
                    future: info5('Soc Trang'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 50),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${data6?.city}',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.027 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.030 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data6?.condition}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(179, 34, 34, 34),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0.025 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      '${data6?.temp} ' 'º',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 90, 90, 90)
                                              .withOpacity(0.9),
                                          fontSize: 0.030 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.network(
                                      'https:${data6?.icon}',
                                      fit: BoxFit.fill,
                                      height: 0.1 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ],
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
              ],
            ),
          )));
}
