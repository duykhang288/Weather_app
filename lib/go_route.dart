import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:weather_appnlcntt/mainpage.dart';
import 'package:weather_appnlcntt/setting_screen.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: '/setting',
    builder: (context, state) => SettingScreen(),
  )
]);
