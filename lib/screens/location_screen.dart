import 'package:flutter/material.dart';
import 'package:mosh_portfolio_flutter/widget/map.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) {
        if (constraint.maxHeight >= 480) {
          return Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: GoogleMap(),
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
