import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final address = 'Davao City Jail Rd, Talomo, Davao City, Davao del Sur';
  final apiKey =
      'pk.eyJ1IjoibW9zaG9udG9uZ3VpYyIsImEiOiJja3V0eXU0YXUwaWlrMm9tcGRkdGlvOGo0In0.XgIY8myEV2-UQSUJ_69CNA';

  MapboxMapController _mapController;
  void onMapCreated(controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) {
        if (constraint.maxHeight >= 480) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: MapboxMap(
                          accessToken: apiKey,
                          onMapCreated: onMapCreated,
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(7.207573, 125.395874),
                          ),
                        ),
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
                                    'Contact',
                                    style: TextStyle(
                                      fontSize: 95,
                                      color: Color(0xFFE6EFBF),
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Text(
                                      'get in touch',
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
                          Expanded(
                            child: Column(
                              children: [
                                const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  minLines:
                                      6, // any number you need (It works as the rows for the textarea)
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    hintText: 'Message',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
