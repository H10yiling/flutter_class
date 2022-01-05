import 'package:flutter/material.dart';

class AQIListDetail extends StatelessWidget {
  final String cityName;
  final String aqiPoint;
  final Color aqiBackgroundColor;
  String airState = "";

  AQIListDetail({required this.cityName, required this.aqiPoint, required this.aqiBackgroundColor, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (int.tryParse(aqiPoint)! >= 0 && int.tryParse(aqiPoint)! <= 50) {
      airState = "空氣品質 良好（0~50）";
    } else if (int.tryParse(aqiPoint)! >= 51 && int.tryParse(aqiPoint)! <= 100) {
      airState = "空氣品質 普通（51~100）";
    } else if (int.tryParse(aqiPoint)! >= 101 && int.tryParse(aqiPoint)! <= 150) {
      airState = "空氣品質 對敏感族群不健康（101~150）";
    } else if (int.tryParse(aqiPoint)! >= 151 && int.tryParse(aqiPoint)! <= 200) {
      airState = "空氣品質 對所有族群不健康（151～200）";
    } else if (int.tryParse(aqiPoint)! >= 201 && int.tryParse(aqiPoint)! <= 300) {
      airState = "空氣品質 非常不健康（201~300）";
    } else if (int.tryParse(aqiPoint)! > 300) {
      airState = "空氣品質 危害（300以上）";
    }
    return Scaffold(
      appBar: AppBar(title: const Text("AQI Detail"),),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("City Name: $cityName", style: const TextStyle(color: Colors.black),),
            Text("AQI Value: $aqiPoint", style: const TextStyle(color: Colors.black),),
            Text(airState, style: TextStyle(color: aqiBackgroundColor),),
          ],
        ),
        alignment: Alignment.center,
      ), 
    );
  }
}