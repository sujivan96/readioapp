import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yugam_radio/constants.dart';
import 'package:yugam_radio/launch_external_source.dart';
import 'package:yugam_radio/list_tile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
      backgroundColor: const Color(0xFF172230),
      elevation: 1.5,
      child: Column(children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFF141C27), Color(0xFF141C27)])),
          child: Column(children: <Widget>[
            Material(
              color: Colors.transparent,
              child: Image.asset(
                'assets/images/logo1.png',
              ),
            ),
          ]),
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            CustomDrawerTile(
              callback: () {
                openNativeApp(nativeApp: NativeApps.faceBook);
              },
              icon: "assets/icons/facebook.svg",
              title: "Facebook",
            ),
            CustomDrawerTile(
              callback: () {
                openNativeApp(nativeApp: NativeApps.youtube);
              },
              icon: "assets/icons/youtube.svg",
              title: "Youtube",
            ),
            // CustomDrawerTile(
            //   callback: () {
            //     openNativeApp(nativeApp: NativeApps.instagram);
            //   },
            //   icon: "assets/icons/instagram.svg",
            //   title: "Instagram",
            // ),
          ],
        )),
        const Divider(color: Colors.white),
        Container(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Developed By ',
                  ),
                  TextSpan(
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    text: 'Code2Futures PVT Ltd.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => openDeveloperSite(),
                  ),
                ],
              ),
            ))
      ]));
}
