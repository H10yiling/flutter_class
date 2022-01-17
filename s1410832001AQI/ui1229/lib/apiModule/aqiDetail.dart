import 'package:flutter/material.dart';

class aqiDetail extends StatelessWidget {
  final String cityName;
  final String aqiPoint;
  Color aqiBackgroundColor = Colors.black;
  String airState = "";

  aqiDetail({required this.cityName, required this.aqiPoint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (int.tryParse(aqiPoint)! >= 0 && int.tryParse(aqiPoint)! <= 50) {
      airState = "空氣品質為良好，污染程度低或無污染。";
      aqiBackgroundColor = Colors.green;
    } else if (int.tryParse(aqiPoint)! >= 51 &&
        int.tryParse(aqiPoint)! <= 100) {
      airState = "空氣品質普通；但對非常少數之極敏感族群產生輕微影響。";
      aqiBackgroundColor = Colors.yellow;
    } else if (int.tryParse(aqiPoint)! >= 101 &&
        int.tryParse(aqiPoint)! <= 150) {
      airState = "空氣污染物可能會對敏感族群的健康造成影響，但是對一般大眾的影響不明顯。";
      aqiBackgroundColor = Colors.orange;
    } else if (int.tryParse(aqiPoint)! >= 151 &&
        int.tryParse(aqiPoint)! <= 200) {
      airState = "對所有人的健康開始產生影響，對於敏感族群可能產生較嚴重的健康影響。";
      aqiBackgroundColor = Colors.red;
    } else if (int.tryParse(aqiPoint)! >= 201 &&
        int.tryParse(aqiPoint)! <= 300) {
      airState = "所有人都可能產生較嚴重的健康影響。";
      aqiBackgroundColor = Colors.purple;
    } else if (int.tryParse(aqiPoint)! > 300) {
      airState = "健康威脅達到緊急，所有人都可能受到影響。";
      aqiBackgroundColor = Colors.redAccent.shade700;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("AQI Detail"),
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.lime[200],
        child: Column(
          children: [
            Text(
              "City Name: $cityName",
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "AQI Value: $aqiPoint",
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              airState,
              style: TextStyle(
                  fontSize: 18,
                  color: aqiBackgroundColor,
                  backgroundColor: Colors.grey[850]),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
