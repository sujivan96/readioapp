import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:yugam_radio/audio_player.dart';
import 'package:yugam_radio/glow_button.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayerHandler audioHandler;

  const ControlButtons(this.audioHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<PlaybackState>(
          stream: audioHandler.playbackState,
          builder: (context, snapshot) {
            final playbackState = snapshot.data;
            final processingState = playbackState?.processingState;
            final playing = playbackState?.playing;
            if (processingState == AudioProcessingState.loading ||
                processingState == AudioProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return PlayButton(isPlaying: false, callback: audioHandler.play);
            } else {
              return PlayButton(isPlaying: true, callback: audioHandler.pause);
            }
          },
        ),
      ],
    );
  }
}
