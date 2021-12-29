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

// class RoutePage extends StatefulWidget {
//   const RoutePage({ Key? key }) : super(key: key);

//   @override
//   _RoutePageState createState() => _RoutePageState();
// }

// class _RoutePageState extends State<RoutePage> {
//   var _btn = 1;
//   var btnT = ['A','B','C','D'];
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> btns = [];
//     for(int i=0;i<_btn;i++){
//       btns.add(ElevatedButton(
//         onPressed: addBtn, 
//         child: Text(
//         '${btnT[i]}${i+1}',
//         ),
//       ));
//     }
//     return Column(
//       children: btns,
//     );
//   }
//   void addBtn(){
//     if(this._btn<btnT.length-1){
//       setState(() {
//         this._btn++;
//       });
//     }
//   }
// }


// class RoutePage extends StatelessWidget {
//   const RoutePage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children:[
//           Row(
//             children: [Block('1'),Block('2')],
//           ),
//           Row(
//             children: [Block('3'),Block('4'),Block('5')],
//           ),
//           Row(
//             children: [
//               Expanded(child: Block('6')),
//               Expanded(child: Block('7')),
//               Expanded(child: Block('8')),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// class Block extends StatelessWidget {
//   final String _text;
//   const Block(this._text) : super();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(_text),
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.only(top:12,bottom: 12,left: 24,right:24),
//       color: Colors.blue[200],
//     );
//   }
// }