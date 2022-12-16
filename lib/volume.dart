import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class VolumeControl extends StatefulWidget {
  const VolumeControl({Key? key}) : super(key: key);

  @override
  State<VolumeControl> createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double _volumeListenerValue = 0;
  double _setVolumeValue = 0;

  @override
  void initState() {
    super.initState();
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });
    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 40,
            color: Colors.red,
            padding: const EdgeInsets.only(bottom: 0),
            icon: Icon(
              _volumeListenerValue <= 0
                  ? Icons.volume_mute_outlined
                  : Icons.volume_up_outlined,
            ),
            onPressed: () {},
          ),
          Flexible(
            child: Slider(
              min: 0,
              max: 1,
              onChanged: (double value) {
                _setVolumeValue = value;
                VolumeController().setVolume(_setVolumeValue);
              },
              value: _volumeListenerValue,
              activeColor: Colors.red,
              thumbColor: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
