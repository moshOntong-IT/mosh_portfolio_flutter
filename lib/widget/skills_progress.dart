import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class SkillsProgess extends StatelessWidget {
  final String title;
  final int value;
  const SkillsProgess({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Montserrat',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: FAProgressBar(
            currentValue: value,
            progressColor: const Color(0xFFFAAC64),
            backgroundColor: Colors.white,
            displayText: '%',
          ),
        ),
      ],
    );
  }
}
