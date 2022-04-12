import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: '/password',
      routes: {
        '/': (context) => LandingPage(),
        '/timer': (context) => BodyTimerPage(),
        '/password': (context) => PasswordPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

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

//

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
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
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Adult Generation Z (18-25) in Victoria \ncares about water conservation \nbut does not have good water habits. \nWe aim to improve the awareness of saving water \nvia developing a 4 minutes shower habit. ",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black87),
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
            FittedBox(
              child: Row(
                children: [
                  Text(
                    "Introduction",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),

            // Icon(
            //   Icons.arrow_downward,
            //   size: 60,
            //   color: Colors.blue[300],
            // ),
            //
            Container(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: WaterStats(),
              ),
            ),
            //
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
            //
            FittedBox(
              child: Row(
                children: [
                  Text(
                    "Keys",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
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
                              color: Colors.blue[100]!.withOpacity(0.3),
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
                  //
                  // Container(
                  //   width: 160,
                  //   // color: Colors.amber[100],
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5.0),
                  //           color: Colors.blue[100]!.withOpacity(0.6),
                  //         ),
                  //         child: Text(
                  //           "Estimation",
                  //           style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //               fontStyle: FontStyle.italic),
                  //         ),
                  //       ),
                  //       //
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           width: 120,
                  //           child: Text(
                  //             "Estimating water usage by inputting base facilities information and get a better awareness of water.",
                  //             overflow: TextOverflow.clip,
                  //             softWrap: true,
                  //             style: TextStyle(
                  //                 // fontSize: 16,
                  //                 fontWeight: FontWeight.normal,
                  //                 fontStyle: FontStyle.normal),
                  //           ),
                  //         ),
                  //       ),

                  //       //
                  //       //
                  //       Container(
                  //         child: Column(
                  //           children: [
                  //             IconButton(
                  //               hoverColor: Colors.blue.withOpacity(.10),
                  //               onPressed: () {
                  //                 //Navigator.pushNamed(context, '/timer');
                  //               },
                  //               icon: Icon(Icons.calculate_rounded),
                  //               iconSize: 60,
                  //               color: Colors.blue[300],
                  //             ),
                  //             Text(
                  //               "Start estimating!",
                  //               style: TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontStyle: FontStyle.normal),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: 30),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   // color: Colors.amberAccent,
                  //   width: 160,
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5.0),
                  //           color: Colors.blue[100]!.withOpacity(0.95),
                  //         ),
                  //         child: Text(
                  //           "Reflection",
                  //           style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //               fontStyle: FontStyle.italic),
                  //         ),
                  //       ),
                  //       //
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           width: 120,
                  //           child: Text(
                  //             "Share your thoughts and tricks of saving water. Let more people knows the secret of quick shower for the environment.",
                  //             overflow: TextOverflow.clip,
                  //             softWrap: true,
                  //             style: TextStyle(
                  //                 // fontSize: 16,
                  //                 fontWeight: FontWeight.normal,
                  //                 fontStyle: FontStyle.normal),
                  //           ),
                  //         ),
                  //       ),

                  //       //
                  //       //
                  //       Container(
                  //         child: Column(
                  //           children: [
                  //             IconButton(
                  //               hoverColor: Colors.blue.withOpacity(.10),
                  //               onPressed: () {
                  //                 //Navigator.pushNamed(context, '/timer');
                  //               },
                  //               icon: Icon(Icons.text_snippet_rounded),
                  //               iconSize: 60,
                  //               color: Colors.blue[300],
                  //             ),
                  //             Text(
                  //               "Start writing!",
                  //               style: TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontStyle: FontStyle.normal),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: 30),
                  //     ],
                  //   ),
                  // ),
                  //
                ],
              ),
            ),

            // FittedBox(
            //   child: Row(
            //     children: [
            //       //
            //       FittedBox(
            //         child: Row(
            //           children: [
            //             Text(
            //               "Timer",
            //               style: TextStyle(
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.w600,
            //                   fontStyle: FontStyle.italic),
            //             )
            //           ],
            //         ),
            //       ),

            //       //
            //       Container(
            //         width: 800,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 40.0, vertical: 10.0),
            //           child: Text(
            //             "A timer can record your bathing routine and algorithmically give you water-saving suggestions. About a quarter of household water is used for showers. Are you spending more than the recommended 4-minute water saving limit? We can all make a difference to help protect our water and the environment.",
            //             overflow: TextOverflow.clip,
            //             softWrap: true,
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.normal,
            //                 fontStyle: FontStyle.normal),
            //           ),
            //         ),
            //       ),
            //       //
            //       Container(
            //         child: Column(
            //           children: [
            //             IconButton(
            //               hoverColor: Colors.blue.withOpacity(.10),
            //               onPressed: () {
            //                 Navigator.pushNamed(context, '/timer');
            //               },
            //               icon: Icon(
            //                 Icons.timer,
            //               ),
            //               iconSize: 60,
            //               color: Colors.blue[300],
            //             ),
            //             Text(
            //               "Click to start timing!",
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                   fontStyle: FontStyle.normal),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 30),
            //       //
            //       FittedBox(
            //         child: Row(
            //           children: [
            //             Text(
            //               "Estimation",
            //               style: TextStyle(
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.w600,
            //                   fontStyle: FontStyle.italic),
            //             )
            //           ],
            //         ),
            //       ),
            //       //
            //       Container(
            //         width: 800,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 40.0, vertical: 10.0),
            //           child: Text(
            //             "Always paying a lot of water bills? Want to know how much water you used in a more visual way? Wonder what is the average water bill of a household with similar facilities to yours? Try our water usage estimation feature! Simply input basic information about your facilities and water usage habits, your water usage will be estimated with equivalence to help you better understand the water amount you used. ",
            //             overflow: TextOverflow.clip,
            //             softWrap: true,
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.normal,
            //                 fontStyle: FontStyle.normal),
            //           ),
            //         ),
            //       ),
            //       //
            //       //
            //       Container(
            //         child: Column(
            //           children: [
            //             IconButton(
            //               hoverColor: Colors.blue.withOpacity(.10),
            //               onPressed: () {
            //                 //Navigator.pushNamed(context, '/timer');
            //               },
            //               icon: Icon(Icons.calculate_rounded),
            //               iconSize: 60,
            //               color: Colors.blue[300],
            //             ),
            //             Text(
            //               "Click to start an estimation!",
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                   fontStyle: FontStyle.normal),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 30),
            //       //
            //       FittedBox(
            //         child: Row(
            //           children: [
            //             Text(
            //               "Reflection",
            //               style: TextStyle(
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.w600,
            //                   fontStyle: FontStyle.italic),
            //             )
            //           ],
            //         ),
            //       ),
            //       //
            //       Container(
            //         width: 800,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 40.0, vertical: 10.0),
            //           child: Text(
            //             "We provide a platform for people to share their water usage experiences. You can post your thoughts and suggestions on saving water, Write down what you think you did well and what you think you didn't do well, and how you plan to change in the future. Also, you can see others’ posts and learn from their experience to improve your awareness of saving water.",
            //             overflow: TextOverflow.clip,
            //             softWrap: true,
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.normal,
            //                 fontStyle: FontStyle.normal),
            //           ),
            //         ),
            //       ),
            //       //
            //       //
            //       Container(
            //         child: Column(
            //           children: [
            //             IconButton(
            //               hoverColor: Colors.blue.withOpacity(.10),
            //               onPressed: () {
            //                 //Navigator.pushNamed(context, '/timer');
            //               },
            //               icon: Icon(Icons.text_snippet_rounded),
            //               iconSize: 60,
            //               color: Colors.blue[300],
            //             ),
            //             Text(
            //               "Click to start writing!",
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                   fontStyle: FontStyle.normal),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            //
            SizedBox(height: 30),

            //
          ],
        ),
      ),

      //),
    );
  }
}

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
                  child: const Text("Timer")),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: TextButton(
            //       style: TextButton.styleFrom(
            //           primary: Colors.black,
            //           textStyle:
            //               TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(50))),
            //       onPressed: () {},
            //       child: const Text("Estimation")),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: TextButton(
            //       style: TextButton.styleFrom(
            //           primary: Colors.black,
            //           textStyle:
            //               TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(50))),
            //       onPressed: () {},
            //       child: const Text("Reflection")),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: TextButton(
            //       style: TextButton.styleFrom(
            //           primary: Colors.black,
            //           textStyle:
            //               TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(50))),
            //       onPressed: () {},
            //       child: const Text("Login")),
            // ),
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
        backgroundColor: Colors.blue[100],
        title: HomeNav(),
        toolbarHeight: 180,
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
        title: HomeNav(),
        toolbarHeight: 180,
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

                          // Text(
                          //   "Your this shower time is ",
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          // Text(
                          //   "${minutes} minutes ${seconds} seconds",
                          //   style: TextStyle(fontSize: 20),
                          // ),

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
    );
  }
}

