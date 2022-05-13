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
      initialRoute: '/ratedproducts',
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

///

Future<List<Map<String, dynamic>>> fetchIoTDeviceData(
    http.Client client) async {
  final response = await client
      .get(Uri.parse('https://api.jsonbin.io/b/626ebc5f38be296761faaf93'));
  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchSummary(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://tp17-water.azurewebsites.net/api/IotRecords/1'));
  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchShower(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      // .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Devices'));
      .get(Uri.parse(
          'https://tp17-water.azurewebsites.net/api/Devices/1/shower'));
  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchBath(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      // .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Devices'));
      .get(
          Uri.parse('https://tp17-water.azurewebsites.net/api/Devices/1/bath'));
  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchToilet(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      // .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Devices'));
      .get(Uri.parse(
          'https://tp17-water.azurewebsites.net/api/Devices/1/toilet'));
  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchTap(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      // .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Devices'));
      .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Devices/1/tap'));
  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchIoTRecordData(
    http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      // .get(Uri.parse('https://tp17-api.azurewebsites.net/api/WaterDatas'));
      // .get(Uri.parse('https://tp17-water.azurewebsites.net/api/IotRecords'));
      .get(Uri.parse('https://api.jsonbin.io/b/626ebcbf38be296761faafd7'));

  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

class IoTPage extends StatefulWidget {
  @override
  _IoTPageState createState() => _IoTPageState();
}

class _IoTPageState extends State<IoTPage> {
  List<Map<String, dynamic>> _allSummary = [];
  List<Map<String, dynamic>> _allDeviceInfo = [];
  List<Map<String, dynamic>> _allRecordsInfo = [];

  Future<List<Map<String, dynamic>>> fetchiot() async {
    return await fetchIoTDeviceData(http.Client());
  }

  Future<List<Map<String, dynamic>>> fetchrc() async {
    return await fetchIoTRecordData(http.Client());
  }

  Future<List<Map<String, dynamic>>> fetchIoTSummary() async {
    return await fetchSummary(http.Client());
  }

  @override
  void initState() {
    super.initState();
  }

  bool showIot = false;
  bool showShower = false;
  bool showBath = false;
  bool showToilet = false;
  bool showTap = false;

  @override
  Widget build(BuildContext context) {
    if (_allDeviceInfo == [] || _allRecordsInfo == []) {
      fetchiot();
      fetchrc();
      return Text('loading');
    } else {
      print("hey");
      print(_allDeviceInfo);
      print("hey three");
      print(_allRecordsInfo);

      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/adddevice');
          },
          label: const Text('Add Devices'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blue[300],
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[100],
          title: HomeNav(),
          toolbarHeight: 180,
        ),
        body: showIot
            ? Column(
                children: [
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: fetchIoTSummary(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('An error has occurred!'),
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Devices Summary",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "IoT devices can be labelled based on the type of water usage, the summary only shows total amount of used water for each type. \nClick on a label tocheck the water usage recorded by each device. Click again to hide the list of IoT devices.",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print('showing the shower');
                                      setState(() {
                                        showShower = !showShower;
                                      });
                                    },
                                    child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'images/showerhead_draw.jpg',
                                                height: 150,
                                                width: 150,
                                              ),
                                            ),
                                            FittedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${snapshot.data![0]['value'].toStringAsFixed(2)} Liters',
                                                  style: TextStyle(
                                                      color: Colors.blue[300],
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('showing the toilet');
                                      setState(() {
                                        showBath = !showBath;
                                      });
                                    },
                                    child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'images/bath_draw.jpg',
                                                height: 150,
                                                width: 150,
                                              ),
                                            ),
                                            FittedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${snapshot.data![2]['value'].toStringAsFixed(2)} Liters',
                                                  style: TextStyle(
                                                      color: Colors.blue[300],
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('showing the bath');
                                      setState(() {
                                        showToilet = !showToilet;
                                      });
                                    },
                                    child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'images/toilet_draw.jpg',
                                                height: 150,
                                                width: 150,
                                              ),
                                            ),
                                            FittedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${snapshot.data![1]['value'].toStringAsFixed(2)} Liters',
                                                  style: TextStyle(
                                                      color: Colors.blue[300],
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('showing the tap');
                                      setState(() {
                                        showTap = !showTap;
                                      });
                                    },
                                    child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                'images/tap_draw.jpg',
                                                height: 150,
                                                width: 150,
                                              ),
                                            ),
                                            FittedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '${snapshot.data![3]['value'].toStringAsFixed(2)} Liters',
                                                  style: TextStyle(
                                                      color: Colors.blue[300],
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Text('${snapshot.data![0]}'),

                            // fetch data
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),

//
                  (showShower || showBath || showTap || showToilet)
                      ? Text(
                          "Devices List",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(),

                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      showShower
                          ? FutureBuilder(
                              future: fetchShower(http.Client()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('An error has occurred!'),
                                  );
                                } else if (snapshot.hasData) {
                                  // var grouped_data = snapshot.data!
                                  //     .groupListsBy((element) => (element['label']));
                                  // return Text('${snapshot.data![1]['key']}');

                                  return Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) => Align(
                                        child: Card(
                                          key: ValueKey(snapshot.data![index]
                                              ['key']['deviceId']),
                                          // color: _getColorByBin(
                                          //     _foundCards[index]["color"].toString()),
                                          elevation: 4,
                                          margin: EdgeInsets.all(16.0),
                                          child: ListTile(
                                            leading: Text(
                                              'Shower ${(index + 1).toString()}',
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            title: Text(
                                              snapshot.data![index]['key']
                                                  ['name'],
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            // subtitle: Text(
                                            //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                            // subtitle: Text(
                                            //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                            subtitle: Text(
                                                '${snapshot.data![index]['value'].toStringAsFixed(2)} Liters'),

                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => DetailScreen(
                                              //         foundCard: _foundCards[index]),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          : Container(),

                      //
                      showBath
                          ? FutureBuilder(
                              future: fetchBath(http.Client()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('An error has occurred!'),
                                  );
                                } else if (snapshot.hasData) {
                                  // var grouped_data = snapshot.data!
                                  //     .groupListsBy((element) => (element['label']));
                                  // return Text('${snapshot.data![1]['key']}');

                                  return Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) => Align(
                                        child: Card(
                                          key: ValueKey(snapshot.data![index]
                                              ['key']['deviceId']),
                                          // color: _getColorByBin(
                                          //     _foundCards[index]["color"].toString()),
                                          elevation: 4,
                                          margin: EdgeInsets.all(16.0),
                                          child: ListTile(
                                            leading: Text(
                                              'Bath ${(index + 1).toString()}',
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            title: Text(
                                              snapshot.data![index]['key']
                                                  ['name'],
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            // subtitle: Text(
                                            //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                            // subtitle: Text(
                                            //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                            subtitle: Text(
                                                '${snapshot.data![index]['value'].toStringAsFixed(2)} Liters'),

                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => DetailScreen(
                                              //         foundCard: _foundCards[index]),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          : Container(),
                      //
                      showToilet
                          ? FutureBuilder(
                              future: fetchToilet(http.Client()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('An error has occurred!'),
                                  );
                                } else if (snapshot.hasData) {
                                  // var grouped_data = snapshot.data!
                                  //     .groupListsBy((element) => (element['label']));
                                  // return Text('${snapshot.data![1]['key']}');

                                  return Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) => Align(
                                        child: Card(
                                          key: ValueKey(snapshot.data![index]
                                              ['key']['deviceId']),
                                          // color: _getColorByBin(
                                          //     _foundCards[index]["color"].toString()),
                                          elevation: 4,
                                          margin: EdgeInsets.all(16.0),
                                          child: ListTile(
                                            leading: Text(
                                              'Toilet ${(index + 1).toString()}',
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            title: Text(
                                              snapshot.data![index]['key']
                                                  ['name'],
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            // subtitle: Text(
                                            //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                            // subtitle: Text(
                                            //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                            subtitle: Text(
                                                '${snapshot.data![index]['value'].toStringAsFixed(2)} Liters'),

                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => DetailScreen(
                                              //         foundCard: _foundCards[index]),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          : Container(),
                      //
                      showTap
                          ? FutureBuilder(
                              future: fetchTap(http.Client()),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('An error has occurred!'),
                                  );
                                } else if (snapshot.hasData) {
                                  // var grouped_data = snapshot.data!
                                  //     .groupListsBy((element) => (element['label']));
                                  // return Text('${snapshot.data![1]['key']}');

                                  return Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) => Align(
                                        child: Card(
                                          key: ValueKey(snapshot.data![index]
                                              ['key']['deviceId']),
                                          // color: _getColorByBin(
                                          //     _foundCards[index]["color"].toString()),
                                          elevation: 4,
                                          margin: EdgeInsets.all(16.0),
                                          child: ListTile(
                                            leading: Text(
                                              'Tap ${(index + 1).toString()}',
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            title: Text(
                                              snapshot.data![index]['key']
                                                  ['name'],
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                            // subtitle: Text(
                                            //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                            // subtitle: Text(
                                            //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                            subtitle: Text(
                                                '${snapshot.data![index]['value'].toStringAsFixed(2)} Liters'),

                                            onTap: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => DetailScreen(
                                              //         foundCard: _foundCards[index]),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          : Container(),
                      //
                    ]),
                  )),

                  // ///
                  // FutureBuilder<List<Map<String, dynamic>>>(
                  //   future: fetchiot(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasError) {
                  //       return const Center(
                  //         child: Text('An error has occurred!'),
                  //       );
                  //     } else if (snapshot.hasData) {
                  //       var grouped_data = snapshot.data!
                  //           .groupListsBy((element) => (element['label']));
                  //       // return Text('${grouped_data['shower']}'

                  //       return Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Row(
                  //             children: [
                  //               showShower
                  //                   ? Expanded(
                  //                       child: ListView.builder(
                  //                         scrollDirection: Axis.vertical,
                  //                         itemCount: grouped_data['shower']!.length,
                  //                         itemBuilder: (context, index) => Align(
                  //                           child: Card(
                  //                             key: ValueKey(
                  //                                 grouped_data['shower']![index]
                  //                                     ["id"]),
                  //                             // color: _getColorByBin(
                  //                             //     _foundCards[index]["color"].toString()),
                  //                             elevation: 4,
                  //                             margin: EdgeInsets.all(16.0),
                  //                             child: ListTile(
                  //                               leading: Text(
                  //                                 (index + 1).toString(),
                  //                                 style: TextStyle(fontSize: 14.0),
                  //                               ),
                  //                               title: Text(
                  //                                 grouped_data['shower']![index]
                  //                                     ['name'],
                  //                                 style: TextStyle(fontSize: 14.0),
                  //                               ),
                  //                               // subtitle: Text(
                  //                               //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                  //                               // subtitle: Text(
                  //                               //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                  //                               subtitle: Text(
                  //                                   '${grouped_data['shower']!}'),

                  //                               onTap: () {
                  //                                 // Navigator.push(
                  //                                 //   context,
                  //                                 //   MaterialPageRoute(
                  //                                 //     builder: (context) => DetailScreen(
                  //                                 //         foundCard: _foundCards[index]),
                  //                                 //   ),
                  //                                 // );
                  //                               },
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     )
                  //                   : Container(),

                  //               //
                  //               showBath
                  //                   ? Expanded(
                  //                       child: ListView.builder(
                  //                         scrollDirection: Axis.vertical,
                  //                         itemCount: grouped_data['bath']!.length,
                  //                         itemBuilder: (context, index) => Align(
                  //                           child: Card(
                  //                             key: ValueKey(
                  //                                 grouped_data['bath']![index]["id"]),
                  //                             // color: _getColorByBin(
                  //                             //     _foundCards[index]["color"].toString()),
                  //                             elevation: 4,
                  //                             margin: EdgeInsets.all(16.0),
                  //                             child: ListTile(
                  //                               leading: Text(
                  //                                 (index + 1).toString(),
                  //                                 style: TextStyle(fontSize: 14.0),
                  //                               ),
                  //                               title: Text(
                  //                                 grouped_data['bath']![index]
                  //                                     ['name'],
                  //                                 style: TextStyle(fontSize: 14.0),
                  //                               ),
                  //                               // subtitle: Text(
                  //                               //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                  //                               // subtitle: Text(
                  //                               //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                  //                               subtitle:
                  //                                   Text('${grouped_data['bath']!}'),

                  //                               onTap: () {
                  //                                 // Navigator.push(
                  //                                 //   context,
                  //                                 //   MaterialPageRoute(
                  //                                 //     builder: (context) => DetailScreen(
                  //                                 //         foundCard: _foundCards[index]),
                  //                                 //   ),
                  //                                 // );
                  //                               },
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     )
                  //                   : Container(),
                  //               //
                  //               showToilet
                  //                   ? Expanded(
                  //                       child: ListView.builder(
                  //                         scrollDirection: Axis.vertical,
                  //                         itemCount: grouped_data['toilet']!.length,
                  //                         itemBuilder: (context, index) => Align(
                  //                           child: Card(
                  //                             key: ValueKey(
                  //                                 grouped_data['toilet']![index]
                  //                                     ["id"]),
                  //                             // color: _getColorByBin(
                  //                             //     _foundCards[index]["color"].toString()),
                  //                             elevation: 4,
                  //                             margin: EdgeInsets.all(16.0),
                  //                             child: ListTile(
                  //                               leading: Text(
                  //                                 (index + 1).toString(),
                  //                                 style: TextStyle(fontSize: 14.0),
                  //                               ),
                  //                               title: Text(
                  //                                 grouped_data['toilet']![index]
                  //                                     ['name'],
                  //                                 style: TextStyle(fontSize: 14.0),
                  //                               ),
                  //                               // subtitle: Text(
                  //                               //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                  //                               // subtitle: Text(
                  //                               //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                  //                               subtitle: Text(
                  //                                   '${grouped_data['toilet']!}'),

                  //                               onTap: () {
                  //                                 // Navigator.push(
                  //                                 //   context,
                  //                                 //   MaterialPageRoute(
                  //                                 //     builder: (context) => DetailScreen(
                  //                                 //         foundCard: _foundCards[index]),
                  //                                 //   ),
                  //                                 // );
                  //                               },
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     )
                  //                   : Container(),
                  //               //

                  //               showTap
                  //                   ? Expanded(
                  //                       child: ListView.builder(
                  //                       scrollDirection: Axis.vertical,
                  //                       itemCount:
                  //                           grouped_data['wash basin taps']!.length,
                  //                       itemBuilder: (context, index) => Align(
                  //                         child: Card(
                  //                           key: ValueKey(grouped_data[
                  //                               'wash basin taps']![index]["id"]),
                  //                           // color: _getColorByBin(
                  //                           //     _foundCards[index]["color"].toString()),
                  //                           elevation: 4,
                  //                           margin: EdgeInsets.all(16.0),
                  //                           child: ListTile(
                  //                             leading: Text(
                  //                               (index + 1).toString(),
                  //                               style: TextStyle(fontSize: 14.0),
                  //                             ),
                  //                             title: Text(
                  //                               grouped_data['wash basin taps']![
                  //                                   index]['name'],
                  //                               style: TextStyle(fontSize: 14.0),
                  //                             ),
                  //                             // subtitle: Text(
                  //                             //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                  //                             // subtitle: Text(
                  //                             //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                  //                             subtitle: Text(
                  //                                 '${grouped_data['wash basin taps']!}'),

                  //                             onTap: () {
                  //                               // Navigator.push(
                  //                               //   context,
                  //                               //   MaterialPageRoute(
                  //                               //     builder: (context) => DetailScreen(
                  //                               //         foundCard: _foundCards[index]),
                  //                               //   ),
                  //                               // );
                  //                             },
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ))
                  //                   : Container(),
                  //             ],
                  //           ),
                  //         ),
                  //       );

                  //       // fetch data

                  //     } else {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //   },
                  // ),
                ],
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Five steps to measure water usage in a smart way',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 500,
                        // color: Colors.blue,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 400,
                                      color: Colors.blue[100],
                                      child: Center(
                                          child: Text("1",
                                              style: TextStyle(fontSize: 100))),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 400,
                                      color: Colors.blue[200],
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/step1.jpg",
                                            height: 300,
                                          ),
                                          Text(
                                              "Install smart water meter with WiFi in your bathroom taps",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // step 2
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 400,
                                      color: Colors.blue[100],
                                      child: Center(
                                          child: Text("2",
                                              style: TextStyle(fontSize: 100))),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 400,
                                      color: Colors.blue[200],
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/step2.jpg",
                                            height: 300,
                                          ),
                                          Text(
                                              "Using WiFi Hub to connect with Jetson Nano",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              //
                              // step 3
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 400,
                                      color: Colors.blue[100],
                                      child: Center(
                                          child: Text("3",
                                              style: TextStyle(fontSize: 100))),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 400,
                                      color: Colors.blue[200],
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/step3.jpg",
                                            height: 300,
                                          ),
                                          Text("Showering with some water",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // step 4
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 400,
                                      color: Colors.blue[100],
                                      child: Center(
                                          child: Text("4",
                                              style: TextStyle(fontSize: 100))),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 400,
                                      color: Colors.blue[200],
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/step4.jpg",
                                            height: 300,
                                          ),
                                          Text(
                                              "Gathering data with Jetson nano",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // step 5
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 400,
                                      color: Colors.blue[100],
                                      child: Center(
                                          child: Text("5",
                                              style: TextStyle(fontSize: 100))),
                                    ),
                                    Container(
                                      width: 300,
                                      height: 400,
                                      color: Colors.blue[200],
                                      child: Column(
                                        children: [
                                          Icon(Icons.cloud_sync, size: 300),
                                          Text(
                                              "Jetson nano sync and sending to Azure cloud database",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Scroll/drag horizontally to see more"),
                          Icon(
                            Icons.arrow_right,
                            size: 50,
                            color: Colors.blue[100],
                          ),
                        ],
                      ),
                      Container(
                          child: Text(
                              "Once installed IoT devices in your bathrooms,\nyou can easily checking the usage of water in this page. \nThe summary of types of water used will show on the top\n'",
                              style: TextStyle(fontSize: 18))),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showIot = true;
                            });
                          },
                          child: Text('Connect to IoT Devices'))
                    ],
                  ),
                ),
              ),
      );
    }
  }
}

// final List<Map<String, dynamic>> allRecordsInfo = [
//   {
//     "id": 1,
//     "deviceId": 1,
//     "recordDateTime": "2021-06-25T18:37:26",
//     "usedSecond": 1285,
//     "flowPerSec": 0.65
//   },
//   {
//     "id": 2,
//     "deviceId": 1,
//     "recordDateTime": "2021-12-17T21:20:33",
//     "usedSecond": 1754,
//     "flowPerSec": 0.28
//   },
//   {
//     "id": 3,
//     "deviceId": 9,
//     "recordDateTime": "2021-10-27T09:07:07",
//     "usedSecond": 2186,
//     "flowPerSec": 0.93
//   },
//   {
//     "id": 4,
//     "deviceId": 2,
//     "recordDateTime": "2021-10-15T10:48:30",
//     "usedSecond": 2534,
//     "flowPerSec": 0.51
//   },
//   {
//     "id": 5,
//     "deviceId": 6,
//     "recordDateTime": "2021-11-02T08:18:47",
//     "usedSecond": 3002,
//     "flowPerSec": 0.85
//   },
//   {
//     "id": 6,
//     "deviceId": 6,
//     "recordDateTime": "2022-03-31T04:47:22",
//     "usedSecond": 889,
//     "flowPerSec": 0.58
//   },
//   {
//     "id": 7,
//     "deviceId": 6,
//     "recordDateTime": "2021-11-11T11:51:30",
//     "usedSecond": 179,
//     "flowPerSec": 0.94
//   },
//   {
//     "id": 8,
//     "deviceId": 4,
//     "recordDateTime": "2021-10-10T03:42:57",
//     "usedSecond": 2726,
//     "flowPerSec": 0.33
//   },
//   {
//     "id": 9,
//     "deviceId": 7,
//     "recordDateTime": "2022-01-30T23:10:02",
//     "usedSecond": 2091,
//     "flowPerSec": 0.75
//   },
//   {
//     "id": 10,
//     "deviceId": 7,
//     "recordDateTime": "2021-10-12T22:32:57",
//     "usedSecond": 3030,
//     "flowPerSec": 0.54
//   },
//   {
//     "id": 11,
//     "deviceId": 2,
//     "recordDateTime": "2021-12-13T02:10:35",
//     "usedSecond": 1486,
//     "flowPerSec": 0.19
//   },
//   {
//     "id": 12,
//     "deviceId": 5,
//     "recordDateTime": "2022-04-20T11:53:23",
//     "usedSecond": 2523,
//     "flowPerSec": 0.36
//   },
//   {
//     "id": 13,
//     "deviceId": 10,
//     "recordDateTime": "2021-05-26T10:08:06",
//     "usedSecond": 799,
//     "flowPerSec": 0.85
//   },
//   {
//     "id": 14,
//     "deviceId": 8,
//     "recordDateTime": "2021-05-22T19:30:55",
//     "usedSecond": 3088,
//     "flowPerSec": 0.99
//   },
//   {
//     "id": 15,
//     "deviceId": 8,
//     "recordDateTime": "2021-08-11T10:56:26",
//     "usedSecond": 2933,
//     "flowPerSec": 0.99
//   },
//   {
//     "id": 16,
//     "deviceId": 3,
//     "recordDateTime": "2021-09-11T03:22:33",
//     "usedSecond": 2441,
//     "flowPerSec": 0.99
//   },
//   {
//     "id": 17,
//     "deviceId": 6,
//     "recordDateTime": "2022-01-26T12:17:11",
//     "usedSecond": 3121,
//     "flowPerSec": 0.53
//   },
//   {
//     "id": 18,
//     "deviceId": 1,
//     "recordDateTime": "2021-05-13T16:04:10",
//     "usedSecond": 3133,
//     "flowPerSec": 0.81
//   },
//   {
//     "id": 19,
//     "deviceId": 2,
//     "recordDateTime": "2021-05-24T23:11:17",
//     "usedSecond": 1814,
//     "flowPerSec": 0.03
//   },
//   {
//     "id": 20,
//     "deviceId": 9,
//     "recordDateTime": "2021-05-25T21:17:21",
//     "usedSecond": 1955,
//     "flowPerSec": 0.26
//   }
// // ];
// final List<Map<String, dynamic>> allDeviceInfo = [
//   {
//     "deviceId": 1,
//     "name": "first floor master bathroom shower",
//     "label": "shower",
//     "description": "Water flow meter for first floor master bathroom shower",
//     "userId": 2
//   },
//   {
//     "deviceId": 2,
//     "name": "first floor side bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for first floor side bathroom toilet",
//     "userId": 4
//   },
//   {
//     "deviceId": 3,
//     "name": "master bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for master bathroom toilet",
//     "userId": 3
//   },
//   {
//     "deviceId": 4,
//     "name": "side bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for side bathroom toilet",
//     "userId": 4
//   },
//   {
//     "deviceId": 5,
//     "name": "first floor master bathroom shower",
//     "label": "shower",
//     "description": "Water flow meter for first floor master bathroom shower",
//     "userId": 1
//   },
//   {
//     "deviceId": 6,
//     "name": "master bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for master bathroom toilet",
//     "userId": 1
//   },
//   {
//     "deviceId": 7,
//     "name": "first floor master bathroom bath",
//     "label": "bath",
//     "description": "Water flow meter for first floor master bathroom bath",
//     "userId": 2
//   },
//   {
//     "deviceId": 8,
//     "name": "second floor master bathroom wash basin taps",
//     "label": "wash basin taps",
//     "description":
//         "Water flow meter for second floor master bathroom wash basin taps",
//     "userId": 3
//   },
//   {
//     "deviceId": 9,
//     "name": "first floor side bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for first floor side bathroom toilet",
//     "userId": 2
//   },
//   {
//     "deviceId": 10,
//     "name": "first floor master bathroom bath",
//     "label": "bath",
//     "description": "Water flow meter for first floor master bathroom bath",
//     "userId": 1
//   },
// ];

// final List<Map<String, dynamic>> allDeviceInfo = [
//   {
//     "id": 1,
//     "name": "first floor master bathroom shower",
//     "label": "shower",
//     "description": "Water flow meter for first floor master bathroom shower",
//     "userId": 2
//   },
//   {
//     "id": 2,
//     "name": "first floor side bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for first floor side bathroom toilet",
//     "userId": 4
//   },
//   {
//     "id": 3,
//     "name": "master bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for master bathroom toilet",
//     "userId": 3
//   },
//   {
//     "id": 4,
//     "name": "side bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for side bathroom toilet",
//     "userId": 4
//   },
//   {
//     "id": 5,
//     "name": "first floor master bathroom shower",
//     "label": "shower",
//     "description": "Water flow meter for first floor master bathroom shower",
//     "userId": 1
//   },
//   {
//     "id": 6,
//     "name": "master bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for master bathroom toilet",
//     "userId": 1
//   },
//   {
//     "id": 7,
//     "name": "first floor master bathroom bath",
//     "label": "bath",
//     "description": "Water flow meter for first floor master bathroom bath",
//     "userId": 2
//   },
//   {
//     "id": 8,
//     "name": "second floor master bathroom wash basin taps",
//     "label": "wash basin taps",
//     "description":
//         "Water flow meter for second floor master bathroom wash basin taps",
//     "userId": 3
//   },
//   {
//     "id": 9,
//     "name": "first floor side bathroom toilet",
//     "label": "toilet",
//     "description": "Water flow meter for first floor side bathroom toilet",
//     "userId": 2
//   },
//   {
//     "id": 10,
//     "name": "first floor master bathroom bath",
//     "label": "bath",
//     "description": "Water flow meter for first floor master bathroom bath",
//     "userId": 0
//   }
// ];

// final List<Map<String, dynamic>> allRecordsInfo = [
//   {
//     "id": 1,
//     "deviceId": 1,
//     "recordDateTime": "2021-06-25 18:37:26",
//     "usedSecond": 3,
//     "flowPerSec": 0.13
//   },
//   {
//     "id": 2,
//     "deviceId": 1,
//     "recordDateTime": "2021-12-17 21:20:33",
//     "usedSecond": 1,
//     "flowPerSec": 0.28
//   },
//   {
//     "id": 3,
//     "deviceId": 9,
//     "recordDateTime": "2021-10-27 09:07:07",
//     "usedSecond": 1,
//     "flowPerSec": 0.93
//   },
//   {
//     "id": 4,
//     "deviceId": 2,
//     "recordDateTime": "2021-10-15 10:48:30",
//     "usedSecond": 1,
//     "flowPerSec": 0.51
//   },
//   {
//     "id": 5,
//     "deviceId": 6,
//     "recordDateTime": "2021-11-02 08:18:47",
//     "usedSecond": 1,
//     "flowPerSec": 0.85
//   },
//   {
//     "id": 6,
//     "deviceId": 6,
//     "recordDateTime": "2022-03-31 04:47:22",
//     "usedSecond": 1,
//     "flowPerSec": 0.58
//   },
//   {
//     "id": 7,
//     "deviceId": 6,
//     "recordDateTime": "2021-11-11 11:51:30",
//     "usedSecond": 1,
//     "flowPerSec": 0.94
//   },
//   {
//     "id": 8,
//     "deviceId": 4,
//     "recordDateTime": "2021-10-10 03:42:57",
//     "usedSecond": 1,
//     "flowPerSec": 0.33
//   },
//   {
//     "id": 9,
//     "deviceId": 7,
//     "recordDateTime": "2022-01-30 23:10:02",
//     "usedSecond": 1,
//     "flowPerSec": 0.75
//   },
//   {
//     "id": 10,
//     "deviceId": 7,
//     "recordDateTime": "2021-10-12 22:32:57",
//     "usedSecond": 1,
//     "flowPerSec": 0.54
//   },
//   {
//     "id": 11,
//     "deviceId": 0,
//     "recordDateTime": "2021-12-13 02:10:35",
//     "usedSecond": 1,
//     "flowPerSec": 0.19
//   },
//   {
//     "id": 12,
//     "deviceId": 5,
//     "recordDateTime": "2022-04-20 11:53:23",
//     "usedSecond": 1,
//     "flowPerSec": 0.36
//   },
//   {
//     "id": 13,
//     "deviceId": 10,
//     "recordDateTime": "2021-05-26 10:08:06",
//     "usedSecond": 1,
//     "flowPerSec": 0.85
//   },
//   {
//     "id": 14,
//     "deviceId": 8,
//     "recordDateTime": "2021-05-22 19:30:55",
//     "usedSecond": 1,
//     "flowPerSec": 0.99
//   },
//   {
//     "id": 15,
//     "deviceId": 8,
//     "recordDateTime": "2021-08-11 10:56:26",
//     "usedSecond": 1,
//     "flowPerSec": 0.99
//   },
//   {
//     "id": 16,
//     "deviceId": 1,
//     "recordDateTime": "2021-09-11 03:22:33",
//     "usedSecond": 1,
//     "flowPerSec": 0.99
//   },
//   {
//     "id": 17,
//     "deviceId": 6,
//     "recordDateTime": "2022-01-26 12:17:11",
//     "usedSecond": 1,
//     "flowPerSec": 0.53
//   },
//   {
//     "id": 18,
//     "deviceId": 1,
//     "recordDateTime": "2021-05-13 16:04:10",
//     "usedSecond": 1,
//     "flowPerSec": 0.81
//   },
//   {
//     "id": 19,
//     "deviceId": 2,
//     "recordDateTime": "2021-05-24 23:11:17",
//     "usedSecond": 1,
//     "flowPerSec": 0.03
//   },
//   {
//     "id": 20,
//     "deviceId": 9,
//     "recordDateTime": "2021-05-25 21:17:21",
//     "usedSecond": 1,
//     "flowPerSec": 0.26
//   }
// ];

//post shower record to database
class IoTDevices {
  String name;
  String label;
  String description;
  int? userId;

  IoTDevices(
      {required this.name,
      required this.label,
      required this.description,
      this.userId});

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "description": description,
        "userId": userId
      };
}

void postIoTDevice(
    String name, String label, String description, int userId) async {
  var record = new IoTDevices(
          name: name, label: label, description: description, userId: 1)
      .toJson();
  var recordBody = json.encode(record);
  var res = await http.post(
      // Uri.parse('https://tp17-api.azurewebsites.net/api/showerrecords'),
      // Uri.parse(
      //     'https://tp17waterapi20220412011238.azurewebsites.net/api/showerrecords'),
      Uri.parse('https://tp17-water.azurewebsites.net/api/Devices'),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: recordBody);
  print(recordBody);

  // return Future.value(res.statusCode == 201 ? true : false);
}

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  // Initial Selected Value
  String dropdownvalue = 'shower';

  // List of items in our dropdown menu
  var items = [
    'shower',
    'bath',
    'toilet',
    'wash basin taps',
  ];
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();

  var showTick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/iot');
      //   },
      //   label: const Text('Go back to'),
      //   icon: const Icon(Icons.add),
      //   backgroundColor: Colors.blue[300],
      // ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(),
        toolbarHeight: 180,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              color: Colors.blue[100],
              width: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('Add A New IoT Device',
                        style: TextStyle(fontSize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(
                        'Please name your IoT devices and give some description, or edit later.',
                        style: TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic)),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(hintText: 'Name'),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            decoration:
                                InputDecoration(hintText: 'Description'),
                          ),
                          Row(
                            children: [
                              Text("Label : ", style: TextStyle(fontSize: 16)),
                              DropdownButton(
                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              print('post to new devices');
                              print(
                                  '${nameController.text},${descriptionController.text},${dropdownvalue}');

                              try {
                                postIoTDevice(
                                    nameController.text,
                                    dropdownvalue,
                                    descriptionController.text,
                                    1);
                                setState(() {
                                  showTick = true;
                                });
                              } catch (e) {
                                Navigator.pushNamed(context, '/iot');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Add"),
                            ),
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
          ),
          showTick
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Added new IoT devices.'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/iot');
                              },
                              child: Text('Go to IoT page')),
                        )
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

