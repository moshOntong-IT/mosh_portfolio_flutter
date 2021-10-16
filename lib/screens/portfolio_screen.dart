import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PortfolioScreens extends StatefulWidget {
  const PortfolioScreens({Key? key}) : super(key: key);

  @override
  _PortfolioScreensState createState() => _PortfolioScreensState();
}

class _PortfolioScreensState extends State<PortfolioScreens> {
  final _mockUpImages = [
    'assets/images/mock-up-1.png',
    'assets/images/mock-up-2.png',
    'assets/images/mock-up-3.png',
    'assets/images/mock-up-4.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                                  'Portfolio',
                                  style: TextStyle(
                                    fontSize: 95,
                                    color: Color(0xFFE6EFBF),
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Text(
                                    'my works',
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
                child: CarouselSlider(
                  items: _mockUpImages
                      .map(
                        (e) => Image.asset(
                          e,
                          filterQuality: FilterQuality.high,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
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
