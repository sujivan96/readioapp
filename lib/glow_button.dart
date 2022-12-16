import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

//ignore: must_be_immutable
class PlayButton extends StatelessWidget {
  final VoidCallback callback;
  bool isPlaying = false;

  PlayButton({Key? key, required this.callback, required this.isPlaying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: const Duration(milliseconds: 0),
      glowColor: Colors.white,
      endRadius: 90.0,
      duration: const Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: const Duration(milliseconds: 100),
      animate: isPlaying,
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 35,
        child: IconButton(
          iconSize: 40,
          alignment: Alignment.center,
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: callback,
        ),
      ),
    );
  }
}
