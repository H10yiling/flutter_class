import 'package:flutter/material.dart';
import 'package:ui1229/apiModule/api.dart';
import 'package:ui1229/apiModule/aqiDetail.dart';

// 顯示所有AQI
class AQIList extends StatefulWidget {
  const AQIList({Key? key}) : super(key: key);

  @override
  _AQIListState createState() => _AQIListState();
}

class _AQIListState extends State<AQIList> {
  Future<List<Station>>? futureStationList;
  late Color aqiTextBackgroundColor;

  @override
  void initState() {
    super.initState();
    futureStationList = fetchAQI();
  }

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Station>>(
        future: futureStationList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('${snapshot.data}');
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                debugPrint("build: $index");

                if (snapshot.data![index].aqi >= 0 &&
                    snapshot.data![index].aqi <= 50) {
                  aqiTextBackgroundColor = Colors.green;
                } else if (snapshot.data![index].aqi >= 51 &&
                    snapshot.data![index].aqi <= 100) {
                  aqiTextBackgroundColor = Colors.yellow;
                } else if (snapshot.data![index].aqi >= 101 &&
                    snapshot.data![index].aqi <= 150) {
                  aqiTextBackgroundColor = Colors.orange;
                } else if (snapshot.data![index].aqi >= 151 &&
                    snapshot.data![index].aqi <= 200) {
                  aqiTextBackgroundColor = Colors.red;
                } else if (snapshot.data![index].aqi >= 201 &&
                    snapshot.data![index].aqi <= 300) {
                  aqiTextBackgroundColor = Colors.purple;
                } else if (snapshot.data![index].aqi > 300) {
                  aqiTextBackgroundColor = Colors.redAccent.shade700;
                }

                return ListTile(
                  title: Text(
                    snapshot.data![index].siteName,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 10, maxHeight: 20),
                    padding: const EdgeInsets.only(
                        left: 10, top: 0, right: 10, bottom: 0),
                    decoration: BoxDecoration(
                      color: aqiTextBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      snapshot.data![index].aqi.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        backgroundColor: aqiTextBackgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => aqiDetail(
                          cityName: snapshot.data![index].siteName,
                          aqiPoint: snapshot.data![index].aqi.toString(),
                        ),
                      ),
                    );
                    debugPrint("City Name: ${snapshot.data![index].siteName}");
                    debugPrint("City AQI: ${snapshot.data![index].aqi}");
                  },
                  trailing: const Icon(Icons.navigate_next),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

//參考：https://karthikponnam.medium.com/flutter-search-in-listview-1ffa40956685