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

// this about landing page and all elements and logic in that page
// modify via searching keywords

///
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Home',
        ),
        toolbarHeight: 150,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 640,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                image: DecorationImage(
                  image: AssetImage("assets/images/shower_background.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/landing_picture.jpg"),
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
                                "Shorten my \n             shower"
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Saving water for Australia \n ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Adult Generation Z (18-25) in Victoria \ncares about water conservation \nbut does not have good water habits. \n\nThis project aim to improve the awareness of saving water \nvia developing a 4 minutes shower habit. ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                size: 40,
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

            SizedBox(
              height: 18,
            ),
            Divider(),
            FittedBox(
              child: Row(
                children: [
                  Text(
                    "Introduction",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),

            Container(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: Text(
                  "Have you paid attention to your water usage? It is not just the number on the water bill. In addition to saving money, saving water can also contribute to the energy conservation and emission reduction of the earth. The easier way is to shorten your shower time as the shower takes up about 31% of household water usage based on stats. So let's start our water-saving journey by knowing some key statistics. The most important one is to shower in 4 minutes.",
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),

            FittedBox(
              child: Row(
                children: [
                  Text(
                    "Start journey by using one of toolkit",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            FittedBox(
              child: Row(
                children: [
                  Container(
                    width: 160,
                    // color: Colors.amber[300],
                    child: Column(
                      children: [
                        FittedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.blue[100]!.withOpacity(0.6),
                            ),
                            child: Text(
                              "Timer",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            child: Text(
                              "Time your shower with a lovely timer, a cute water drop will encourage you to reach 4 minutes target based on your reported time.",
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                hoverColor: Colors.blue.withOpacity(.10),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/timer');
                                },
                                icon: Icon(
                                  Icons.timer,
                                ),
                                iconSize: 60,
                                color: Colors.blue[300],
                              ),
                              Text(
                                "Start timing!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    // color: Colors.amber[100],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blue[200]!.withOpacity(0.6),
                          ),
                          child: Text(
                            "Estimation",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            child: Text(
                              "Estimating water usage by inputting base facilities information and get a better awareness of water.",
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),

                        //
                        //
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                hoverColor: Colors.blue.withOpacity(.10),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/estimation');
                                },
                                icon: Icon(Icons.calculate_rounded),
                                iconSize: 60,
                                color: Colors.blue[300],
                              ),
                              Text(
                                "Start estimating!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    // color: Colors.amber[100],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blue[300]!.withOpacity(0.6),
                          ),
                          child: Text(
                            "IoT",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            child: Text(
                              "Connect to IoT devices to keep track of your usage of water to get more accurate data and see where water used.",
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),

                        //
                        //
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                hoverColor: Colors.blue.withOpacity(.10),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/iot');
                                },
                                icon: Icon(
                                  Icons.device_hub,
                                ),
                                iconSize: 60,
                                color: Colors.blue[300],
                              ),
                              Text(
                                "Connect to IoT!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  //
                  Container(
                    width: 160,
                    // color: Colors.amber[100],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blue[400]!.withOpacity(0.6),
                          ),
                          child: Text(
                            "Tips",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            child: Text(
                              "Learn how to read water efficiency label and standards and check out some tips for saving water in bathroom.",
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),

                        //
                        //
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                hoverColor: Colors.blue.withOpacity(.10),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/tips');
                                },
                                icon: Icon(
                                  Icons.tips_and_updates,
                                ),
                                iconSize: 60,
                                color: Colors.blue[300],
                              ),
                              Text(
                                "Get some tips!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    // color: Colors.amber[100],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blue[500]!.withOpacity(0.6),
                          ),
                          child: Text(
                            "Products",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            child: Text(
                              "Find out some brands with top water rated taps or showerheads, replace with a stared product to saving more water.",
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: TextStyle(
                                  // fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),

                        //
                        //
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                hoverColor: Colors.blue.withOpacity(.10),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/ratedproducts');
                                },
                                icon: Icon(
                                  Icons.recommend,
                                ),
                                iconSize: 60,
                                color: Colors.blue[300],
                              ),
                              Text(
                                "Explore it!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            // Icon(
            //   Icons.arrow_downward,
            //   size: 60,
            //   color: Colors.blue[300],
            // ),
            //

            SizedBox(
              height: 15,
            ),

            FittedBox(
              child: Row(
                children: [
                  Text(
                    "To achieve the following goals",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: WaterStats(),
              ),
            ),
            //
            Divider(),

            SizedBox(
              height: 15,
            ),

            FittedBox(
              child: Row(
                children: [
                  Text(
                    "Get a better understanding of the goals",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            FittedBox(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListOfPros(),
                ),
              ),
            )),

            // FittedBox(child: Row(children: [

            // ]),)
            // //

            SizedBox(height: 30),

            //
          ],
        ),
      ),

      //),
    );
  }
}

//

//

class ListOfPros extends StatelessWidget {
  const ListOfPros({
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
                                      color: Colors.black87, fontSize: 20),
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
                                image:
                                    AssetImage("assets/images/water_stars.jpg"),
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
                                      color: Colors.black87, fontSize: 20),
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
                                image:
                                    AssetImage("assets/images/water_money.jpg"),
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
                                      color: Colors.black87, fontSize: 20),
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
                                image:
                                    AssetImage("assets/images/water_love.jpg"),
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
                                      color: Colors.black87, fontSize: 20),
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
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
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
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
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
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
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
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
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

//

//
class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String accountName = '';
  String accountPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(20),
          child: TextField(
            controller: accountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Account Name',
            ),
            onChanged: (text) {
              setState(() {
                accountName = text;
                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )),
      Container(
          margin: EdgeInsets.all(20),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            onChanged: (text) {
              setState(() {
                accountPassword = text;
                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )),
      // Container(
      //   margin: EdgeInsets.all(20),
      //   child: Column(children: [
      //     Text(accountName),
      //     Text(accountPassword),
      //   ]),
      // ),
      ElevatedButton(
          onPressed: () {
            if (accountName == "ShortenMyShower" &&
                accountPassword == "Lucky17") {
              print("going to landing page");
              Navigator.pushNamed(context, '/');
            } else {
              print("Try again");

              Navigator.pushNamed(context, '/password');
            }
          },
          child: Text("Visit"))
    ])));
  }
}
