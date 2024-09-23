import 'package:flutter/material.dart';

void main() => runApp(TipCalculatorApp());

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multi Calculator'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'DEBUG',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        body: TipCalculator(),
      ),
    );
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();
  double _result = 0.0;

  void _calculateTip() {
    double billAmount = double.tryParse(_billController.text) ?? 0.0;
    double tipPercentage = double.tryParse(_tipController.text) ?? 0.0;
    setState(() {
      _result = (billAmount * tipPercentage) / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text('BMI Calculator'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Tip Calculator'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Age Calculator'),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            controller: _billController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Bill Amount',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _tipController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Tip Percentage',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateTip,
            child: Text('Calculate Tip'),
          ),
          SizedBox(height: 20),
          Text(
            'Result: $_result',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}