// class IoTPage extends StatefulWidget {
//   @override
//   _IoTPageState createState() => _IoTPageState();
// }

// class _IoTPageState extends State<IoTPage> {
//   //List<Map<String, dynamic>> _summaryRecords = [];
//   List<double> _sumlistOfLites = [];
//   List<double> _idsList = [];
//   var groupedMap;

// var _showerMap;
// var _bathMap;
// var _toiletMap;
// var _tapsMap;

// bool showIot = false;
// bool showShower = false;
// bool showBath = false;
// bool showToilet = false;
// bool showTap = false;

//   void productFuction(dynamic mymap) {
//     _sumlistOfLites.add(mymap['usedSecond'] * mymap['flowPerSec']);
//     // return (mymap['usedSecond'] * mymap['flowPerSec']);
//   }

//   String forloopFuction(dynamic mymap) {
//     mymap?.forEach(productFuction);
//     print(_sumlistOfLites);
//     var localList = _sumlistOfLites;
//     _sumlistOfLites = [];
//     return (localList.sum * 100.round() / 100).toStringAsFixed(2) + ' liters';
//   }

//   double forloopCalFuction(dynamic mymap) {
//     mymap?.forEach(productFuction);
//     print(_sumlistOfLites);
//     var localList = _sumlistOfLites;
//     _sumlistOfLites = [];
//     return (localList.sum * 100.round() / 100);
//   }

