import 'package:flutter/material.dart';
import 'package:yugam_radio/audio_player.dart';
import 'package:yugam_radio/constants.dart';
import 'package:yugam_radio/controls_buttons.dart';
import 'package:yugam_radio/volume.dart';

class Body extends StatelessWidget {
  final AudioPlayerHandler audioHandler;

  const Body({Key? key, required this.audioHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // MediaItem display
            Expanded(child: Container()),
            // Playback controls
            ControlButtons(audioHandler),

            const VolumeControl(),

            // Ads banner
            SizedBox(
              height: 240.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    width: MediaQuery.of(context).size.width - 30,
                    height: 160,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(adBannerUrl),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
