import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const List<String> _quoteList = [
    'เวลาที่ดีที่สุด คือ เวลามีเงิน',
    'ฤกษ์ที่ดี คือ เลิกงานกลับบ้านได้',
    'ปีนี้เราจะเสียน้ำตาให้กับ ATK เท่านั้น',
    'อิจฉาหวย ที่ได้กินเธอ',
    'นอกจากปากดี ก็ไม่มีอะไรดีแล้ว',
  ];

  static const List<Color> _colorList = [
    Colors.green,Colors.deepOrange
  ];

  var _quote = _quoteList[0]; // state variable
  var _color = _colorList[0];

  void _handleClickGo() {

    var rand = Random();
    var newQuote;
    var newColor;
    while (true) {
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
      if(newQuote!=_quote){
        break;
    }
  }
  while(true){
      var randomcolor = rand.nextInt(_colorList.length);
      newColor = _colorList[randomcolor];
      if(newColor!=_color){
        break;
      }
  }
    setState((){
      _quote = newQuote;
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text('คำคมกวนๆ')),
        floatingActionButton: FloatingActionButton(
          onPressed: _handleClickGo,
          child: const Center(
            child: Text(
              'Next Quote',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              _quote, // positional parameter/argument
              // named parameter/argument
              style: TextStyle(
                fontSize: 50,
                color: _color,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
    );
  }
}
