import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RoutePage()
    );
  }
}

class RoutePage extends StatelessWidget {
  const RoutePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Row(
            children: [Block('1'),Block('2')],
          ),
          Row(
            children: [Block('3'),Block('4'),Block('5')],
          ),
          Row(
            children: [
              Expanded(child: Block('6')),
              Expanded(child: Block('7')),
              Expanded(child: Block('8')),
            ],
          ),
        ],
      ),
    );
  }
}
class Block extends StatelessWidget {
  final String _text;
  const Block(this._text) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_text),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top:12,bottom: 12,left: 24,right:24),
      color: Colors.blue[200],
    );
  }
}
// // RoutePage StatefulWidget
// class RoutePage extends StatefulWidget {
//   const RoutePage({Key? key}) : super(key: key);

//   @override
//   _RoutePageState createState() => _RoutePageState();
// }

// class _RoutePageState extends State<RoutePage> {

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: HomeBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index){
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem( // Home
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem( // History
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // HomeBody StatelessWidget
// class HomeBody extends StatelessWidget {
//   const HomeBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Home'),
//       ],
//     );
//   }
// }

// // History StatelessWidget
// class History extends StatelessWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('History'),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'title',
//       home: Scaffold(
//         appBar: AppBar(),
//         body: HomeBody(),
//       ),
//     );
//   }
// }
// class HomeBody extends StatelessWidget {
//   const HomeBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Second Page'),
//         ElevatedButton(
//           onPressed: () {
//             // 按下按鈕要做的事
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SecondPage(
//                   name: 'H10', //跳頁傳值
//                 ),
//               ),
//             ).then((value) => debugPrint(value)); //接收返回的資料
//           },
//           child: Text('GoTo Second Page'),
//         )
//       ],
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   final String name;

//   const SecondPage({required this.name, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Page'),
//       ),
//       body: Column(
//         children: [
//           Text(name),
//           ElevatedButton(
//             onPressed: () {
//               // 按下按鈕要做的事
//               Navigator.pop(context,
//                   '您已按btn返回上頁'); //返回上頁時傳遞資料, Navigator.pop(context[, 要傳遞的資料])
//             },
//             child: Text('GoBack'),
//           )
//         ],
//       ),
//     );
//   }
// }


