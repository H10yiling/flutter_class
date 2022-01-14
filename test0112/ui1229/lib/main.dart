import 'package:flutter/material.dart';
import 'package:ui1229/api.dart';
import 'package:ui1229/aqiDetail.dart';

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
      title: "AQIList Demo",
      home: Scaffold(
        appBar: AppBar(title: const Text("空氣品質指數")),
        body: const AQIList(),
      ),
    );
  }
}

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
      // children: [
        // Container(
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
                                bottomRight: Radius.circular(20)),
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
                                        cityName:
                                            snapshot.data![index].siteName,
                                        aqiPoint: snapshot.data![index].aqi
                                            .toString(),
                                      )));
                          debugPrint(
                              "City Name: ${snapshot.data![index].siteName}");
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
              }),
        // ),
      // ],
    );
  }
}

// Form Widgets
class FormInput extends StatefulWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _formKey = GlobalKey<FormState>();
  final _heightTextController = TextEditingController();
  final _weightTextController = TextEditingController();

  bool _isHeightIn100To250(String str) {
    if (double.tryParse(str)! < 100 || double.tryParse(str)! > 250) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  bool _isWeightIn5To200(String str) {
    if (double.tryParse(str)! < 5 || double.tryParse(str)! > 200) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "身高(cm)"),
            controller: _heightTextController,
            keyboardType: TextInputType.number,
            validator: (value) {
              debugPrint("身高：$value");
              return _isHeightIn100To250(value!)
                  ? null
                  : "請輸入正確範圍的數字 (100cm~250cm)";
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "體重(kg)"),
            controller: _weightTextController,
            validator: (value) {
              debugPrint("體重：$value");
              return _isWeightIn5To200(value!)
                  ? null
                  : "請輸入正確範圍的數字 (5kg~200kg)";
            },
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint("檢查結果：${_formKey.currentState?.validate()}");
                if (_formKey.currentState?.validate() == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(
                                height:
                                    double.tryParse(_heightTextController.text),
                                weight:
                                    double.tryParse(_weightTextController.text),
                              )));
                } else {
                  debugPrint("檢查失敗");
                }
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final double? height;
  final double? weight;

  SecondPage({required this.height, required this.weight, Key? key})
      : super(key: key);

  double calcBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("BMI 結果")),
        body: Column(
          children: [
            Text("Height: $height cm"),
            Text("Weight: $weight kg"),
            Text("BMI 結果: ${calcBMI(height!, weight!)}"),
          ],
        ));
  }
}
