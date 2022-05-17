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

///

// this about navigation bar and all elements and logic in that page
// modify via searching keywords

///
class HomeNav extends StatelessWidget {
  HomeNav({
    required this.onPage,
    Key? key,
  }) : super(key: key);
  final String onPage;

  bool isHome = false;
  bool isTimer = false;
  bool isEstimation = false;
  bool isIoT = false;
  bool isTips = false;
  bool isProduct = false;

  @override
  Widget build(BuildContext context) {
    if (onPage == 'Home') {
      isHome = true;
    }
    if (onPage == 'Timer') {
      isTimer = true;
    }
    if (onPage == 'Estimate') {
      isEstimation = true;
    }
    if (onPage == 'IoT') {
      isIoT = true;
    }
    if (onPage == 'Tips') {
      isTips = true;
    }
    if (onPage == 'Product') {
      isProduct = true;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 200,
      color: Colors.blue[100],
      child: FittedBox(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 10,
                        ),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 100,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
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
                    ],
                  ),
                ],
              ),
              SizedBox(width: 80),
              //
              Row(
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: isHome
                                ? Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : Text(
                                    "Home",
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/timer');
                            },
                            child: isTimer
                                ? Text(
                                    "Shower Timer",
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : Text(
                                    "Shower Timer",
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/estimation');
                            },
                            child: isEstimation
                                ? Text(
                                    "Usage Estimation",
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : Text(
                                    "Usage Estimation",
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/iot');
                            },
                            child: isIoT
                                ? Text(
                                    "IoT",
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : Text(
                                    "IoT",
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/tips');
                            },
                            child: isTips
                                ? Text(
                                    "Tips",
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : Text(
                                    "Tips",
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/ratedproducts');
                            },
                            child: isProduct
                                ? Text(
                                    "Rated Product",
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                    ),
                                  )
                                : Text(
                                    "Rated Product",
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
