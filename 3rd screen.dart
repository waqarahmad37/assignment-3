import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    BmiCalculator(),
    TipCalculator(),
    AgeCalculator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Calculator'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: 'BMI Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Tip Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Age Calculator'),
        ],
      ),
    );
  }
}

// BMI Calculator Widget
class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('BMI Calculator'),
    );
  }
}

// Tip Calculator Widget
class TipCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tip Calculator'),
    );
  }
}

// Age Calculator Widget
class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final TextEditingController _dateController = TextEditingController();
  int _age = 0;

  void _calculateAge() {
    DateTime birthDate = DateTime.parse(_dateController.text);
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    setState(() {
      _age = age;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'Enter Birthdate (YYYY-MM-DD)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateAge,
            child: Text('Calculate Age'),
          ),
          SizedBox(height: 20),
          Text('Result: $_age', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}