// //

//   void getIdsFuction(dynamic mymap) {
//     _idsList.add(mymap['id']);
//     // return (mymap['usedSecond'] * mymap['flowPerSec']);
//   }

//   String sumEachFuction(dynamic mymap) {
//     print(mymap);
//     mymap?.forEach(getIdsFuction);
//     print(_idsList);
//     _idsList = _idsList.toSet().toList();
//     //
//     List<double> localList = [];
//     for (var i = 0; i < _idsList.length; i++) {
//       localList.add(forloopCalFuction(groupedMap[_idsList[i]]));
//     }
//     print(localList.toString());
//     _idsList = [];
//     // return (localList.sum * 100.round() / 100).toStringAsFixed(2) + ' liters';
//     return (localList.sum * 100.round() / 100).toStringAsFixed(2) + ' liters';
//   }

//   List<Map<String, dynamic>> _allDeviceInfo = [];
//   List<Map<String, dynamic>> _allRecordsInfo = [];

//   Future<List<Map<String, dynamic>>> fetchit() async {
//     return await fetchIoTDeviceData(http.Client());
//   }

//   Future<List<Map<String, dynamic>>> fetchrc() async {
//     return await fetchIoTRecordData(http.Client());
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     // void yourFunction() async {
//     //   var x = await DataBaseHelper.instance.queryAllRows();
//     // }
//     // // }

