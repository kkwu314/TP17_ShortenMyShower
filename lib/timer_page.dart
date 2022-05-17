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
import 'package:shorten_my_shower/nav.dart';

///

// this about timer page and all elements and logic in that page
// modify via searching keywords

///
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/estimation');
        },
        label: const Text('Try to Estimate'),
        icon: const Icon(Icons.calculate_rounded),
        backgroundColor: Colors.blue[300],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Timer',
        ),
        toolbarHeight: 150,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: size.height * 5 / 6,
              width: size.width * 5 / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[100],
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // buildIcons(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Shower Timer',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 10.0),
                                child: Text(
                                  "Simply click on start before shower and come back to check your report with one of lovely water drops indicator.",
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "assets/images/water_love.jpg",
                                            width: 150,
                                            height: 150,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "assets/images/water_stars.jpg",
                                            width: 150,
                                            height: 150,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "assets/images/water_cry.jpg",
                                            width: 150,
                                            height: 150,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/shower_background.jpg"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(children: [
                                    Container(
                                      height: 60,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 50, child: buildButtons()),
                                        Container(
                                            height: 50, child: buildReset()),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            )

                            // buildTimerData(duration.inSeconds.toString()),
                            //

                            //
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimerData(String timedata) {
    return Text(timedata);
  }

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

                      //post shower record to db
                      postRecord(duration.inSeconds);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowerReport(
                            minutes:
                                duration.inMinutes.remainder(60).toString(),
                            seconds:
                                duration.inSeconds.remainder(60).toString(),
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

class ShowerReport extends StatefulWidget {
  final minutes;
  final seconds;
  // <= 4 great
  // > 4 <= 7 better than average
  // over 7

  const ShowerReport({
    Key? key,
    this.minutes,
    this.seconds,
  }) : super(key: key);

  @override
  State<ShowerReport> createState() => _ShowerReportState();
}

class _ShowerReportState extends State<ShowerReport> {
  var _selected = "All";

  @override
  void initState() {
    super.initState();
  }

  void setSelected(String selectedState) {
    setState(() {
      _selected = selectedState;
    });
    print(_selected);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isGood = int.parse(widget.minutes) < 4;
    var isAverage =
        int.parse(widget.minutes) >= 4 && int.parse(widget.minutes) <= 7;
    var isOver = int.parse(widget.minutes) > 7;
    // var isGood = int.parse(seconds) < 4;
    // var isAverage = int.parse(seconds) >= 4 && int.parse(seconds) <= 7;
    // var isOver = int.parse(seconds) > 7;

    var isVIC = _selected == "VIC";
    var isNSW = _selected == "NSW";
    var isQLD = _selected == "QLD";
    var isNT = _selected == "NT";

    var isWA = _selected == "WA";
    var isSA = _selected == "SA";
    var isACT = _selected == "ACT";
    var isTAS = _selected == "TAS";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Timer',
        ),
        toolbarHeight: 150,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Shower Report',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        // height: size.height * 4 / 6,
                        // width: size.width * 5 / 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[200],
                        ),
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          isGood
                              ? Container(
                                  child: Image.asset(
                                    "assets/images/water_love.jpg",
                                    width: 150,
                                    height: 150,
                                  ),
                                )
                              : isAverage
                                  ? Container(
                                      child: Image.asset(
                                        "assets/images/water_stars.jpg",
                                        width: 150,
                                        height: 150,
                                      ),
                                    )
                                  : Container(
                                      child: Image.asset(
                                        "assets/images/water_cry.jpg",
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                          SizedBox(
                            height: 5,
                          ),
                          FittedBox(
                            child: isGood
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Legend ! \nYour shower time is ${widget.minutes} minutes ${widget.seconds} seconds, \nwithin 4 minutes target.",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                  )
                                : isAverage
                                    ? Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Superstar ! \nYour shower time is ${widget.minutes} minutes ${widget.seconds} seconds, \nshorter than average.",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "No stress! \nYour shower time is ${widget.minutes} minutes ${widget.seconds} seconds, \nTry faster on the next shower.",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      ),
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_down,
                            color: Colors.blue[500],
                            size: 50,
                          ),
                          FittedBox(
                              child: Column(
                            children: [
                              isVIC
                                  ? FittedBox(
                                      child: FutureBuilder<List<WaterData>>(
                                        future: fetchWaterData(http.Client()),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return const Center(
                                              child: Text(
                                                  'An error has occurred!'),
                                            );
                                          } else if (snapshot.hasData) {
                                            return WaterDataList(
                                                waterdata: snapshot.data!,
                                                timerdata: widget.minutes,
                                                selected: "VIC");
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                                    )
                                  : isNSW
                                      ? FittedBox(
                                          child: FutureBuilder<List<WaterData>>(
                                            future:
                                                fetchWaterData(http.Client()),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasError) {
                                                return const Center(
                                                  child: Text(
                                                      'An error has occurred!'),
                                                );
                                              } else if (snapshot.hasData) {
                                                return WaterDataList(
                                                    waterdata: snapshot.data!,
                                                    timerdata: widget.minutes,
                                                    selected: "NSW");
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            },
                                          ),
                                        )
                                      : isQLD
                                          ? FittedBox(
                                              child: FutureBuilder<
                                                  List<WaterData>>(
                                                future: fetchWaterData(
                                                    http.Client()),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasError) {
                                                    return const Center(
                                                      child: Text(
                                                          'An error has occurred!'),
                                                    );
                                                  } else if (snapshot.hasData) {
                                                    return WaterDataList(
                                                        waterdata:
                                                            snapshot.data!,
                                                        timerdata:
                                                            widget.minutes,
                                                        selected: "QLD");
                                                  } else {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              ),
                                            )
                                          : isSA
                                              ? FittedBox(
                                                  child: FutureBuilder<
                                                      List<WaterData>>(
                                                    future: fetchWaterData(
                                                        http.Client()),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasError) {
                                                        return const Center(
                                                          child: Text(
                                                              'An error has occurred!'),
                                                        );
                                                      } else if (snapshot
                                                          .hasData) {
                                                        return WaterDataList(
                                                            waterdata:
                                                                snapshot.data!,
                                                            timerdata:
                                                                widget.minutes,
                                                            selected: "SA");
                                                      } else {
                                                        return const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                )
                                              : isWA
                                                  ? FittedBox(
                                                      child: FutureBuilder<
                                                          List<WaterData>>(
                                                        future: fetchWaterData(
                                                            http.Client()),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                              .hasError) {
                                                            return const Center(
                                                              child: Text(
                                                                  'An error has occurred!'),
                                                            );
                                                          } else if (snapshot
                                                              .hasData) {
                                                            return WaterDataList(
                                                                waterdata:
                                                                    snapshot
                                                                        .data!,
                                                                timerdata: widget
                                                                    .minutes,
                                                                selected: "WA");
                                                          } else {
                                                            return const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    )
                                                  : isNT
                                                      ? FittedBox(
                                                          child: FutureBuilder<
                                                              List<WaterData>>(
                                                            future: fetchWaterData(
                                                                http.Client()),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                  .hasError) {
                                                                return const Center(
                                                                  child: Text(
                                                                      'An error has occurred!'),
                                                                );
                                                              } else if (snapshot
                                                                  .hasData) {
                                                                return WaterDataList(
                                                                    waterdata:
                                                                        snapshot
                                                                            .data!,
                                                                    timerdata:
                                                                        widget
                                                                            .minutes,
                                                                    selected:
                                                                        "NT");
                                                              } else {
                                                                return const Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        )
                                                      : isACT
                                                          ? FittedBox(
                                                              child: FutureBuilder<
                                                                  List<
                                                                      WaterData>>(
                                                                future: fetchWaterData(
                                                                    http.Client()),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                      .hasError) {
                                                                    return const Center(
                                                                      child: Text(
                                                                          'An error has occurred!'),
                                                                    );
                                                                  } else if (snapshot
                                                                      .hasData) {
                                                                    return WaterDataList(
                                                                        waterdata:
                                                                            snapshot
                                                                                .data!,
                                                                        timerdata:
                                                                            widget
                                                                                .minutes,
                                                                        selected:
                                                                            "ACT");
                                                                  } else {
                                                                    return const Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            )
                                                          : isTAS
                                                              ? FittedBox(
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          WaterData>>(
                                                                    future: fetchWaterData(
                                                                        http.Client()),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      if (snapshot
                                                                          .hasError) {
                                                                        return const Center(
                                                                          child:
                                                                              Text('An error has occurred!'),
                                                                        );
                                                                      } else if (snapshot
                                                                          .hasData) {
                                                                        return WaterDataList(
                                                                            waterdata:
                                                                                snapshot.data!,
                                                                            timerdata: widget.minutes,
                                                                            selected: "TAS");
                                                                      } else {
                                                                        return const Center(
                                                                          child:
                                                                              CircularProgressIndicator(),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                )
                                                              : FittedBox(
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          WaterData>>(
                                                                    future: fetchWaterData(
                                                                        http.Client()),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      if (snapshot
                                                                          .hasError) {
                                                                        return const Center(
                                                                          child:
                                                                              Text('An error has occurred!'),
                                                                        );
                                                                      } else if (snapshot
                                                                          .hasData) {
                                                                        return WaterDataList(
                                                                            waterdata:
                                                                                snapshot.data!,
                                                                            timerdata: widget.minutes,
                                                                            selected: "ALL");
                                                                      } else {
                                                                        return const Center(
                                                                          child:
                                                                              CircularProgressIndicator(),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setSelected('ALL');
                                  },
                                  child: Text(
                                    'National Average Shower Time (Minutes)',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('VIC');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/vic.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "VIC",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('NSW');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/nsw.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "NSW",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('QLD');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/qld.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "QLD",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('SA');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/sa.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "SA",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('WA');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/wa.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "WA",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('NT');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/nt.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "NT",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('ACT');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/act.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "ACT",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setSelected('TAS');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.blue[100]),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[100],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/tas.jpg"),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "TAS",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 50)),
                              child: Text(
                                'Again',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/timer');
                              },
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/estimation');
        },
        label: const Text('Try to Estimate'),
        icon: const Icon(Icons.calculate_rounded),
        backgroundColor: Colors.blue[300],
      ),
    );
  }
}

//
// report

Future<List<WaterData>> fetchWaterData(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      // .get(Uri.parse(
      //     'https://tp17waterapiiterationone.azurewebsites.net/api/WaterDatas'));
      .get(Uri.parse('https://tp17-water.azurewebsites.net/api/WaterDatas'));
  return compute(parseWaterData, response.body);
}

// A function that converts a response body into a List<Photo>.
List<WaterData> parseWaterData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<WaterData>((json) => WaterData.fromJson(json)).toList();
}

class WaterData {
  String? year;
  int? newSouthWales;
  int? victoria;
  int? queensland;
  int? southAustralia;
  int? westernAustralia;
  int? tasmania;
  int? northernTerritory;
  int? australianCapitalTerritory;

  WaterData(
      {this.year,
      this.newSouthWales,
      this.victoria,
      this.queensland,
      this.southAustralia,
      this.westernAustralia,
      this.tasmania,
      this.northernTerritory,
      this.australianCapitalTerritory});

  WaterData.fromJson(Map<String, dynamic> json) {
    year = json['Year'];
    newSouthWales = json['newSouthWales'];
    victoria = json['victoria'];
    queensland = json['queensland'];
    southAustralia = json['southAustralia'];
    westernAustralia = json['westernAustralia'];
    tasmania = json['tasmania'];
    northernTerritory = json['northernTerritory'];
    australianCapitalTerritory = json['australianCapitalTerritory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['newSouthWales'] = this.newSouthWales;
    data['victoria'] = this.victoria;
    data['queensland'] = this.queensland;
    data['southAustralia'] = this.southAustralia;
    data['westernAustralia'] = this.westernAustralia;
    data['tasmania'] = this.tasmania;
    data['northernTerritory'] = this.northernTerritory;
    data['australianCapitalTerritory'] = this.australianCapitalTerritory;
    return data;
  }
}

//post shower record to database
class ShowerRecord {
  int showerTime;
  DateTime recordDate;
  int? userId;

  ShowerRecord(
      {required this.showerTime, required this.recordDate, this.userId});

  Map<String, dynamic> toJson() => {
        "showerTime": showerTime,
        "recordDate": recordDate.toIso8601String(),
        "userId": userId
      };
}

Future<bool> postRecord(int seconds) async {
  // TODO: check if the user is logged in. For logged in users, record their user id
  var record = new ShowerRecord(showerTime: seconds, recordDate: DateTime.now())
      .toJson();
  var recordBody = json.encode(record);
  var res = await http.post(
      // Uri.parse('https://tp17-api.azurewebsites.net/api/showerrecords'),
      // Uri.parse(
      //     'https://tp17waterapi20220412011238.azurewebsites.net/api/showerrecords'),
      // Uri.parse(
      //     'https://tp17waterapiiterationone.azurewebsites.net/api/showerrecords'),
      Uri.parse('https://tp17-water.azurewebsites.net/api/ShowerRecords'),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: recordBody);
  print(recordBody);

  return Future.value(res.statusCode == 201 ? true : false);
}

class WaterDataList extends StatelessWidget {
  const WaterDataList({
    Key? key,
    required this.waterdata,
    required this.timerdata,
    required this.selected,
  }) : super(key: key);

  final List<WaterData> waterdata;
  final String timerdata;
  final String selected;
  @override
  Widget build(BuildContext context) {
    List vicList = [];
    List nswList = [];
    List qldList = [];
    List saList = [];
    List waList = [];
    List tasList = [];
    List ntList = [];
    List actList = [];
    List allList = [];
    for (var i = 0; i < waterdata.length; i++) {
      vicList.add(waterdata[i].victoria);
      nswList.add(waterdata[i].newSouthWales);
      qldList.add(waterdata[i].queensland);
      saList.add(waterdata[i].southAustralia);
      waList.add(waterdata[i].westernAustralia);
      tasList.add(waterdata[i].tasmania);
      ntList.add(waterdata[i].northernTerritory);
      actList.add(waterdata[i].australianCapitalTerritory);

      allList.add(waterdata[i].victoria);
      allList.add(waterdata[i].newSouthWales);
      allList.add(waterdata[i].queensland);
      allList.add(waterdata[i].southAustralia);
      allList.add(waterdata[i].westernAustralia);
      allList.add(waterdata[i].tasmania);
      allList.add(waterdata[i].northernTerritory);
      allList.add(waterdata[i].australianCapitalTerritory);
    }

    int allInt = ((allList.reduce((a, b) => a + b) / allList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();

    int vicInt = ((vicList.reduce((a, b) => a + b) / vicList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();
    int qldInt = ((qldList.reduce((a, b) => a + b) / qldList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();
    int nswInt = ((nswList.reduce((a, b) => a + b) / nswList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();

    int saInt = ((saList.reduce((a, b) => a + b) / saList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();
    int waInt = ((waList.reduce((a, b) => a + b) / waList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();
    int tasInt = ((tasList.reduce((a, b) => a + b) / tasList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();
    int ntInt = ((ntList.reduce((a, b) => a + b) / ntList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();
    int actInt = ((actList.reduce((a, b) => a + b) / actList.length) *
            1000 /
            365 *
            0.3 /
            12)
        .round();

    return FittedBox(
      child: Column(
        children: [
          // buildIcons(allInt, nswInt, qldInt, vicInt, waInt, saInt, tasInt,
          //     ntInt, actInt),
          Row(
            children: [
              Container(
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(
                                      int.parse(timerdata), selected, "Yours"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("Your's"),
                    Text(timerdata),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(allInt, selected, "ALL"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("Mean"),
                    Text(allInt.toString()),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(nswInt, selected, "NSW"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("NSW"),
                    Text(nswInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(qldInt, selected, "QLD"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("QLD"),
                    Text(qldInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(vicInt, selected, "VIC"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("VIC"),
                    Text(vicInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(waInt, selected, "WA"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("WA"),
                    Text(waInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(saInt, selected, "SA"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("SA"),
                    Text(saInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(tasInt, selected, "TAS"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("TAS"),
                    Text(tasInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(ntInt, selected, "NT"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("NT"),
                    Text(ntInt.toString()),
                  ],
                ),
              ),
              Container(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _maxwaterTime(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 1,
                              runSpacing: 1,
                              children: <Widget>[
                                Column(
                                  children: _waterTime(actInt, selected, "ACT"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("ACT"),
                    Text(actInt.toString()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Icon> _waterTime(count, inputSelected, correctColumn) {
  List<Icon> stars = [];
  if (inputSelected == correctColumn) {
    for (int i = 0; i < count; i++) {
      stars.add(Icon(
        Icons.water_drop,
        color: Colors.blue[500],
        size: 10,
      ));
    }
  } else {
    for (int i = 0; i < count; i++) {
      stars.add(Icon(
        Icons.water_drop,
        color: Colors.blue[300],
        size: 10,
      ));
    }
  }
  return stars;
}

List<Icon> _maxwaterTime() {
  List<Icon> stars = [];

  for (int i = 0; i < 60; i++) {
    stars.add(Icon(
      Icons.water_drop,
      color: Colors.blue[200],
      size: 10,
    ));
  }
  return stars;
}
