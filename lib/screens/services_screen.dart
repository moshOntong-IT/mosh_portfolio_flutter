import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final servicesImage = [
    'assets/images/illustrator-3.png',
    'assets/images/illustrator-4.png',
    'assets/images/illustrator-5.png'
  ];
  final servicesCaption = ['Mobile Design', 'Build Mobile', 'Web to Mobile'];
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
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: servicesImage.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 4),
                              blurRadius: 1,
                              spreadRadius: 0.5,
                            )
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  servicesImage[index],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  servicesCaption[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
