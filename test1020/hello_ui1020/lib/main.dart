import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHelloApp()); // 改成自己的 Widget
}

class MyHelloApp extends StatelessWidget {
  const MyHelloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Hello App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello App Bar'),
        ),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.all(20),
  //     color: Colors.green,
  //   );
  // }

  // ppt 9
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.only(
  //       left: 60,
  //       top: 20,
  //       bottom: 100,
  //     ),
  //     color: Colors.green,
  //   );
  // }

  // ppt 10
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //       left: 60,
  //       right: 60,
  //       top: 20,
  //       bottom: 100,
  //     ),
  //     color: Colors.green,
  //     child: Container(
  //       color: Colors.black,
  //     ),
  //   );
  // }

  // ppt 11
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //       left: 60,
  //       right: 60,
  //       top: 20,
  //       bottom: 100,
  //     ),
  //     color: Colors.green,
  //     child: const Text(
  //       'Test Text',
  //       style: TextStyle(fontSize: 40),
  //     ),
  //     alignment: Alignment.topRight,
  //   );
  // }

  // ppt 12
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //       left: 80,
  //       right: 40,
  //       top: 20,
  //       bottom: 100,
  //     ),
  //     color: Colors.green,
  //     child: Container(
  //       constraints: const BoxConstraints(
  //           minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 200),
  //       color: Colors.yellow,
  //       child: const Text(
  //         'Test Text',
  //         style: TextStyle(fontSize: 40),
  //       ),
  //     ),
  //     alignment: Alignment.topRight,
  //   );
  // }

// ppt 13
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //       left: 80,
  //       right: 40,
  //       top: 20,
  //       bottom: 100,
  //     ),
  //     color: Colors.green,
  //     child: Container(
  //       padding: const EdgeInsets.all(20),
  //       constraints: const BoxConstraints(
  //           minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 200),
  //       color: Colors.yellow,
  //       child: const Text(
  //         'Test Text',
  //         style: TextStyle(fontSize: 40),
  //       ),
  //     ),
  //     alignment: Alignment.topRight,
  //   );
  // }

// ppt 14
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20), // 有白框
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text('Text 1'),
            color: Colors.red,
            constraints: const BoxConstraints(minHeight: 250),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Text 2'),
            color: Colors.green,
            constraints: const BoxConstraints(minHeight: 250),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Text 3'),
            color: Colors.blue,
            constraints: const BoxConstraints(minHeight: 250),
          ),
        ],
      ),
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
