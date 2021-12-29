import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("APP Demo")),
        body: const AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Palette(),
    );
  }
}

class Palette extends StatefulWidget {
  //調色盤
  @override
  _PaletteState createState() => _PaletteState();
}

class _PaletteState extends State<Palette> {
  Color _selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            height: 200,
            color: _selectedColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 分散
            children: [
              ColorButton(
                buttonColor: Colors.red,
                colorText: 'Red',
                colorChangeCallback: changeColor,
              ),
              ColorButton(
                buttonColor: Colors.yellow,
                colorText: 'Yellow',
                colorChangeCallback: changeColor,
              ),
              ColorButton(
                buttonColor: Colors.green.shade300,
                colorText: 'Green',
                colorChangeCallback: changeColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  void changeColor(Color newColor) {
    setState(() {
      _selectedColor = newColor;
    });
  }
}

class ColorButton extends StatelessWidget {
  final Color buttonColor;
  final String colorText;
  final ValueChanged<Color> colorChangeCallback;

  const ColorButton(
      {Key? key,
      required this.buttonColor,
      required this.colorText,
      required this.colorChangeCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: _buttonPressed,
        child: Text(
          colorText,
          style: const TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(primary: buttonColor), //btn color
      ),
    );
  }

  void _buttonPressed() {
    colorChangeCallback(buttonColor);
  }
}


// class SwitchesContainer extends StatefulWidget {
//   const SwitchesContainer({Key? key}) : super(key: key);

//   @override
//   _SwitchesContainerState createState() => _SwitchesContainerState();
// }

// class _SwitchesContainerState extends State<SwitchesContainer> {
//   final List<bool> _powerStates = [false, false];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             PowerSwitch(index: 0, powerStateChanged: switchPower),
//             Text(_powerStates[0] ? 'On' : 'Off'),
//           ],
//         ),
//         Row(
//           children: [
//             PowerSwitch(index: 1, powerStateChanged: switchPower),
//             Text(_powerStates[1] ? 'On' : 'Off'),
//           ],
//         ),
//       ],
//     );
//   }

//   void switchPower(int index) {
//     setState(() {
//       _powerStates[index] = !_powerStates[index];
//     });
//   }
// }

// class PowerSwitch extends StatelessWidget {
//   final int index;
//   final ValueChanged<int> powerStateChanged;

//   const PowerSwitch(
//       {Key? key, required this.index, required this.powerStateChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: _buttonPressed,
//           child: const Text('開關'),
//         ),
//       ],
//     );
//   }

//   void _buttonPressed() {
//     debugPrint('btnPressed');
//     powerStateChanged(index);
//   }
// }

