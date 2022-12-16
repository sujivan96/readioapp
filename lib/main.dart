import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yugam_radio/app_bar.dart';
import 'package:yugam_radio/audio_player.dart';
import 'package:yugam_radio/body.dart';
import 'package:yugam_radio/constants.dart';

import 'package:yugam_radio/navigation_drawer.dart';
import 'package:yugam_radio/splash.dart';

Future<void> main() async {
  runApp(const MyApp());
}

/// The app widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
          primaryColorDark: const Color(0x00141c27), primarySwatch: Colors.red),
      home: const Splash(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.title, required this.audioHandler});
  final String title;
  final AudioPlayerHandler audioHandler;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(),
        drawer: const NavigationDrawer(),
        body: Body(
          audioHandler: audioHandler,
        ));
  }
}
