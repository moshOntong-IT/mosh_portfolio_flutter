import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (_, constraint) {
        if (constraint.maxHeight >= 480) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/illustrator-2.png',
                            height: size.height * 0.75,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: const [
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontSize: 95,
                                      color: Color(0xFFE6EFBF),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Text(
                                      'About me',
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
                          const SizedBox(height: 50),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                            ),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat'),
                                    text:
                                        "Hi! I'm Muslimin Ontong, and I'm currently learning about mobile development building and design. I'm also taking Angela's Udemy Flutter course. I am a core member of the ",
                                  ),
                                  TextSpan(
                                    text: 'Google Developer Student Club',
                                    mouseCursor: SystemMouseCursors.click,
                                    style: const TextStyle(
                                        height: 2,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFFAAC64),
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const url =
                                            'https://developers.google.com/profile/u/109688872650027456934';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                  ),
                                  const TextSpan(
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 20,
                                        fontFamily: 'Montserrat'),
                                    text:
                                        " at the University of Immaculate Conception. For the time being, I will do my job and accept your offer.",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