//     // late List<Map<String, dynamic>> _allDeviceInfo = allDeviceInfo;
//     // late List<Map<String, dynamic>> _allRecordsInfo = allRecordsInfo;
//     fetchrc().then((value) {
//       print(value);
//       setState(() {
//         this._allRecordsInfo = value;
//       });
//     });

//     fetchit().then((value) async {
//       setState(() {
//         this._allDeviceInfo = value;
//       });
//     });

//     // print(forloopFuction(groupedMap[3]));
//     // print(newMap);
//     // print(_deviceIndexList);
//     // print(_sumlistOfLites);
//     // print(_summarylistOfLites);

//     var _labelMap = groupBy(_allDeviceInfo, (Map obj) => obj['label']);

//     // print(_labelMap);
//     _showerMap = _labelMap['shower'];
//     _bathMap = _labelMap['bath'];
//     _toiletMap = _labelMap['toilet'];
//     _tapsMap = _labelMap['wash basin taps'];

//     // print(_showerMap);
//     //sumEachFuction(_showerMap);

//     // sumEachFuction(_showerMap);
//     // print(_bathMap);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_allDeviceInfo == [] || _allRecordsInfo == []) {
//       fetchit();
//       fetchrc();
//       return Text('loading');
//     } else {
//       print("hey");
//       print(_allDeviceInfo);
//       print("hey three");
//       print(_allRecordsInfo);

