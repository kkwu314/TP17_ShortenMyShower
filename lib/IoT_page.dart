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

// this about IoT page and all elements and logic in that page
// modify via searching keywords

///

Future<List<Map<String, dynamic>>> fetchSummary(http.Client client) async {
  final response = await client.get(
      Uri.parse('https://tp17-water-5120.azurewebsites.net/api/IotRecords/1'));
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
          'https://tp17-water-5120.azurewebsites.net/api/Devices/1/shower'));
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
      .get(Uri.parse(
          'https://tp17-water-5120.azurewebsites.net/api/Devices/1/bath'));
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
          'https://tp17-water-5120.azurewebsites.net/api/Devices/1/toilet'));
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
      .get(Uri.parse(
          'https://tp17-water-5120.azurewebsites.net/api/Devices/1/tap'));
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
          title: HomeNav(
            onPage: 'IoT',
          ),
          toolbarHeight: 150,
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
                                  return Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) => Align(
                                        child: Card(
                                          key: ValueKey(snapshot.data![index]
                                              ['key']['deviceId']),
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
                                            subtitle: Text(
                                                '${snapshot.data![index]['value'].toStringAsFixed(2)} Liters'),
                                            onTap: () {},
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
                                            subtitle: Text(
                                                '${snapshot.data![index]['value'].toStringAsFixed(2)} Liters'),
                                            onTap: () {},
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
      Uri.parse('https://tp17-water-5120.azurewebsites.net/api/Devices'),
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
  var showError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'IoT',
        ),
        toolbarHeight: 150,
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
                              if (nameController.text.isNotEmpty &&
                                  descriptionController.text.isNotEmpty) {
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
                                    showError = false;
                                  });
                                } catch (e) {
                                  Navigator.pushNamed(context, '/iot');
                                }
                              } else {
                                setState(() {
                                  showTick = false;
                                  showError = true;
                                });
                                //
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
              : Container(),
          showError
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            'Something went wrong.\nPlease input name and description.'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
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
