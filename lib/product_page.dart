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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: HomeNav(
          onPage: 'Product',
        ),
        toolbarHeight: 150,
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
                  : Container(),
              (!showShowerheadsSummary && !showTapsSummary)
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Show me the summary of brands',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
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
                              height: 150,
                              child: Card(
                                semanticContainer: true,
                                color: Colors.blue[100],
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
                                            color:
                                                Colors.blue[700 - index * 100],
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
                              height: 150,
                              child: Card(
                                semanticContainer: true,
                                color: Colors.blue[100],
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
                                            color:
                                                Colors.blue[700 - index * 100],
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
                            showTapsSummary = false;
                            showShowerheadsSummary = false;
                          });
                        },
                        child: Text('Tap Products')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showTapProduct = false;
                            showShowerProduct = !showShowerProduct;
                            showTapsSummary = false;
                            showShowerheadsSummary = false;
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
                              Text('3 stars',
                                  style: TextStyle(color: Colors.blue[300])),
                              Text('4 stars',
                                  style: TextStyle(color: Colors.blue[400])),
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
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.blue[
                                                  grouped_data![index]
                                                          ['intStarRating'] *
                                                      100]),
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
                              Text('3 stars',
                                  style: TextStyle(color: Colors.blue[300])),
                              Text('4 stars',
                                  style: TextStyle(color: Colors.blue[400])),
                              Text('5 stars',
                                  style: TextStyle(color: Colors.blue[500])),
                              Text('6 stars',
                                  style: TextStyle(color: Colors.blue[600])),
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
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.blue[
                                                  grouped_data![index]
                                                          ['intStarRating'] *
                                                      100]),
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

                                        onTap: () {},
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
