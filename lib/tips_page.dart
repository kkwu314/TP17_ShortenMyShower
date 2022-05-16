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
///
///
class KnowledgeCardPage extends StatefulWidget {
  @override
  _KnowledgeCardPageState createState() => _KnowledgeCardPageState();
}

bool showTips_1 = false;
bool showTips_2 = false;
bool showTips_3 = false;
bool showTips_4 = false;
bool showTips_5 = false;

double _selectedWaterLabelValue = 4.0;

bool showLabel_0 = false;
bool showLabel_1 = false;
bool showLabel_2 = false;
bool showLabel_3 = false;
bool showLabel_4 = false;
bool showLabel_5 = false;
bool showLabel_6 = false;
bool showLabel_7 = false;

bool ishoverTop = false;

bool ishoverMid = false;

bool ishoverBot = false;

List<Widget> _waterLabelIcons() {
  List<Widget> iconslist = [];
  //

  // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
  if (_selectedWaterLabelValue != 7) {
    if (_selectedWaterLabelValue != 0) {
      for (int i = 0; i < _selectedWaterLabelValue; i++) {
        iconslist.add(Container(
            child: Icon(
              Icons.star,
              color: Colors.white,
            ),
            color: Colors.blue[300]));
      }
      var remainvalue = 6 - _selectedWaterLabelValue;
      for (int i = 0; i < remainvalue; i++) {
        iconslist.add(Container(
            child: Icon(
              Icons.star_border,
              color: Colors.blue[300],
            ),
            color: Colors.white));
      }
    } else {
      for (int i = 0; i < 6; i++) {
        iconslist.add(Container(
            child: Icon(
              Icons.star_border,
              color: Colors.blue[300],
            ),
            color: Colors.white));
      }
    }
  } else {
    iconslist.add(
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Text('Showing all in one',
            style: TextStyle(fontSize: 20, color: Colors.blue[500])),
      ),
    );
  }
  return iconslist;
}

