import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:collection/collection.dart";
import 'package:shorten_my_shower/IoT_page.dart';
import 'package:shorten_my_shower/estimation_page.dart';
import 'package:shorten_my_shower/landing_page.dart';
import 'package:shorten_my_shower/nav.dart';
import 'package:shorten_my_shower/product_page.dart';
import 'package:shorten_my_shower/timer_page.dart';
import 'package:shorten_my_shower/tips_page.dart';

void main() async {
  var _allDeviceInfo = await fetchIoTDeviceData(http.Client());

  var _allRecordsInfo = await fetchIoTRecordData(http.Client());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'Shorten My Shower',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/password',
      routes: {
        '/': (context) => LandingPage(),
        '/timer': (context) => BodyTimerPage(),
        '/password': (context) => PasswordPage(),
        '/estimation': (context) => EstimationPage(),
        '/iot': (context) => IoTPage(),
        '/adddevice': (context) => AddDevicePage(),
        '/ratedproducts': (context) => RatedProductPage(),
        '/tips': (context) => KnowledgeCardPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
