import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('結果：',),
                ],
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      buildExpanded(child: buildText(1, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(2, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(3, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(2, ColorType.black), colorType: ColorType.grey),
                    ],
                  ),
                  Row(
                      children: [
                       buildExpanded(child: buildText(4, ColorType.black), colorType: ColorType.white),
                       buildExpanded(child: buildText(5, ColorType.black), colorType: ColorType.white),
                       buildExpanded(child: buildText(6, ColorType.black), colorType: ColorType.white),
                       buildExpanded(child: buildText(6, ColorType.black), colorType: ColorType.grey),
                      ],
                  ),
                  Row(
                    children: [
                      buildExpanded(child: buildText(7, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(8, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(9, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(9, ColorType.black), colorType: ColorType.grey),
                    ],
                  ),
                  Row(
                    children: [
                      buildExpanded(child: buildText(0, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(0, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(0, ColorType.black), colorType: ColorType.white),
                      buildExpanded(child: buildText(0, ColorType.white), colorType: ColorType.blue),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Expanded buildExpanded({required Widget child, required ColorType colorType}){
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Container(
            child: AspectRatio(
              aspectRatio: 1.618 / 0.75,
              child: Container(
                color: getBackgroundColor(colorType),
                alignment: Alignment.center,
                child: child,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: getBackgroundColor(colorType),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
    );
  }

  Text buildText(int num, ColorType colorType){
    return Text(
      '$num',
      style: TextStyle(fontSize: 20, color: getTextColor(colorType)),
    );
  }

  Color getBackgroundColor(ColorType colorType){
    Color _color = Colors.white;
    switch (colorType){
      case ColorType.white:
        _color = Colors.white;
        break;
      case ColorType.grey:
        _color = Colors.grey.withOpacity(0.3);
        break;
      case ColorType.blue:
        _color = Colors.blue;
        break;
    }
    return _color;
  }

  Color getTextColor(ColorType colorType){
    Color _color = Colors.black;
    switch(colorType){
      case ColorType.black:
        _color = Colors.black;
        break;
      case ColorType.white:
        _color = Colors.white;
        break;
    }
    return _color;
  }
}

enum MethodType {
  number, operator
}

enum ColorType {
  white,
  grey,
  blue,
  black
}