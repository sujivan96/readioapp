import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerTile extends StatelessWidget {
  final VoidCallback callback;
  final String icon;
  final String title;

  const CustomDrawerTile(
      {Key? key,
      required this.callback,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent),
          child: SvgPicture.asset(icon)),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onTap: callback,
    );
  }
}
