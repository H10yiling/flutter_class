import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui1229/apiModule/api.dart';
import 'package:ui1229/apiModule/aqiDetail.dart';

import 'package:flutter/material.dart';

class searchAQI extends StatefulWidget {
  const searchAQI({Key? key}) : super(key: key);

  @override
  _searchAQIState createState() => _searchAQIState();
}

class _searchAQIState extends State<searchAQI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.lime[100],
      child: Text(
        "每小時提供各測站之空氣品質指標(AQI)原始資料版本公告於空氣品質監測網：https://airtw.epa.gov.tw",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          backgroundColor: Colors.lime[100],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
