// ppt : Form Field Widget
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI',
        home: Scaffold(
          //形式
          appBar: AppBar(),
          body: HomeBody(),
        ));
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        children:[
        BMIInputForm(),
        SliderModel(), // ppt 5
        SwitchModel(), // ppt 6
        CheckboxModel(), // ppt 7
        RadioButtonModel(), // ppt 8
        TextEditingControllerModel(), // ppt 9
        ]
        ,)
      // children: [
         // ppt 3
        
      // ],
    );
  }
}

// ppt 9
class TextEditingControllerModel extends StatefulWidget {
  const TextEditingControllerModel({Key? key}) : super(key: key);

  @override
  _TextEditingControllerModelState createState() =>
      _TextEditingControllerModelState();
}

class _TextEditingControllerModelState
    extends State<TextEditingControllerModel> {
  final _textContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Please Input Here',
            hintText: '(ex: ABC)',
          ),
          controller: _textContoller,
        ),
        ElevatedButton(
          onPressed: () {
            debugPrint('輸入值為${_textContoller.text}');
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

// ppt 8
class RadioButtonModel extends StatefulWidget {
  const RadioButtonModel({Key? key}) : super(key: key);

  @override
  _RadioButtonModelState createState() => _RadioButtonModelState();
}

class _RadioButtonModelState extends State<RadioButtonModel> {
  final _itemCount = 5;
  int? _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgets = [];
    for (var i = 0; i < _itemCount; i++) {
      itemWidgets.add(ListTile(
        leading: Radio(
          groupValue: _selectedValue,
          value: i,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value;
            });
          },
        ),
        title: Text('Item ${i + 1}'),
      ));
    }
    return Column(children: itemWidgets);
  }
}

// ppt 7
class CheckboxModel extends StatefulWidget {
  const CheckboxModel({Key? key}) : super(key: key);

  @override
  _CheckboxModelState createState() => _CheckboxModelState();
}

class _CheckboxModelState extends State<CheckboxModel> {
  final _itemCount = 5; // item counts
  final List<bool> _checked = [];

  @override
  void initState() {
    for (var i = 0; i < _itemCount; i++) {
      _checked.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgets = [];
    for (var i = 0; i < _itemCount; i++) {
      itemWidgets.add(Row(
        children: [
          Checkbox(
            value: _checked[i],
            onChanged: (value) {
              setState(() {
                _checked[i] = value!;
              });
            },
          ),
          Text('Item ${i + 1}'),
        ],
      ));
    }
    return Column(children: itemWidgets);
  }
}

// ppt 6
class SwitchModel extends StatefulWidget {
  const SwitchModel({Key? key}) : super(key: key);

  @override
  _SwitchModelState createState() => _SwitchModelState();
}

class _SwitchModelState extends State<SwitchModel> {
  bool _switchValue = false; // switch起始值

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text('Function to turn on'),
          ),
        ),
        Switch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        )
      ],
    );
  }
}

// ppt 5
class SliderModel extends StatefulWidget {
  const SliderModel({Key? key}) : super(key: key);

  @override
  _SliderModelState createState() => _SliderModelState();
}

class _SliderModelState extends State<SliderModel> {
  double _curSliderValue = 20; // 滑桿起始值
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _curSliderValue,
          min: 5,
          max: 50,
          label: _curSliderValue.round().toString(), // 顯示值
          divisions: 9, //值被定位在9等分上
          onChanged: (value) {
            setState(() {
              _curSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}

// ppt 3
class BMIInputForm extends StatefulWidget {
  const BMIInputForm({Key? key}) : super(key: key);
  @override
  _BMIInputFormState createState() => _BMIInputFormState();
}

class _BMIInputFormState extends State<BMIInputForm> {
  String _inputtedValue = ''; // textfield起始值 ppt 4

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ppt 3
        TextField(
          decoration: const InputDecoration(
            labelText: 'Please Input Here',
            hintText: '(ex: ABC)',
          ),
          onChanged: (value) {
            debugPrint(value);
            _inputtedValue = value; // ppt 4
          },
        ),
        ElevatedButton(
          // onPressed: () => {},
          onPressed: () => {debugPrint('輸入值為$_inputtedValue')},
          // onPressed: () { // ppt 4
          //   debugPrint('輸入值為$_inputtedValue');
          // },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
