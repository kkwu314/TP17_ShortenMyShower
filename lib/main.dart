import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shorten_my_shower/constant.dart';
import 'package:shorten_my_shower/controllers/menu_controller.dart';
import 'package:shorten_my_shower/controllers/navigation_controller.dart';
import 'package:shorten_my_shower/pages/home/home_page.dart';
import 'package:shorten_my_shower/pages/timer/timer_page.dart';

void main() {
  // Get.put(MenuController());
  // Get.put(NavigationController());
  // Get.lazyPut(() => MenuController());
  // Get.lazyPut(() => NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shorten My Shower',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        // textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme).apply(
        //   bodyColor: Colors.black,
        // ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: TimerPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/timer': (context) => TimerPage(),
      },
    );
  }
}
