import 'package:flutter/material.dart';

class WeightCardContent extends StatelessWidget {
  final int weight;

  WeightCardContent({required this.weight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('WEIGHT', style: TextStyle(fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$weight', style: TextStyle(fontSize: 40)),
            SizedBox(width: 5),
            Text('kg', style: TextStyle(fontSize: 20)),
          ],
        ),
        // You might want to include buttons or gestures here to adjust the weight.
      ],
    );
  }
}

class AgeCardContent extends StatelessWidget {
  final int age;

  AgeCardContent({required this.age});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Age', style: TextStyle(fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$age', style: TextStyle(fontSize: 40)),
            SizedBox(width: 5),
            Text('yrs', style: TextStyle(fontSize: 20)),
          ],
        ),
        // You might want to include buttons or gestures here to adjust the age.
      ],
    );
  }
}

// Assuming you might also have a GenderCardContent here (based on previous references).
// If you already have this in another file, you can ignore this.
class GenderCardContent extends StatelessWidget {
  final IconData iconData;
  final String genderText;

  GenderCardContent(this.iconData, this.genderText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 72, color: Colors.white),
        Text(genderText),
      ],
    );
  }
}
