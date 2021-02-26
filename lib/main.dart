import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'result.dart';
import 'input.dart';
import 'convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamor = 0;
  final inputController = TextEditingController();

  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      _kelvin = _inputUser + 273;
      _reamor = (4 / 5) * _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Konverter Suhu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Input(inputController: inputController),
                Result(kelvin: _kelvin, reamor: _reamor),
                Convert(konvertHandler: _konversiSuhu),
              ],
            ),
          ),
        ));
  }
}
