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

class EstimationPage extends StatefulWidget {
  @override
  _EstimationPageState createState() => _EstimationPageState();
}

class _EstimationPageState extends State<EstimationPage> {
  int _peopleValue = 1;
  int _showerHeadValue = 1;
  int _showerTimesValue = 1;
  int _showerAvgMinutesValue = 5;

  bool? _showerIsWEValue = true;
  int _bathValue = 0;
  int _toiletValue = 1;

  bool? _toiletIsWEValue = true;

  double _showerWEWaterFlowPerMinute = 6.9;

  double _showerWaterFlowPerMinute = 15.4;
  double _bathWaterFlowPerTime = 14.0;

  double _toiletWEWaterFlowPerDay = 18.9;
  double _toiletWaterFlowPerDay = 21.5;

  double _dailyWaterLiters = 0;

  List<Icon> _peopleIcons() {
    List<Icon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < _peopleValue; i++) {
      iconslist.add(Icon(
        Icons.person,
        color: Colors.blue[300],
      ));
    }
    return iconslist;
  }

  List<Icon> _showerheadIcons() {
    List<Icon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < _showerHeadValue; i++) {
      iconslist.add(Icon(
        Icons.shower,
        color: Colors.blue[300],
      ));
    }
    return iconslist;
  }

  List<Icon> _threeStarsRatingsIcons() {
    List<Icon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < 3; i++) {
      iconslist.add(Icon(
        Icons.star,
        color: Colors.blue[300],
      ));
    }
    return iconslist;
  }

  List<Icon> _bathIcons() {
    List<Icon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < _bathValue; i++) {
      iconslist.add(Icon(
        Icons.bathtub,
        color: Colors.blue[300],
      ));
    }
    if (_bathValue == 0) {
      iconslist.add(Icon(
        Icons.bathtub,
        color: Colors.white,
      ));
    }
    return iconslist;
  }

  List<ImageIcon> _showerIcons() {
    List<ImageIcon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < _showerTimesValue; i++) {
      iconslist.add(
        ImageIcon(
          AssetImage("images/shower.png"),
          color: Colors.blue[300],
        ),
      );
    }

    return iconslist;
  }

  List<ImageIcon> _toiletIcons() {
    List<ImageIcon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < _toiletValue; i++) {
      iconslist.add(
        ImageIcon(
          AssetImage("images/toilet.png"),
          color: Colors.blue[300],
        ),
      );
    }

    return iconslist;
  }

  List<ImageIcon> _dualFlushIcons() {
    List<ImageIcon> iconslist = [];
    //

    // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
    for (int i = 0; i < 1; i++) {
      iconslist.add(
        ImageIcon(
          AssetImage("images/flushdual.png"),
          color: Colors.blue[300],
        ),
      );
    }

    return iconslist;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Estimate',
        ),
        toolbarHeight: 150,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          width: size.width * 5 / 6,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(38.0),
                    child: FittedBox(
                      child: Center(
                        child: Text('Estimation Inputs',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _peopleIcons()),
                    ),
                  ),
                  Text('People living in your home : $_peopleValue ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  //  Text('$_peopleValue people living in your home'),
                  Slider(
                      value: _peopleValue.toDouble(),
                      min: 1.0,
                      max: 12.0,
                      divisions: 11,
                      activeColor: Colors.blue[200],
                      inactiveColor: Colors.black,
                      label: 'Choose number of people living in your home',
                      onChanged: (double newValue) {
                        setState(() {
                          _peopleValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      })
                ],
              ),
              //
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _showerheadIcons(),
                      ),
                    ),
                  ),
                  Text('Showerheads in your home : $_showerHeadValue ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  Slider(
                      value: _showerHeadValue.toDouble(),
                      min: 1.0,
                      max: 12.0,
                      divisions: 11,
                      activeColor: Colors.blue[200],
                      inactiveColor: Colors.black,
                      label: 'Choose number of showerheads in your home',
                      onChanged: (double newValue) {
                        setState(() {
                          _showerHeadValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      })
                ],
              ),
              //
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _threeStarsRatingsIcons(),
                    ),
                  ),
                ),
                Text(
                    'All showerheads are water efficient with 3 stars rating : $_showerIsWEValue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
                Checkbox(
                  value: this._showerIsWEValue,
                  onChanged: (bool? value) {
                    setState(() {
                      this._showerIsWEValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 12.0,
                )
              ]),

              //
              //
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _showerIcons(),
                      ),
                    ),
                  ),
                  Text('How many showers taken per day : $_showerTimesValue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  Slider(
                      value: _showerTimesValue.toDouble(),
                      min: 1.0,
                      max: 10.0,
                      divisions: 9,
                      activeColor: Colors.blue[200],
                      inactiveColor: Colors.black,
                      label: 'Choose number of showers per day',
                      onChanged: (double newValue) {
                        setState(() {
                          _showerTimesValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      })
                ],
              ),
              //
              //
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${_showerAvgMinutesValue} Minutes',
                                style: TextStyle(
                                  color: Colors.blue[300],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                    ),
                  ),
                  Text(
                      'How many minutes on average per shower : $_showerAvgMinutesValue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  Slider(
                      value: _showerAvgMinutesValue.toDouble(),
                      min: 1.0,
                      max: 60.0,
                      divisions: 59,
                      activeColor: Colors.blue[200],
                      inactiveColor: Colors.black,
                      label: 'Choose average minutes per shower',
                      onChanged: (double newValue) {
                        setState(() {
                          _showerAvgMinutesValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      })
                ],
              ),
              //
              //
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _bathIcons(),
                      ),
                    ),
                  ),
                  Text(
                      'How many times you having a bath per week : $_bathValue ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  Slider(
                      value: _bathValue.toDouble(),
                      min: 0.0,
                      max: 14.0,
                      divisions: 14,
                      activeColor: Colors.blue[200],
                      inactiveColor: Colors.black,
                      label: 'Choose number of bath per week',
                      onChanged: (double newValue) {
                        setState(() {
                          _bathValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      })
                ],
              ),
              //
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _toiletIcons(),
                      ),
                    ),
                  ),
                  Text('How many toilet in your house : $_toiletValue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  Slider(
                      value: _toiletValue.toDouble(),
                      min: 1.0,
                      max: 10.0,
                      divisions: 9,
                      activeColor: Colors.blue[200],
                      inactiveColor: Colors.black,
                      label: 'Choose number of toilet in your house',
                      onChanged: (double newValue) {
                        setState(() {
                          _toiletValue = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      })
                ],
              ),
              //
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _dualFlushIcons(),
                    ),
                  ),
                ),
                Text('All toilet are dual flush : $_toiletIsWEValue ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
                Checkbox(
                  value: this._toiletIsWEValue,
                  onChanged: (bool? value) {
                    setState(() {
                      this._toiletIsWEValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 12.0,
                ) //Chec
              ]),

              //

              ElevatedButton(
                  onPressed: () {
                    print("estimate");
                    print(
                        "$_peopleValue, $_showerHeadValue ,$_showerIsWEValue, $_bathValue, $_toiletValue, $_toiletIsWEValue,");
                    if (_showerIsWEValue! && _toiletIsWEValue!) {
                      _dailyWaterLiters = _peopleValue *
                          (_showerHeadValue *
                                  _showerWEWaterFlowPerMinute *
                                  _showerTimesValue *
                                  _showerAvgMinutesValue +
                              _bathValue * _bathWaterFlowPerTime +
                              _toiletValue * _toiletWEWaterFlowPerDay);
                    }
                    if (!_showerIsWEValue! && _toiletIsWEValue!) {
                      _dailyWaterLiters = _peopleValue *
                          (_showerHeadValue *
                                  _showerWaterFlowPerMinute *
                                  _showerTimesValue *
                                  _showerAvgMinutesValue +
                              _bathValue * _bathWaterFlowPerTime +
                              _toiletValue * _toiletWEWaterFlowPerDay);
                    }
                    if (_showerIsWEValue! && !_toiletIsWEValue!) {
                      _dailyWaterLiters = _peopleValue *
                          (_showerHeadValue *
                                  _showerWEWaterFlowPerMinute *
                                  _showerTimesValue *
                                  _showerAvgMinutesValue +
                              _bathValue * _bathWaterFlowPerTime +
                              _toiletValue * _toiletWaterFlowPerDay);
                    }
                    if (!_showerIsWEValue! && !_toiletIsWEValue!) {
                      _dailyWaterLiters = _peopleValue *
                          (_showerHeadValue *
                                  _showerWaterFlowPerMinute *
                                  _showerTimesValue *
                                  _showerAvgMinutesValue +
                              _bathValue * _bathWaterFlowPerTime +
                              _toiletValue * _toiletWaterFlowPerDay);
                    }

                    print(_dailyWaterLiters);
                    setState(() {
                      _dailyWaterLiters = _dailyWaterLiters;
                    });
                    // send it to other screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EstimationDetailScreen(
                          estimatedAmount: _dailyWaterLiters,
                          npeople: _peopleValue,
                        ),
                      ),
                    );
                  },
                  child: Text('Estimate')),
              SizedBox(
                height: 20.0,
              )
              // Container(
              //   child: Text('${_dailyWaterLiters}'),
              // )
            ],
          ),
        ),
      )),
    );
  }
}

