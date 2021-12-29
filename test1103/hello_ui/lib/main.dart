import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyHelloApp()); // 改成自己的 Widget
}

class MyHelloApp extends StatelessWidget {
  const MyHelloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello,World!',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iPhone Release Dates'),
        ),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // alarm(""),
        // computer(""),
        itemView('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone11-yellow-select-2019?wid=940&hei=1112&fmt=png-alpha&.v=1568141245782',"iphone11","2021,1,1"),
        itemView('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-12-mini-white-select-2020?wid=940&hei=1112&fmt=png-alpha&.v=1604343707000',"iphone12","2021,2,1"),
        itemView('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-13-pro-max-blue-select?wid=940&hei=1112&fmt=png-alpha&.v=1631652955000',"iphone13","2021,3,1"),
        itemView('https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-se-white-select-2020?wid=940&hei=1112&fmt=png-alpha&.v=1586574259457',"iphoneSE","2021,4,1"),     
      ],
    );
  }
}

class itemView extends StatelessWidget {
  final String iphone;
  final String timeText; // 定義alarmText型態
  final String photo;
  // final Image photo;
  const itemView(this.photo, this.iphone, this.timeText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(// padding
              child: Image.network(photo),
              constraints: BoxConstraints(maxHeight:150,maxWidth: 150),
              padding: const EdgeInsets.all(10),
              // child: Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gvm.com.tw%2Farticle%2F82478&psig=AOvVaw1bH3EC6BFF7FYTINL-2ax7&ust=1636027401667000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCOj9mJmT_PMCFQAAAAAdAAAAABAK'),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(iphone, style: TextStyle(fontSize: 30)),
                  padding: const EdgeInsets.all(10),
                ),
                Container(
                  child: Text(timeText, style: TextStyle(fontSize: 30)),
                  padding: const EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
    );
  }
}

class alarm extends StatelessWidget {
  final String alarmText; // 定義alarmText型態
  const alarm(this.alarmText, {Key? key}) : super(key: key); // 呼叫alarmText

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Icon(Icons.alarm, color: Colors.blue, size: 36),
          ),
          Container(
            child: Text(alarmText, style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
      color: Colors.blue[100],
      padding: const EdgeInsets.all(10),
    );
  }
}

class computer extends StatelessWidget {
  final String computerText; // 定義computerText型態
  const computer(this.computerText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Icon(
            Icons.computer,
            color: Colors.red,
            size: 36,
          ),
          Container(
            child: const Text("Computer", style: TextStyle(fontSize: 30)),
            margin: const EdgeInsets.only(left: 15),
          ),
        ],
      ),
      color: Colors.red[100],
      padding: const EdgeInsets.all(10),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
