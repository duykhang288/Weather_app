import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_appnlcntt/city_screen.dart';
import 'package:weather_appnlcntt/main.dart';
import 'package:weather_appnlcntt/profile.dart';
import 'package:weather_appnlcntt/setting_screen.dart';
import 'package:weather_appnlcntt/weatherModel.dart';
import 'package:weather_appnlcntt/weather_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    WeatherScreen(),
    ProfileScreen(),
    CityScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'City',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_rounded),
              label: 'Setting',
            ),
          ],
        ),
      );
}
