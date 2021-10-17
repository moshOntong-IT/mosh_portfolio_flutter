import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/scroll_offset.dart';
import 'screens/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mosh Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: ChangeNotifierProvider<ScrollOffsetNotifier>(
        create: (context) => ScrollOffsetNotifier(),
        child: const HomeApp(),
      ),
      initialRoute: "",
    );
  }
}
