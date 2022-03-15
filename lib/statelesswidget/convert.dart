import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function convertHandler;
  const Convert({Key? key, required this.convertHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        convertHandler();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50), primary: Colors.green),
      child: const Text('Konversi Suhu'),
    );
  }
}