//       return Scaffold(
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             Navigator.pushNamed(context, '/adddevice');
//           },
//           label: const Text('Add Devices'),
//           icon: const Icon(Icons.add),
//           backgroundColor: Colors.blue[300],
//         ),
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.blue[100],
//           title: HomeNav(),
//           toolbarHeight: 180,
//         ),
//         body: showIot
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         print(_allDeviceInfo);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => IoTStatsPage(
//                               devices: _allDeviceInfo,
//                               records: _allRecordsInfo,
//                             ),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.cruelty_free)),
// FittedBox(
//   child: Row(
//     children: [
//       GestureDetector(
//         onTap: () {
//           print('showing the shower');
//           setState(() {
//             showShower = !showShower;
//           });
//         },
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Container(
//                   child: Image.asset(
//                     'images/showerhead_draw.jpg',
//                     height: 150,
//                     width: 150,
//                   ),
//                 ),
//                 FittedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       '${sumEachFuction(_showerMap)}',
//                       style: TextStyle(
//                           color: Colors.blue[300],
//                           fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           print('showing the bath');
//           setState(() {
//             showBath = !showBath;
//           });
//         },
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Container(
//                   child: Image.asset(
//                     'images/bath_draw.jpg',
//                     height: 150,
//                     width: 150,
//                   ),
//                 ),
//                 FittedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       '${sumEachFuction(_bathMap)}',
//                       style: TextStyle(
//                           color: Colors.blue[300],
//                           fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           print('showing the toilet');
//           setState(() {
//             showToilet = !showToilet;
//           });
//         },
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Container(
//                   child: Image.asset(
//                     'images/toilet_draw.jpg',
//                     height: 150,
//                     width: 150,
//                   ),
//                 ),
//                 FittedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       '${sumEachFuction(_toiletMap)}',
//                       style: TextStyle(
//                           color: Colors.blue[300],
//                           fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           print('showing the tap');
//           setState(() {
//             showTap = !showTap;
//           });
//         },
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Container(
//                   child: Image.asset(
//                     'images/tap_draw.jpg',
//                     height: 150,
//                     width: 150,
//                   ),
//                 ),
//                 FittedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       '${sumEachFuction(_tapsMap)}',
//                       style: TextStyle(
//                           color: Colors.blue[300],
//                           fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//     ],
//   ),
// ),

// //
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Row(
//       children: [
//         showShower
//             ? Expanded(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 120,
//                       color: Colors.blue[200],
//                       child: Card(
//                         margin: EdgeInsets.all(8.0),
//                         child: ListTile(
//                           leading: Text('Showers'),
//                           title: Text(
//                               'Total showers water usage'),
//                           subtitle: Text(
//                               '${sumEachFuction(_showerMap)}'),
//                           onTap: () {
//                             print('showing showers devices');
//                           },
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                                           child: _showerMap.isNotEmpty
//                                               ? ListView.builder(
//                                                   scrollDirection:
//                                                       Axis.vertical,
//                                                   itemCount: _showerMap.length,
//                                                   itemBuilder:
//                                                       (context, index) => Align(
//                                                     child: Card(
//                                                       key: ValueKey(
//                                                           _showerMap[index]
//                                                               ["id"]),
//                                                       // color: _getColorByBin(
//                                                       //     _foundCards[index]["color"].toString()),
//                                                       elevation: 4,
//                                                       margin:
//                                                           EdgeInsets.all(16.0),
//                                                       child: ListTile(
//                                                         leading: Text(
//                                                           (index + 1)
//                                                               .toString(),
//                                                           style: TextStyle(
//                                                               fontSize: 14.0),
//                                                         ),
//                                                         title: Text(
//                                                           _showerMap[index]
//                                                               ['name'],
//                                                           style: TextStyle(
//                                                               fontSize: 14.0),
//                                                         ),
//                                                         // subtitle: Text(
//                                                         //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
//                                                         // subtitle: Text(
//                                                         //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
//                                                         subtitle: Text(
//                                                             '${forloopFuction(groupedMap[_showerMap[index]['id']])}'),

//                                                         onTap: () {
//                                                           // Navigator.push(
//                                                           //   context,
//                                                           //   MaterialPageRoute(
//                                                           //     builder: (context) => DetailScreen(
//                                                           //         foundCard: _foundCards[index]),
//                                                           //   ),
//                                                           // );
//                                                         },
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               : Text("No found of shower")),
//                                     ],
//                                   ),
//                                 )
//                               : Container(
//                                   // child: Text("TEXT hide"),
//                                   ),
//                           //
//                           showBath
//                               ? Expanded(
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         height: 120,
//                                         color: Colors.blue[200],
//                                         child: Card(
//                                           margin: EdgeInsets.all(8.0),
//                                           child: ListTile(
//                                             leading: Text('Baths'),
//                                             title:
//                                                 Text('Total baths water usage'),
//                                             subtitle: Text(
//                                                 '${sumEachFuction(_bathMap)}'),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: _bathMap.isNotEmpty
//                                             ? ListView.builder(
//                                                 scrollDirection: Axis.vertical,
//                                                 itemCount: _bathMap.length,
//                                                 itemBuilder: (context, index) =>
//                                                     Align(
//                                                   child: Card(
//                                                     key: ValueKey(
//                                                         _bathMap[index]["id"]),
//                                                     // color: _getColorByBin(
//                                                     //     _foundCards[index]["color"].toString()),
//                                                     elevation: 4,
//                                                     margin:
//                                                         EdgeInsets.all(16.0),
//                                                     child: ListTile(
//                                                       leading: Text(
//                                                         (index + 1).toString(),
//                                                         style: TextStyle(
//                                                             fontSize: 14.0),
//                                                       ),
//                                                       title: Text(
//                                                         _bathMap[index]['name'],
//                                                         style: TextStyle(
//                                                             fontSize: 14.0),
//                                                       ),
//                                                       // subtitle: Text(
//                                                       //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
//                                                       // subtitle: Text(
//                                                       //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
//                                                       subtitle: Text(
//                                                           '${forloopFuction(groupedMap[_bathMap[index]['id']])}'),

//                                                       onTap: () {
//                                                         // Navigator.push(
//                                                         //   context,
//                                                         //   MaterialPageRoute(
//                                                         //     builder: (context) => DetailScreen(
//                                                         //         foundCard: _foundCards[index]),
//                                                         //   ),
//                                                         // );
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             : Text("No found of bath"),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : Container(),
// //
//                           showToilet
//                               ? Expanded(
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         height: 120,
//                                         color: Colors.blue[200],
//                                         child: Card(
//                                           margin: EdgeInsets.all(8.0),
//                                           child: ListTile(
//                                             leading: Text('Toilets'),
//                                             title: Text(
//                                                 'Total toilets water usage'),
//                                             subtitle: Text(
//                                                 '${sumEachFuction(_toiletMap)}'),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: _toiletMap.isNotEmpty
//                                             ? ListView.builder(
//                                                 scrollDirection: Axis.vertical,
//                                                 itemCount: _toiletMap.length,
//                                                 itemBuilder: (context, index) =>
//                                                     Align(
//                                                   child: Card(
//                                                     key: ValueKey(
//                                                         _toiletMap[index]
//                                                             ["id"]),
//                                                     // color: _getColorByBin(
//                                                     //     _foundCards[index]["color"].toString()),
//                                                     elevation: 4,
//                                                     margin:
//                                                         EdgeInsets.all(16.0),
//                                                     child: ListTile(
//                                                       leading: Text(
//                                                         (index + 1).toString(),
//                                                         style: TextStyle(
//                                                             fontSize: 14.0),
//                                                       ),
//                                                       title: Text(
//                                                         _toiletMap[index]
//                                                             ['name'],
//                                                         style: TextStyle(
//                                                             fontSize: 14.0),
//                                                       ),
//                                                       // subtitle: Text(
//                                                       //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
//                                                       // subtitle: Text(
//                                                       //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
//                                                       subtitle: Text(
//                                                           '${forloopFuction(groupedMap[_toiletMap[index]['id']])}'),

//                                                       onTap: () {
//                                                         // Navigator.push(
//                                                         //   context,
//                                                         //   MaterialPageRoute(
//                                                         //     builder: (context) => DetailScreen(
//                                                         //         foundCard: _foundCards[index]),
//                                                         //   ),
//                                                         // );
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             : Text("No found of toilet"),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : Container(),
//                           showTap
//                               ? Expanded(
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         height: 120,
//                                         color: Colors.blue[200],
//                                         child: Card(
//                                           margin: EdgeInsets.all(8.0),
//                                           child: ListTile(
//                                             leading: Text('Taps'),
//                                             title:
//                                                 Text('Total taps water usage'),
//                                             subtitle: Text(
//                                                 '${sumEachFuction(_tapsMap)}'),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: _tapsMap.isNotEmpty
//                                             ? ListView.builder(
//                                                 itemCount: _tapsMap.length,
//                                                 itemBuilder: (context, index) =>
//                                                     Align(
//                                                   child: Card(
//                                                     key: ValueKey(
//                                                         _tapsMap[index]["id"]),
//                                                     // color: _getColorByBin(
//                                                     //     _foundCards[index]["color"].toString()),
//                                                     elevation: 4,
//                                                     margin:
//                                                         EdgeInsets.all(16.0),
//                                                     child: ListTile(
//                                                       leading: Text(
//                                                         (index + 1).toString(),
//                                                         style: TextStyle(
//                                                             fontSize: 14.0),
//                                                       ),
//                                                       title: Text(
//                                                         _tapsMap[index]['name'],
//                                                         style: TextStyle(
//                                                             fontSize: 14.0),
//                                                       ),
//                                                       // subtitle: Text(
//                                                       //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
//                                                       // subtitle: Text(
//                                                       //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
//                                                       subtitle: Text(
//                                                           '${forloopFuction(groupedMap[_tapsMap[index]['id']])}'),

//                                                       onTap: () {
//                                                         // Navigator.push(
//                                                         //   context,
//                                                         //   MaterialPageRoute(
//                                                         //     builder: (context) => DetailScreen(
//                                                         //         foundCard: _foundCards[index]),
//                                                         //   ),
//                                                         // );
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             : Text("No found of taps"),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : Container(),
//                           // Expanded(
//                           //     child: groupedMap.isNotEmpty
//                           //         ? ListView.builder(
//                           //             itemCount: _allDeviceInfo.length,
//                           //             itemBuilder: (context, index) => Align(
//                           //               child: SizedBox(
//                           //                 width: 600,
//                           //                 child: Card(
//                           //                   key: ValueKey(_allDeviceInfo[index]["id"]),
//                           //                   // color: _getColorByBin(
//                           //                   //     _foundCards[index]["color"].toString()),
//                           //                   elevation: 4,
//                           //                   margin: EdgeInsets.symmetric(vertical: 10.0),
//                           //                   child: ListTile(
//                           //                     leading: Text(
//                           //                       _allDeviceInfo[index]['id'].toString(),
//                           //                     ),
//                           //                     title: Text(_allDeviceInfo[index]['name']),
//                           //                     // subtitle: Text(
//                           //                     //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
//                           //                     // subtitle: Text(
//                           //                     //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
//                           //                     subtitle: Text(
//                           //                         '${forloopFuction(groupedMap[_allDeviceInfo[index]['id']])}'),

//                           //                     onTap: () {
//                           //                       // Navigator.push(
//                           //                       //   context,
//                           //                       //   MaterialPageRoute(
//                           //                       //     builder: (context) => DetailScreen(
//                           //                       //         foundCard: _foundCards[index]),
//                           //                       //   ),
//                           //                       // );
//                           //                     },
//                           //                   ),
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //           )
//                           //         : Text("No found of waste")),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
// : Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//   child: Text(
//       'Once installed IoT devices in your bathrooms,\nyou can easily checking the usage of water in this page. \nThe summary of types of water used will show on the top\n'),
// ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               await fetchrc().then((value) {
//                 print(value);

//                 setState(() {
//                   _allRecordsInfo = value;
//                 });
//               });

//               await fetchit().then((value) {
//                 setState(() {
//                   _allDeviceInfo = value;
//                 });

//                 showIot = true;
//               });
//             },
//             child: Text('Connect to IoT Devices'),
//           ),
//         ),
//       ),
//     ],
//   ),
//       );
//     }
//   }
// }

///

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
        title: HomeNav(),
        toolbarHeight: 180,
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

  const EstimationDetailScreen({Key? key, required this.estimatedAmount})
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
        title: HomeNav(),
        toolbarHeight: 180,
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
                    widget.estimatedAmount > 155
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Adult Generation Z (18-25) in Victoria \ncares about water conservation \nbut does not have good water habits. \nWe aim to improve the awareness of saving water \nvia developing a 4 minutes shower habit. ",
                                style: TextStyle(
                                    fontSize: 16,
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
                  Container(
                    width: 160,
                    // color: Colors.amber[100],
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.blue[100]!.withOpacity(0.6),
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
                            color: Colors.blue[100]!.withOpacity(0.6),
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
                  //           "IoT",
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
                  //             // "Share your thoughts and tricks of saving water. Let more people knows the secret of quick shower for the environment.",
                  //             "Connect to IoT devices to keep track of your usage of water to get more accurate data and see where water can be saved.",
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
                  //               "Connect to IoT!",
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
                    Navigator.pushNamed(context, '/estimation');
                  },
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/iot');
                  },
                  child: const Text("IoT")),
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
                    Navigator.pushNamed(context, '/tips');
                  },
                  child: const Text("Tips")),
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
                    Navigator.pushNamed(context, '/ratedproducts');
                  },
                  child: const Text("Rated Products")),
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
        title: HomeNav(),
        toolbarHeight: 180,
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