class EstimationDetailScreen extends StatefulWidget {
  final double estimatedAmount;
  final int npeople;

  const EstimationDetailScreen(
      {Key? key, required this.estimatedAmount, required this.npeople})
      : super(key: key);
  @override
  _EstimationDetailScreenState createState() => _EstimationDetailScreenState();
}

class _EstimationDetailScreenState extends State<EstimationDetailScreen> {
  bool showCoffee = true;
  bool showAdult = true;
  bool showTree = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Estimate',
        ),
        toolbarHeight: 150,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                // color: Colors.blue,

                width: size.width * 5 / 6,
                color: Colors.blue[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: FittedBox(
                        child: Center(
                          child: Text('Estimation Report',
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Your estimated water usage is about',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                            '${widget.estimatedAmount.toStringAsFixed(2)} liters per day',
                            style: TextStyle(
                                fontSize: 26, color: Colors.blue[500])),
                      ),
                    ),
                    widget.estimatedAmount > 155 * widget.npeople
                        ? Column(
                            children: [
                              Text('You can do better in saving water.',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red)),
                              Icon(
                                Icons.mood_bad,
                                color: Colors.red,
                                size: 80,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Text('You did a great job on saving water !',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green)),
                              Icon(
                                Icons.mood,
                                color: Colors.green,
                                size: 80,
                              ),
                            ],
                          ),
                    Container(
                      child: Center(
                          child: Text('Did you know it could be equal to',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black))),
                    ),
                    showCoffee
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showCoffee = !showCoffee;
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 180,
                                  child: Icon(
                                    Icons.coffee_rounded,
                                    color: Colors.blue[500],
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showCoffee = !showCoffee;
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  // color: Colors.white,
                                  child: Center(
                                    child: Text(
                                        '${(widget.estimatedAmount * 33.814 / 8).round()} cups of coffee',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue[500])),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    showAdult
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAdult = !showAdult;
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 180,
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.blue[500],
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAdult = !showAdult;
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  // color: Colors.white,
                                  child: Center(
                                    child: Text(
                                        '${(widget.estimatedAmount * 1 / 62).round()} adult human in 62kg',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue[500])),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    showTree
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showTree = !showTree;
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 180,
                                  child: Icon(
                                    Icons.forest,
                                    color: Colors.blue[500],
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showTree = !showTree;
                                  });
                                },
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  // color: Colors.white,
                                  child: Center(
                                    child: Text(
                                        '${(widget.estimatedAmount / 3).round()} sq m covered by trees ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue[500])),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/estimation');
                            },
                            child: Text("Estimate again")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/iot');
                            },
                            child: Text("Measure by IoT"))
                      ],
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
