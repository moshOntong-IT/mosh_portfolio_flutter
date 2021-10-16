import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (_, constraint) {
        if (constraint.maxHeight >= 480) {
          return Column(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 60,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Hi! I am',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 60),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Muslimin',
                          style: TextStyle(
                            fontSize: 96,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4AC3BE),
                                  fontFamily: 'Montserrat',
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    RotateAnimatedText(
                                      'Mobile Developer',
                                    ),
                                    RotateAnimatedText('Software Developer'),
                                    RotateAnimatedText('UI/UX Designer')
                                  ],
                                  repeatForever: true,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              ', based in Philippines.',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 350,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Image.asset('assets/images/mouse.png'),
                              ),
                              const Expanded(
                                flex: 2,
                                child: Text(
                                  'Scroll down',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Color(0xFFFAAC64),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/illustrator-1.png',
                          height: size.height * 0.9,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
