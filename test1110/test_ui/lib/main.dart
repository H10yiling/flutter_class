import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  const AppBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SwitchContainer(),
    );
  }
}
// stf
// 1

// class PowerSwitch extends StatefulWidget {
//   const PowerSwitch({Key? key}) : super(key: key);

//   @override
//   _PowerSwitchState createState() => _PowerSwitchState();
// }

// class _PowerSwitchState extends State<PowerSwitch> {
//   bool _taggle = false; //states
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: _setTaggleState,
//           child: const Text('關閉'),
//         ),
//         Text(_taggle ? 'On' : 'Off'),
//       ],
//     );
//   }

//   void _setTaggleState() {
//     setState(() {
//       _taggle = !_taggle;
//     });
//   }
// }

//2

class PowerSwitch extends StatelessWidget {

  final VoidCallback taggleStateChanged; // 沒有給值
  
  const PowerSwitch({ Key? key, required this.taggleStateChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _buttonPressed,
          child: const Text('開關'),
        ),
      ],
    );
  }
  void _buttonPressed() {
    taggleStateChanged();
  }
}

class SwitchContainer extends StatefulWidget {
  const SwitchContainer({ Key? key }) : super(key: key);

  @override
  _SwitchContainerState createState() => _SwitchContainerState();
}

class _SwitchContainerState extends State<SwitchContainer> {
  bool _taggle = false; //states
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PowerSwitch(
          taggleStateChanged: tagglePower,
        ),
        Text(_taggle ? 'on' : 'off'),
      ],
    );
  }
  void tagglePower() {
    setState(() {
      _taggle = !_taggle;
    });
  }
}

