import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../responsive.dart';

class Seri extends StatefulWidget {
  Seri({Key key}) : super(key: key);

  @override
  _SeriState createState() => _SeriState();
}

class _SeriState extends State<Seri> {
  Future<List> update() async {
    List total = [];
    try {
      var resp = await http.get("http://192.168.43.11/classapp/series.php");
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

  Widget head(){
    return Padding(
                  padding: EdgeInsets.all(Responsive.responsiveHeight(context, 8)),
                  child: Card(
                    child: Container(
                      height: Responsive.responsiveHeight(context,60),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "ROLL NO",
                                style: TextStyle(color: Colors.red),
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "TOC",
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "SS",
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "MP",
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "DC",
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "SC",
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
                              ),
                            ),
                            
                          ),
                          Flexible(
                            flex: 7,
                            child: Center(
                              child: Text(
                                "GT",
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor *
                                        1.5,
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
                  height: Responsive.responsiveHeight(context, 550),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      List data = snapshot.data;
                      return Padding(
                        padding:EdgeInsets.all(Responsive.responsiveHeight(context, 8)),
                        child: Card(
                          child: Container(
                            height: Responsive.responsiveHeight(context,60),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][0]}",
                                      style: TextStyle(color: Colors.red),
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
                                              1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][1]}",
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
                                              1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][2]}",
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
                                              1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][3]}",
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
                                              1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][4]}",
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
                                              1.5,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][5]}",
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
                                              1.5,
                                    ),
                                  ),
                                  
                                ),
                                Flexible(
                                  flex: 7,
                                  child: Center(
                                    child: Text(
                                      "${data[index][6]}",
                                      textScaleFactor:
                                          MediaQuery.of(context).textScaleFactor *
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