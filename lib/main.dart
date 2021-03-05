import 'package:flutter/material.dart';
import 'result.dart';
import 'input.dart';
import 'convert.dart';
import 'riwayatkonversi.dart';
import 'dropdown.dart';

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
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;

  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
      listViewItem.add("$_newValue : $_result");
    });
  }

  void dropDownOnChange(String changeValue) {
    setState(() {
      _newValue = changeValue;
      _konversiSuhu();
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
                dropdown(
                  listItem: listItem,
                  newValue: _newValue,
                  dropDownOnChange: dropDownOnChange,
                ),
                Result(result: _result),
                Convert(konvertHandler: _konversiSuhu),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: RiwayatKonversi(listViewItem: listViewItem),
                ),
              ],
            ),
          ),
        ));
  }
}
