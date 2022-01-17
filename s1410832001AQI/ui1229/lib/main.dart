import 'package:flutter/material.dart';
import 'aqiList.dart';
import 'searchAQI.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AQI",
      debugShowCheckedModeBanner: false, //將Debug字眼關掉
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("空 氣 品 質 指 數 AQI"),
          backgroundColor: Colors.green[900],
        ),
        body: Container(
          color: Colors.lightGreen[300],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: const searchAQI(),
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 450,maxWidth: 450),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: const AQIList(),
              ),
            ],
          ),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