//
Future<List<Map<String, dynamic>>> fetchTapsSummaryData(
    http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      .get(Uri.parse('https://tp17-water.azurewebsites.net/api/SummaryTaps'));

  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // print(result);
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchTapsProductData(
    http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Taps'));

  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // print(result);
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchShowerheadsSummaryData(
    http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      .get(Uri.parse(
          'https://tp17-water.azurewebsites.net/api/SummaryShowerheads'));

  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // print(result);
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

Future<List<Map<String, dynamic>>> fetchShowersProductData(
    http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://api.jsonbin.io/b/62500812d8a4cc06909ddd01'));
      .get(Uri.parse('https://tp17-water.azurewebsites.net/api/Showerheads'));

  //print(response.body);
  var result = jsonDecode(response.body).cast<Map<String, dynamic>>();
  // print(result);
  // .map<IoTDeviceData>((json) => IoTDeviceData.fromJson(json))
  // .toList();
  //print(result);
  return result;
}

class RatedProductPage extends StatefulWidget {
  @override
  _RatedProductPageState createState() => _RatedProductPageState();
}

double _selectedTapStarValue = 7.0;
double _selectedShowerStarValue = 3.0;

bool showTapProduct = false;
bool showShowerProduct = false;

bool showStoLbyRating = false;

bool showLtoSbyRating = true;

bool showStoLbyWater = false;

bool showLtoSbyWater = false;

bool showTapsSummary = true;

bool showShowerheadsSummary = false;

class _RatedProductPageState extends State<RatedProductPage> {
  @override
  Widget build(BuildContext context) {
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
        title: HomeNav(),
        toolbarHeight: 180,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTapsSummary
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Taps brands with highest ratings',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  : Container(),
              showShowerheadsSummary
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Showerheads brands with highest ratings',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  : Container()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showShowerheadsSummary = false;
                    showTapsSummary = true;
                  });
                },
                child: Text('Summary Of Taps'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showTapsSummary = false;
                    showShowerheadsSummary = true;
                  });
                },
                child: Text('Summary Of ShowerHeads'),
              ),
            ],
          ),
