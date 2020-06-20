import 'package:classapp/comp/Seri.dart';
import 'package:classapp/comp/Timtab.dart';
import 'package:flutter/material.dart';
import 'comp/Atten.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Class App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Series Mark",
              ),
              Tab(text: "Attendance"),
              Tab(text: "Time Table"),
              Tab(text: "Assignment")
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Seri(),
            Atten(),
            Timtab(),
           Center(
             child: Text("എടാ മെച്ചു പെവർ ആണോ ",
             style: TextStyle(color: Colors.red,fontSize: 20),),
           ),
          ],
        ),
      ),
    );
  }
}
