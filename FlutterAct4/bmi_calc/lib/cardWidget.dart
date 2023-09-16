import 'package:flutter/material.dart';
import 'cardContent.dart';
import 'main.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;
  final Gender? selectedGender;
  final VoidCallback onTap;

  GenderCard(this.gender, this.selectedGender, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: gender == selectedGender
              ? (gender == Gender.female ? Colors.pink : Colors.blue)
              : Colors.grey[500],
          child: gender == Gender.female
              ? GenderCardContent(Icons.female, 'Female')
              : GenderCardContent(Icons.male, 'Male'),
        ),
      ),
    );
  }
}

class HeightCard extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  HeightCard(this.height, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HEIGHT'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$height', style: TextStyle(fontSize: 40)),
                Text('cm', style: TextStyle(fontSize: 20)),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 100.0,
              max: 220.0,
              onChanged: (double newValue) {
                onChanged(newValue.round());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WeightCard extends StatelessWidget {
  final int weight;
  final ValueChanged<int> onChanged;

  WeightCard(this.weight, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: WeightCardContent(
            weight: weight), // Using the modular content from CardContent
        // ... add the buttons to increase/decrease weight here ...
      ),
    );
  }
}

class AgeCard extends StatelessWidget {
  final int age;
  final ValueChanged<int> onChanged;

  AgeCard(this.age, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: AgeCardContent(
            age: age), // Using the modular content from CardContent
        // ... add the buttons to increase/decrease age here ...
      ),
    );
  }
}
