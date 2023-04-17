import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.75,
              width: size.width,
              padding: EdgeInsets.only(top: 70),
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff955cd1),
                    Color(0xff3fa2fa),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.85],
                ),
              ),
              child: Column(children: [
                Text(
                  'Constantite',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 35,
                      fontFamily: 'Roboto'),
                ),
                Text(
                  'MonDay,03,21 Mars',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 15,
                      fontFamily: 'Roboto'),
                ),
                Image.asset(
                  'assets/images/cloudy.png',
                  width: size.width * 0.4,
                ),
                Text(
                  'Sunny',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '15',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto'),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Image.asset(
                          'assets/images/snowfall.png',
                          width: size.width * 0.15,
                        )
                      ],
                    ))
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