//
          // showShowerheadsSummary
          //     ? Row(
          //         children: [
          //           ElevatedButton(
          //             onPressed: () {
          //               setState(() {
          //                 showStoLbyRating = false;
          //                 showStoLbyWater = false;
          //                 showLtoSbyWater = false;
          //                 showLtoSbyRating = true;
          //               });
          //             },
          //             child: Text(
          //                 'Top 5 brands of Showerheads by average water rating'),
          //           ),

          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   showLtoSbyRating = false;
          //                   showStoLbyWater = false;
          //                   showLtoSbyWater = false;
          //                   showStoLbyRating = true;
          //                 });
          //               },
          //               child: Text(
          //                   'Last 5 brands of Showerheads by average water rating')),
          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   showStoLbyRating = false;
          //                   showLtoSbyRating = false;
          //                   showStoLbyWater = false;
          //                   showLtoSbyWater = true;
          //                 });
          //               },
          //               child: Text(
          //                   '5 brands of Showerheads with highest average water uses in liters')),
          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   showStoLbyRating = false;
          //                   showLtoSbyRating = false;
          //                   showLtoSbyWater = false;
          //                   showStoLbyWater = true;
          //                 });
          //               },
          //               child: Text(
          //                   '5 brands of Showerheads with lowest average water uses in liters')),

          //           //
          //         ],
          //       )
          //     : Container(),

          showShowerheadsSummary
              ? FutureBuilder(
                  future: fetchShowerheadsSummaryData(http.Client()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error has occurred!'),
                      );
                    } else if (snapshot.hasData) {
                      var result_data = snapshot.data!;

                      if (showLtoSbyWater) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                b['averageWaterConsumpLiters'].toString())
                            .compareTo(double.parse(
                                a['averageWaterConsumpLiters'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      if (showStoLbyWater) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                a['averageWaterConsumpLiters'].toString())
                            .compareTo(double.parse(
                                b['averageWaterConsumpLiters'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      if (showLtoSbyRating) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                b['averageRating'].toString())
                            .compareTo(
                                double.parse(a['averageRating'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      if (showStoLbyRating) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                a['averageRating'].toString())
                            .compareTo(
                                double.parse(b['averageRating'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => Align(
                            child: Container(
                              width: 300,
                              height: 200,
                              child: Card(
                                semanticContainer: true,
                                color: Colors.blue[200],
                                key: ValueKey(result_data![index]['brand']),
                                // color: _getColorByBin(
                                //     _foundCards[index]["color"].toString()),
                                elevation: 4,
                                margin: EdgeInsets.all(16.0),
                                child: ListTile(
                                  leading: Column(
                                    children: [
                                      Text(
                                        'Rank ${index + 1}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${result_data![index]['medianRating'].toString()} Stars',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    '${result_data![index]['brand']} - ${result_data![index]['averageRating']} stars on average',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  // subtitle: Text(
                                  //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                  // subtitle: Text(
                                  //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                  subtitle: Container(
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${result_data![index]['averageWaterConsumpLiters']} liters per minute on average with ${result_data![index]['nOfProduct']} products'),
                                      ],
                                    ),
                                  ),

                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => DetailScreen(
                                    //         foundCard: _foundCards[index]),
                                    //   ),
                                    // );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              : Container(),
//
          // showTapsSummary
          //     ? Row(
          //         children: [
          //           ElevatedButton(
          //             onPressed: () {
          //               setState(() {
          //                 showStoLbyRating = false;
          //                 showStoLbyWater = false;
          //                 showLtoSbyWater = false;
          //                 showLtoSbyRating = true;
          //               });
          //             },
          //             child: Text('Top 5 brands by water rating'),
          //           ),

          //           ElevatedButton(
          //             onPressed: () {
          //               setState(() {
          //                 showLtoSbyRating = false;
          //                 showStoLbyWater = false;
          //                 showLtoSbyWater = false;
          //                 showStoLbyRating = true;
          //               });
          //             },
          //             child: Text('Last 5 brands by water rating'),
          //           ),
          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   showStoLbyRating = false;
          //                   showLtoSbyRating = false;
          //                   showStoLbyWater = false;
          //                   showLtoSbyWater = true;
          //                 });
          //               },
          //               child: Text('5 highest water uses brands')),
          //           ElevatedButton(
          //               onPressed: () {
          //                 setState(() {
          //                   showStoLbyRating = false;
          //                   showLtoSbyRating = false;
          //                   showLtoSbyWater = false;
          //                   showStoLbyWater = true;
          //                 });
          //               },
          //               child: Text('5 lowest water uses brands')),

          //           //
          //         ],
          //       )
          //     : Container(),

          showTapsSummary
              ? FutureBuilder(
                  future: fetchTapsSummaryData(http.Client()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error has occurred!'),
                      );
                    } else if (snapshot.hasData) {
                      var result_data = snapshot.data!;

                      if (showLtoSbyWater) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                b['averageWaterConsumpLiters'].toString())
                            .compareTo(double.parse(
                                a['averageWaterConsumpLiters'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      if (showStoLbyWater) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                a['averageWaterConsumpLiters'].toString())
                            .compareTo(double.parse(
                                b['averageWaterConsumpLiters'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      if (showLtoSbyRating) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                b['averageRating'].toString())
                            .compareTo(
                                double.parse(a['averageRating'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      if (showStoLbyRating) {
                        final temp = List.from(result_data);
                        temp.sort((a, b) => double.parse(
                                a['averageRating'].toString())
                            .compareTo(
                                double.parse(b['averageRating'].toString())));

                        var filteredList = temp;

                        result_data = filteredList;
                      }

                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          //     itemBuilder: (context, index) => Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Container(
                          //         width: 200,
                          //         height: 200,
                          //         color: Colors.blue[300],
                          //         child: Column(children: [
                          //           Text("Rank ${index + 1} "),
                          //           Text(
                          //             '${result_data![index]['medianRating'].toString()} Stars',
                          //             style: TextStyle(fontSize: 14.0),
                          //           ),
                          //           Text(
                          //             '${result_data![index]['brand']} - ${result_data![index]['averageRating']} stars on average',
                          //             style: TextStyle(fontSize: 14.0),
                          //           ),
                          //           Text(
                          //               '${result_data![index]['averageWaterConsumpLiters']} liters per minute on average with ${result_data![index]['nOfProduct']} products'),
                          //         ]),
                          //       ),
                          //     ),
                          //   ),
                          // );
                          itemBuilder: (context, index) => Align(
                            child: Container(
                              width: 300,
                              height: 200,
                              child: Card(
                                semanticContainer: true,
                                color: Colors.blue[200],
                                key: ValueKey(result_data![index]['brand']),
                                // color: _getColorByBin(
                                //     _foundCards[index]["color"].toString()),
                                elevation: 4,
                                margin: EdgeInsets.all(16.0),
                                child: ListTile(
                                  leading: Column(
                                    children: [
                                      Text(
                                        'Rank ${index + 1}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${result_data![index]['medianRating'].toString()} Stars',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    '${result_data![index]['brand']} - ${result_data![index]['averageRating']} stars on average',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  // subtitle: Text(
                                  //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                  // subtitle: Text(
                                  //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                  subtitle: Container(
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${result_data![index]['averageWaterConsumpLiters']} liters per minute on average with ${result_data![index]['nOfProduct']} products'),
                                      ],
                                    ),
                                  ),

                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => DetailScreen(
                                    //         foundCard: _foundCards[index]),
                                    //   ),
                                    // );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              : Container(),

          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Find out more water saving products',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),

          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showShowerProduct = false;
                            showTapProduct = !showTapProduct;
                          });
                        },
                        child: Text('Tap Products')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showTapProduct = false;
                            showShowerProduct = !showShowerProduct;
                          });
                        },
                        child: Text('Shower Products')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showTapProduct
                        ? Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text('Taps products with selected ratings',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        : Container(),
                    showShowerProduct
                        ? Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                                'Showerheads products with selected ratings',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        : Container()
                  ],
                ),

                //
                showShowerProduct
                    ? Container(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('3 stars'),
                              Text('4 stars'),
                              Text('All stars')
                            ],
                          ),
                        ),
                      )
                    : Container(),
                showShowerProduct
                    ? Container(
                        width: 500,
                        child: Slider(
                            value: _selectedShowerStarValue.toDouble(),
                            min: 3.0,
                            max: 5.0,
                            divisions: 2,
                            activeColor: Colors.blue[200],
                            inactiveColor: Colors.black,
                            label:
                                '${_selectedShowerStarValue.toDouble() == 5 ? "Show All" : _selectedShowerStarValue.toDouble()} stars',
                            onChanged: (double newValue) {
                              setState(() {
                                _selectedShowerStarValue =
                                    newValue.round().toDouble();
                              });
                            },
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()}';
                            }),
                      )
                    : Container(),

                showShowerProduct
                    ? FutureBuilder(
                        future: fetchShowersProductData(http.Client()),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('An error has occurred!'),
                            );
                          } else if (snapshot.hasData) {
                            var grouped_data = snapshot.data!
                                .where((o) =>
                                    o['intStarRating'] ==
                                    _selectedShowerStarValue)
                                .toList();

                            _selectedShowerStarValue.toDouble() == 5
                                ? grouped_data = snapshot.data!
                                : grouped_data;
                            // return Text('${snapshot.data![1]['key']}');

                            return Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: grouped_data!.length,
                                itemBuilder: (context, index) => Align(
                                  child: Container(
                                    width: 500,
                                    child: Card(
                                      semanticContainer: true,
                                      key: ValueKey(
                                          grouped_data![index]['brand']),
                                      // color: _getColorByBin(
                                      //     _foundCards[index]["color"].toString()),
                                      elevation: 4,
                                      margin: EdgeInsets.all(16.0),
                                      child: ListTile(
                                        leading: Text(
                                          '${grouped_data![index]['intStarRating'].toString()} Stars',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        title: Text(
                                          '${grouped_data![index]['brand']} - ${grouped_data![index]['model']}',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        // subtitle: Text(
                                        //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                        // subtitle: Text(
                                        //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${grouped_data![index]['waterconsump']} liters per minute'),
                                            Text(
                                                'Reg.number: ${grouped_data![index]['regnumber']}'),
                                            Text(
                                                'Subtype: ${grouped_data![index]['subtype']}'),
                                          ],
                                        ),

                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => DetailScreen(
                                          //         foundCard: _foundCards[index]),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    : Container(),

                //
                showTapProduct
                    ? Container(
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('3 stars'),
                              Text('4 stars'),
                              Text('5 stars'),
                              Text('6 stars'),
                              Text('All stars')
                            ],
                          ),
                        ),
                      )
                    : Container(),
                showTapProduct
                    ? Container(
                        width: 500,
                        child: Slider(
                            value: _selectedTapStarValue.toDouble(),
                            min: 3.0,
                            max: 7.0,
                            divisions: 4,
                            activeColor: Colors.blue[200],
                            inactiveColor: Colors.black,
                            label:
                                '${_selectedTapStarValue.toDouble() == 7 ? "Show All" : _selectedTapStarValue.toDouble()} stars',
                            onChanged: (double newValue) {
                              setState(() {
                                _selectedTapStarValue =
                                    newValue.round().toDouble();
                              });
                            },
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()}';
                            }),
                      )
                    : Container(),

                showTapProduct
                    ? FutureBuilder(
                        future: fetchTapsProductData(http.Client()),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('An error has occurred!'),
                            );
                          } else if (snapshot.hasData) {
                            var grouped_data = snapshot.data!
                                .where((o) =>
                                    o['intStarRating'] == _selectedTapStarValue)
                                .toList();

                            _selectedTapStarValue.toDouble() == 7
                                ? grouped_data = snapshot.data!
                                : grouped_data;
                            // return Text('${snapshot.data![1]['key']}');

                            return Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: grouped_data!.length,
                                itemBuilder: (context, index) => Align(
                                  child: Container(
                                    width: 500,
                                    child: Card(
                                      semanticContainer: true,

                                      key: ValueKey(
                                          grouped_data![index]['brand']),
                                      // color: _getColorByBin(
                                      //     _foundCards[index]["color"].toString()),
                                      elevation: 4,
                                      margin: EdgeInsets.all(16.0),
                                      child: ListTile(
                                        leading: Text(
                                          '${grouped_data![index]['intStarRating'].toString()} Stars',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        title: Text(
                                          '${grouped_data![index]['brand']} - ${grouped_data![index]['model']}',
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        // subtitle: Text(
                                        //     '${((_summaryRecords[index]['usedSecond'] * _summaryRecords[index]['waterFlowLiterPerSecond']) * 10.round() / 10).toStringAsFixed(1)} liters '),
                                        // subtitle: Text(
                                        //     '${groupedMap[_allDeviceInfo[index]['id']]?.forEach(sumFuction)}'),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${grouped_data![index]['waterconsump']} liters per minute'),
                                            Text(
                                                'Reg.number: ${grouped_data![index]['regnumber']}'),
                                            Text(
                                                'Subtype: ${grouped_data![index]['subtype']}'),
                                          ],
                                        ),

                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => DetailScreen(
                                          //         foundCard: _foundCards[index]),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    : Container(),
              ],
            ),
          ),

          //end
        ],
      ),
    );
  }
}