//
// report

Future<List<WaterData>> fetchWaterData(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      .get(Uri.parse(
          'https://tp17waterapiiterationone.azurewebsites.net/api/WaterDatas'));

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
      Uri.parse(
          'https://tp17waterapiiterationone.azurewebsites.net/api/showerrecords'),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: recordBody);
  print(recordBody);

  return Future.value(res.statusCode == 201 ? true : false);
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: FutureBuilder<List<WaterData>>(
//         future: fetchWaterData(http.Client()),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Center(
//               child: Text('An error has occurred!'),
//             );
//           } else if (snapshot.hasData) {
//             return WaterDataList(waterdata: snapshot.data!);
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

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

    //
    // return GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //   ),
    //   itemCount: waterdata.length,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       children: [
    //         Text(waterdata[index].year.toString()),
    //         Text(waterdata[index].newSouthWales.toString()),
    //         Text(waterdata[index].victoria.toString()),
    //         Text(waterdata[index].southAustralia.toString()),
    //         Text(waterdata[index].westernAustralia.toString()),
    //         Text(waterdata[index].tasmania.toString()),
    //         Text(waterdata[index].northernTerritory.toString()),
    //         Text(waterdata[index].australianCapitalTerritory.toString()),
    //         Text(waterdata[index].toString()),
    //         Text(vicInt.toString()),
    //         Text(nswInt.toString()),
    //         Text(saInt.toString()),
    //         Text(waInt.toString()),
    //         Text(nswInt.toString()),
    //         Text(tasInt.toString()),
    //         Text(ntInt.toString()),
    //         Text(actInt.toString()),
    //         Text(allInt.toString())
    //       ],
    //     );
    //   },
    // );

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
