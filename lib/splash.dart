import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:yugam_radio/audio_player.dart';
import 'package:yugam_radio/constants.dart';
import 'package:yugam_radio/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

late final AudioPlayerHandler _audioHandler;

class _SplashState extends State<Splash> {
  bool isConnected = false;
  late StreamSubscription sub;

  Future<void> checkConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _audioHandler = await AudioService.init(
        builder: () => AudioPlayerHandlerImpl(),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
          androidNotificationChannelName: 'Audio playback',
          androidNotificationOngoing: true,
        ),
      );
      _navigatetohome();
    } else {
      setState(
        () {
          isConnected = false;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkConnect();
    sub = Connectivity().onConnectivityChanged.listen(
          (result) => {
            setState(
              () {
                isConnected = (result != ConnectivityResult.none);
              },
            ),
            if (result == ConnectivityResult.mobile ||
                result == ConnectivityResult.wifi)
              {checkConnect()}
          },
        );
  }

  @override
  void dispose() {
    super.dispose();
    sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  height: 40.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    color: isConnected
                        ? Colors.transparent
                        : const Color(0xFFEE4400),
                    child: isConnected
                        ? Row()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.wifi_off, color: Colors.white),
                              SizedBox(
                                width: 12.0,
                                height: 12.0,
                              ),
                              Text(
                                "No Internet Connection",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo1.png',
            ),
          ),
          const Spacer(),
          Row(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconData(0xe198, fontFamily: 'MaterialIcons'),
                color: Colors.white,
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${DateTime.now().year} '
                  '$userCompanyName',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    title: appTitle,
                    audioHandler: _audioHandler,
                  )));
    });

    Future.delayed(const Duration(milliseconds: 4), () {
      _audioHandler.play();
    });
  }
}
