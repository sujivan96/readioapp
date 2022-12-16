import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 130,
    title: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 20, top: 20),
      child: Image.asset(
        'assets/images/yugam logo.png',
        fit: BoxFit.fill,
        height: 100,
        alignment: Alignment.center,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Builder(
      builder: (context) => IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
  );
}
