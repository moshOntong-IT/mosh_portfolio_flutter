import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:mosh_portfolio_flutter/widget/skills_progress.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (_, constraint) {
        if (constraint.maxHeight >= 480) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: const [
                                Text(
                                  'Skills',
                                  style: TextStyle(
                                    fontSize: 95,
                                    color: Color(0xFFE6EFBF),
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    'Expertise',
                                    style: TextStyle(
                                      fontSize: 39,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SkillsProgess(
                          value: 60,
                          title: 'Flutter',
                        ),
                        SkillsProgess(
                          value: 85,
                          title: 'Figma',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SkillsProgess(
                          value: 20,
                          title: 'React JS',
                        ),
                        SkillsProgess(
                          value: 15,
                          title: 'Database (PostgreSQL, MongoDB, Firebase)',
                        )
                      ],
                    ),
                  ),
                ],
              ))
            ],
          );
        } else {
          return Column(
            children: [],
          );
        }
      },
    );
  }
}