class _KnowledgeCardPageState extends State<KnowledgeCardPage> {
  @override
  Widget build(BuildContext context) {
    void _checkWaterLabelValue(double inputValue) {
      // for (int i = 0; i < duration.inMinutes.remainder(60); i++) {
      if (inputValue == 0) {
        setState(() {
          showLabel_0 = true;
          showLabel_1 = false;
          showLabel_2 = false;
          showLabel_3 = false;
          showLabel_4 = false;
          showLabel_5 = false;
          showLabel_6 = false;
          showLabel_7 = false;
        });
      }
      if (inputValue == 1) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = true;
          showLabel_2 = false;
          showLabel_3 = false;
          showLabel_4 = false;
          showLabel_5 = false;
          showLabel_6 = false;
          showLabel_7 = false;
        });
      }
      if (inputValue == 2) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = false;
          showLabel_2 = true;
          showLabel_3 = false;
          showLabel_4 = false;
          showLabel_5 = false;
          showLabel_6 = false;
          showLabel_7 = false;
        });
      }

      if (inputValue == 3) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = false;
          showLabel_2 = false;
          showLabel_3 = true;
          showLabel_4 = false;
          showLabel_5 = false;
          showLabel_6 = false;
          showLabel_7 = false;
        });
      }
      if (inputValue == 4) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = false;
          showLabel_2 = false;
          showLabel_3 = false;
          showLabel_4 = true;
          showLabel_5 = false;
          showLabel_6 = false;
          showLabel_7 = false;
        });
      }
      if (inputValue == 5) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = false;
          showLabel_2 = false;
          showLabel_3 = false;
          showLabel_4 = false;
          showLabel_5 = true;
          showLabel_6 = false;
          showLabel_7 = false;
        });
      }
      if (inputValue == 6) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = false;
          showLabel_2 = false;
          showLabel_3 = false;
          showLabel_4 = false;
          showLabel_5 = false;
          showLabel_6 = true;
          showLabel_7 = false;
        });
      }
      if (inputValue == 7) {
        setState(() {
          showLabel_0 = false;
          showLabel_1 = false;
          showLabel_2 = false;
          showLabel_3 = false;
          showLabel_4 = false;
          showLabel_5 = false;
          showLabel_6 = false;
          showLabel_7 = true;
        });
      }
    }

    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/adddevice');
      //   },
      //   label: const Text('Add Devices'),
      //   icon: const Icon(Icons.add),
      //   backgroundColor: Colors.blue[300],
      // ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Tips',
        ),
        toolbarHeight: 150,
      ),
      body: //
          SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('How to read water label',
                      style: TextStyle(fontSize: 30, color: Colors.blue[500])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Water Efficiency Labelling and Standards',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // mid
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ishoverTop
                                    ? Column(
                                        children: [
                                          Text(
                                            'Star Rating',
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                color: Colors.blue[300]),
                                          ),
                                          Container(
                                            width: 350,
                                            child: Text(
                                              'The Water Efficiency Labelling and Standards (WELS) scheme is designed to help you make informed choices about the water efficiency of products.',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.blue[500],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                            'Star Rating',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          Container(
                                            width: 350,
                                            child: Text(
                                              'The Water Efficiency Labelling and Standards (WELS) scheme is designed to help you make informed choices about the water efficiency of products.',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ishoverMid
                                  ? Column(
                                      children: [
                                        Text(
                                          'Rate of Water Consumption',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.blue[300]),
                                        ),
                                        Container(
                                          width: 350,
                                          child: Text(
                                            'At the top of the WELS star rating allows you quickly compare the water efficiency of different products. The label with more stars, the greater the water efficiency.',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.blue[500],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          'Rate of Water Consumption',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Container(
                                          width: 350,
                                          child: Text(
                                            'At the top of the WELS star rating allows you quickly compare the water efficiency of different products. The label with more stars, the greater the water efficiency.',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            //

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ishoverBot
                                  ? Column(
                                      children: [
                                        Text(
                                          'Registration and product details',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.blue[300]),
                                        ),
                                        Container(
                                          width: 350,
                                          child: Text(
                                            'The bottom section includes the license number and registration number.',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.blue[500],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          'Registration and product details',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Container(
                                          width: 350,
                                          child: Text(
                                            'The bottom section includes the license number and registration number.',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            //

                            //
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: 350,
                                child: Text(
                                  'For further information about the water rating system, see waterrating.gov.au.',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              width:
                                  233, //there should be outline/dimensions for the box.
                              //Otherway, You can use positioned widget
                              duration: Duration(milliseconds: 200),

                              child: InkWell(
                                onTap: () {},
                                child: Image.asset('images/waterlabeltop.jpg'),
                                onHover: (val) {
                                  setState(() {
                                    ishoverTop = val;
                                  });
                                },
                              ),
                            ),
                            AnimatedContainer(
                              width:
                                  230, //there should be outline/dimensions for the box.
                              //Otherway, You can use positioned widget
                              duration: Duration(milliseconds: 200),

                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                    'images/waterlabelmidshowersortaps.jpg'),
                                onHover: (val) {
                                  setState(() {
                                    ishoverMid = val;
                                  });
                                },
                              ),
                            ),
                            AnimatedContainer(
                              width:
                                  230, //there should be outline/dimensions for the box.
                              //Otherway, You can use positioned widget
                              duration: Duration(milliseconds: 200),

                              child: InkWell(
                                onTap: () {},
                                child:
                                    Image.asset('images/waterlabelbottom.jpg'),
                                onHover: (val) {
                                  setState(() {
                                    ishoverBot = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              ],
            ),
/////
            ///
            ///
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 500,
                child: Column(
                  children: [
                    //
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Did you know how much water uses for those stars ?',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blue[500])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _waterLabelIcons()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Slide to check stars meaning',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blue[500])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(' 0 '),
                          Text(' 1 '),
                          Text(' 2 '),
                          Text(' 3 '),
                          Text(' 4 '),
                          Text(' 5 '),
                          Text(' 6 '),
                          Text('All ')
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Slider(
                          value: _selectedWaterLabelValue.toDouble(),
                          min: 0.0,
                          max: 7.0,
                          divisions: 7,
                          activeColor: Colors.blue[200],
                          inactiveColor: Colors.black,
                          label:
                              '${_selectedWaterLabelValue.toDouble() == 7 ? "Show all" : _selectedWaterLabelValue.toDouble()} stars',
                          onChanged: (double newValue) {
                            setState(() {
                              _selectedWaterLabelValue =
                                  newValue.round().toDouble();
                            });
                            _checkWaterLabelValue(_selectedWaterLabelValue);
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue.round()}';
                          }),
                    ),

                    showLabel_0
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '0 stars products consume more than 16 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),
                    showLabel_1
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '1 stars products consume 12 to 16 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),

                    showLabel_2
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '2 stars products consume 9 to 12 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),

                    showLabel_3
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '3 stars products consume 7.5 to 9 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),

                    showLabel_4
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '4 stars products consume 6 to 7.5 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),

                    showLabel_5
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '5 stars products consume 4.5 to 6 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),
                    showLabel_6
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '6 stars products consume less than 4.5 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),

                    showLabel_7
                        ? Column(
                            children: [
                              Container(
                                child: Text(
                                    '0 stars products consume more than 16 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                child: Text(
                                    '1 stars products consume 12 to 16 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                child: Text(
                                    '2 stars products consume 9 to 12 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                child: Text(
                                    '3 stars products consume 7.5 to 9 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                child: Text(
                                    '4 stars products consume 6 to 7.5 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                child: Text(
                                    '5 stars products consume 4.5 to 6 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                child: Text(
                                    '6 stars products consume less than 4.5 liters of water per minute.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ],
                          )
                        : Container(),

                    //////
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.blue[800],
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ratedproducts');
                  },
                  child: const Text("Explore more water efficiency products")),
            ),

            ///
            ///
            SizedBox(
              height: 30.0,
            ),
            //
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Tips for saving water in bathroom',
                  style: TextStyle(fontSize: 30, color: Colors.blue[500])),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // icon column
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showTips_1 = !showTips_1;
                              });
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                child: Image.asset('images/water_love.jpg')),
                          ),
                          Container(
                            child: showTips_1
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 300,
                                          // color: Colors.white,
                                          child: Center(
                                            child: Text(
                                                'Fill the bathtub only halfway when you take a bath. This minimizes the overflow of bathtub water.',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue[500])),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showTips_2 = !showTips_2;
                              });
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                child: Image.asset('images/water_stars.jpg')),
                          ),
                          Container(
                            child: showTips_2
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 300,
                                          // color: Colors.white,
                                          child: Center(
                                            child: Text(
                                                'Install Water-Saving Shower Heads. A water-saving shower head can restricts the volume of water that it allows to flow through it, thereby reducing the amount of water used in the shower.',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue[500])),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showTips_3 = !showTips_3;
                              });
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                child: Image.asset('images/water_strong.jpg')),
                          ),
                          Container(
                            child: showTips_3
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 300,
                                          // color: Colors.white,
                                          child: Center(
                                            child: Text(
                                                'Turn off the tap in time. For example, Turn off the water while brushing your teeth or shaving to keep excess water from going down the drain.',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue[500])),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showTips_4 = !showTips_4;
                              });
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                child: Image.asset('images/water_glass.jpg')),
                          ),
                          Container(
                            child: showTips_4
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 300,
                                          // color: Colors.white,
                                          child: Center(
                                            child: Text(
                                                'Collect cold water in a bucket. When you turn on the water in the shower and wait for it to get hot, place a bucket in the shower during this time and use the collected water to clean the bathroom or water plants.',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue[500])),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showTips_5 = !showTips_5;
                              });
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                child: Image.asset('images/water_bye.jpg')),
                          ),
                          Container(
                            child: showTips_5
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 300,
                                          // color: Colors.white,
                                          child: Center(
                                            child: Text(
                                                'Take showers, not baths.',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue[500])),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),

            //
          ],
        ),
      ),
    );
  }
}
