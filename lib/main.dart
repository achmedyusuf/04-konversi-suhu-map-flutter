import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu/statelesswidget/convert.dart';
import 'package:konversi_suhu/statelesswidget/input.dart';
import 'package:konversi_suhu/statelesswidget/output.dart';
import 'package:konversi_suhu/statelesswidget/lihatHasil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List listHasil = [];
  double _inputUser = 0;
  double _kelvin = 0;
  double _celcius = 0;
  double _reamur = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  var listItem = ["Kelvin", "Reamur"];
  //(void _konversiSuhu() {
  //setState(() {
  //_celcius = double.parse(_inputUser.text);
  //_reamur = (4 * _celcius) / 5;
  //_kelvin = _celcius + 273;
  //});
  //}

  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputUser: inputController),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
              ),
              Result(
                result: _result,
              ),
              newMethod(),
              Convert(
                convertHandler: _konversiSuhu,
              ),
              ListHasil(listHasil: listHasil)
            ],
          ),
        ),
      ),
    );
  }

  void dropdownOnChanged(changeValue) {
    setState(() {
      _newValue = changeValue;
    });
  }

  Text newMethod() => Text('Achmed Yusuf (2031710128)');
}
