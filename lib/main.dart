import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_flutter_flash/with_custom_hook.dart';
import 'package:hooks_flutter_flash/with_prebuilt_hooks.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
