import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:yugam_radio/constants.dart';

Future<void> openNativeApp({required NativeApps nativeApp}) async {
  String fbProtocolUrl = '';
  String fallbackUrl = '';
  switch (nativeApp) {
    case NativeApps.faceBook:
      fallbackUrl = 'https://www.facebook.com/yugammedia';
      Platform.isIOS
          ? fbProtocolUrl = 'fb://profile/yugammedia'
          : fbProtocolUrl = 'fb://page/yugammedia';
      break;
    case NativeApps.youtube:
      fallbackUrl = 'https://www.youtube.com/channel/UCUBut659es3vPaC20ecl3ew';
      Platform.isIOS
          ? fbProtocolUrl =
              'youtube://https://www.youtube.com/channel/UCUBut659es3vPaC20ecl3ew'
          : fbProtocolUrl =
              'youtube://https://www.youtube.com/channel/UCUBut659es3vPaC20ecl3ew';
      break;
    case NativeApps.instagram:
      fallbackUrl = 'https://www.instagram.com/';
      Platform.isIOS
          ? fbProtocolUrl = 'instagram://www.instagram.com'
          : fbProtocolUrl = 'instagram://www.instagram.com';
      break;
    default:
  }

  try {
    Uri fbBundleUri = Uri.parse(fbProtocolUrl);
    var canLaunchNatively = await canLaunchUrl(fbBundleUri);

    if (canLaunchNatively) {
      launchUrl(fbBundleUri);
    } else {
      await launchUrl(Uri.parse(fallbackUrl),
          mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    // Handle this as you prefer
  }
}

Future<void> openDeveloperSite() async {
  String url = developerUrl;

  try {
    Uri developerSiteUri = Uri.parse(url);
    var canLaunch = await canLaunchUrl(developerSiteUri);

    if (canLaunch) {
      launchUrl(developerSiteUri, mode: LaunchMode.externalApplication);
    } else {}
  } catch (e) {
    // Handle this as you prefer
  }
}
