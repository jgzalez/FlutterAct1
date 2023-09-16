import 'package:flutter/material.dart';
import 'cardWidget.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[850],
      ),
      home: InputPage(),
    );
  }
}

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Define the BMI calculation method
  double calculateBMI(int weight, int height) {
    return weight / (height / 100 * height / 100);
  }

// Define a method to get the message based on BMI
  String getBMIMessage(double bmi) {
    if (bmi < 18.5) {
      return "You're underweight!";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "You have a normal weight!";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "You're overweight!";
    } else {
      return "You're obese!";
    }
  }

  int height = 150;
  int age = 18;
  int weight = 60;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GenderCard(Gender.female, selectedGender, () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                }),
                GenderCard(Gender.male, selectedGender, () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                }),
              ],
            ),
          ),
          HeightCard(height, (newHeight) {
            setState(() {
              height = newHeight;
            });
          }),
          Expanded(
            child: Row(
              children: [
                WeightCard(weight, (newWeight) {
                  setState(() {
                    weight = newWeight;
                  });
                }),
                AgeCard(age, (newAge) {
                  setState(() {
                    age = newAge;
                  });
                }),
              ],
            ),
          ),
          // Button to Calculate
          ElevatedButton(
            onPressed: () {
              double bmiValue = calculateBMI(weight, height);
              String bmiMessage = getBMIMessage(bmiValue);

              // Pass these values to your ResultsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmiValue: bmiValue, recommendation: bmiMessage),
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
  final double bmiValue;
  final String recommendation;

  ResultsPage({required this.bmiValue, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI: ${bmiValue.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 40)),
            Text(recommendation, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
