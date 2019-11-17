import 'dart:convert';

import 'package:flutter/material.dart';

import '../responsive.dart';
import 'package:http/http.dart' as http;

class Timtab extends StatefulWidget {
  Timtab({Key key}) : super(key: key);

  @override
  _TimtabState createState() => _TimtabState();
}

class _TimtabState extends State<Timtab> {
  Future<List> update() async {
    List total = [];
    try {
      var resp = await http.get("http://192.168.43.220/classapp/time.php");
      var temp = jsonDecode(resp.body);
      if (temp['error'] != 'false') {
        List lis = temp['0'];
        for (List i in lis) {
          total.add(i);
        }
        print(total);
      }
    } catch (e) {
      print(e);
    }
    return total;
  }

  Widget head() {
    return Padding(
      padding: EdgeInsets.all(Responsive.responsiveHeight(context, 8)),
      child: Card(
        child: Container(
          height: Responsive.responsiveHeight(context, 60),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "Day",
                    style: TextStyle(color: Colors.red),
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "P1",
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "P2",
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "P3",
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "P4",
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "P5",
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Center(
                  child: Text(
                    "P6",
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.5,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("${MediaQuery.of(context).size.width}");
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text(
                "No Connection",
                style: TextStyle(color: Colors.red, fontSize: 3),
              ),
            );
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text(
                  "Error Connect Technical Assistance",
                  style: TextStyle(color: Colors.red, fontSize: 3),
                ),
              );
            return Column(
              children: <Widget>[
                head(),
                Container(
                  height: Responsive.responsiveHeight(context, 600),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      List data = snapshot.data;
                      return Padding(
                        padding: EdgeInsets.all(
                            Responsive.responsiveHeight(context, 8)),
                        child: Card(
                          child: Container(
                            height: Responsive.responsiveHeight(context, 60),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][0].toString().toUpperCase()}",
                                      style: TextStyle(color: Colors.red),
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][1].toString().toUpperCase()}",
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][2].toString().toUpperCase()}",
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][3].toString().toUpperCase()}",
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][4].toString().toUpperCase()}",
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][5].toString().toUpperCase()}",
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][6].toString().toUpperCase()}",
                                      textScaleFactor: MediaQuery.of(context)
                                              .textScaleFactor *
                                          1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
        }
        return null; // unreachable
      },
      future: update(),
    );
  }
}
