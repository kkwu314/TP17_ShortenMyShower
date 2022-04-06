import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shorten My Shower',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/timer': (context) => BodyTimerPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[300],
        title: HomeNav(),
        toolbarHeight: 180,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 640,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Column(
                            children: [
                              Text(
                                "Water in \n        Australia".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " abcdfefaoiefjaoifjaojfai \n abcdfefaoiefjaoifjaojfai ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 50,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Icon(
              Icons.arrow_downward,
              size: 60,
              color: Colors.blue[300],
            ),
            //
            WaterStats(),
            //
            FittedBox(
              // height: 300,
              // color: Colors.blue[100],
              // width: 1200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // picture
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "1 ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/water_strong.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 300,
                                    // color: Colors.orange[300],
                                    child: Row(
                                      children: [
                                        Text(
                                          "The aim is 155 Litres \nper person per day",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            "2 ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/water_stars.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 300,
                                    // color: Colors.orange[300],
                                    child: Row(
                                      children: [
                                        Text(
                                          "By shorten shower time  \nunder 4 Minutes",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "3 ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/water_money.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 300,
                                    //color: Colors.orange[600],
                                    child: Row(
                                      children: [
                                        Text(
                                          "Estimate to save \n200 AUD per year",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "4 ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/water_love.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 300,
                                    //color: Colors.orange[100],
                                    child: Row(
                                      children: [
                                        Text(
                                          "Reduce about 359 kg CO2 \nGHG emissions per year",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //
                    ],
                  ),

                  //
                ],
              ),
            )
          ],
        ),
      ),

      //),
    );
  }
}

class WaterStats extends StatelessWidget {
  const WaterStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      // height: 300,
      // color: Colors.blue[100],
      // width: 1200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // picture
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/water_strong.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text(
                      "155 Litres",
                      style: TextStyle(color: Colors.black87, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.water_drop,
                      color: Colors.blue[400],
                      size: 100,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/water_stars.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      width: 300,
                      // color: Colors.orange[300],
                      child: Column(
                        children: [
                          Text(
                            "4 Minutes",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 40),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.timer,
                            color: Colors.blue[400],
                            size: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/water_money.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      width: 300,
                      //color: Colors.orange[600],
                      child: Column(
                        children: [
                          Text(
                            "200 Aud",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 40),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.attach_money_rounded,
                            color: Colors.blue[400],
                            size: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/water_love.jpg"),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      width: 300,
                      //color: Colors.orange[100],
                      child: Column(
                        children: [
                          Text(
                            "359 Kg",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 40),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.co2,
                            size: 100,
                            color: Colors.blue[400],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),

          //
        ],
      ),
    );
  }
}

class HomeNav extends StatelessWidget {
  const HomeNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/background.jpg"),
      //     fit: BoxFit.fitWidth,
      //   ),
      // ),
      color: Colors.blue[100],
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 100,
                alignment: Alignment.topCenter,
              ),
              const SizedBox(width: 5),
              Text(
                "Shorten My Shower".toUpperCase(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  //color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        //
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text("Home")),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/timer');
                  },
                  child: const Text("Time")),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  child: const Text("Estimation")),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  child: const Text("Refletion")),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  child: const Text("Login")),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        )
      ]),
    );
  }
}

class BodyTimerPage extends StatefulWidget {
  const BodyTimerPage({Key? key}) : super(key: key);

  @override
  _BodyTimerPageState createState() => _BodyTimerPageState();
}

class _BodyTimerPageState extends State<BodyTimerPage> {
  //
  Duration duration = Duration();
  Timer? timer;
  List<Widget> _reportList = [];
  bool isShown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
    reset();
  }

  void reset() {
    setState(() {
      duration = Duration();
      timer?.cancel();
    });
  }

  void addTime() {
    final addSecond = 1;
    setState(() {
      final second = duration.inSeconds + addSecond;

      if (second > 3600) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: second);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    setState(() {
      timer?.cancel();
    });
  }

  void setShowReport() {
    setState(() {
      isShown = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[300],
        title: HomeNav(),
        toolbarHeight: 180,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.blue[100],
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Column(
                children: [
                  // buildIcons(),

                  Container(
                    height: 60,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _starsForRatings()),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  buildTime(),
                  SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 50, child: buildButtons()),
                      Container(height: 50, child: buildReset()),
                    ],
                  ),

                  buildTimerData(duration.inSeconds.toString()),
                  //

                  //
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildTimerData(String timedata) {
    return Text(timedata);
  }

  // Widget buildReport() {
  //   return ElevatedButton(
  //     child: Text("Get A report"),
  //     onPressed: () {
  //       // navigate to new page and pass the record time
  //       print('${duration.inSeconds} second passing to report');
  //     },
  //   );
  // }

  //
  List<Icon> _starsForRatings() {
    List<Icon> stars = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < duration.inSeconds.remainder(4); i++) {
      stars.add(Icon(
        Icons.water_drop,
        color: Colors.blue[300],
        size: 80,
      ));
    }
    return stars;
  }

  // Widget buildIcons() {
  //   final isRunning = timer == null ? false : timer!.isActive;
  //   final isCompleted = duration.inSeconds == 0;

  //   return isRunning || !isCompleted
  //       // ? Image.asset('images/icons8-rain.gif', width: 60.0, height: 60.0)
  //       ? null
  //       : Container(
  //           width: 60,
  //           height: 60,
  //           child: Icon(
  //             Icons.cloud,
  //             size: 50,
  //           ),
  //         );
  // }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return !isRunning && isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(120, 120)),
                child: Text(
                  "Start",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
                onPressed: () {
                  startTimer();
                },
              ),
            ],
          )
        : isRunning && !isCompleted
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(120, 120)),
                    child: Text(
                      "Stop",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                    onPressed: () {
                      stopTimer(resets: false);
                    },
                  ),
                ],
              )
            : Row();
    // : ElevatedButton(
    //     child: Text(
    //       "Reset",
    //       style: TextStyle(color: Colors.redAccent),
    //     ),
    //     onPressed: () {
    //       reset();
    //     },
    //   );
  }

  Widget buildReset() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return !isRunning
        ? isCompleted
            ? Row()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(100, 100)),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          color: Colors.red[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      reset();
                    },
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(120, 120)),
                    child: Text(
                      "Get a report",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      // navigate to new page and pass the record time
                      print('${duration.inSeconds} second passing to report');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowerReport(
                            minutes: duration.inMinutes.toString(),
                            seconds: duration.inSeconds.toString(),
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
        : Row();
  }

  //
  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));

    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: minutes, header: "Minutes"),
        const SizedBox(
          width: 8.0,
        ),
        buildTimeCard(time: seconds, header: "Seconds"),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 24.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 72.0,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            header,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowerReport extends StatelessWidget {
  final minutes;
  final seconds;

  const ShowerReport({Key? key, this.minutes, this.seconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[300],
        title: HomeNav(),
        toolbarHeight: 180,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 500,
              height: 500,
              color: Colors.blue[200],
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Shower Time Report',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    "images/water_stars.jpg",
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your this shower time is ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "${minutes} minutes ${seconds} seconds",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Your are super shower star !",
                  style: TextStyle(fontSize: 20),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
