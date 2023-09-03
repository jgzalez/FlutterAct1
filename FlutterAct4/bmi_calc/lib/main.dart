import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 150;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Female Card
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female),
                      Text('Female'),
                    ],
                  ),
                ),
                // Male Card
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.male),
                      Text('Male'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Height Slider Card
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$height',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      'cm',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 100.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Age Card
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE'),
                      Text('$age', style: TextStyle(fontSize: 40)),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Button to Calculate
          ElevatedButton(
  onPressed: () {
    // Navigation to Results Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(),
      ),
    );
  },
  child: Text('CALCULATE'),
),
        ],
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI: XX.X', style: TextStyle(fontSize: 40)),
            Text('Recommendation', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
