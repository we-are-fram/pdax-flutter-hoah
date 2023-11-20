import 'package:flutter/material.dart';

import '../model/person.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.person,
    this.radius,
    this.fontSize,
  });

  final Person person;
  final double? radius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage:
          person.image == null ? null : NetworkImage(person.image!),
      child: Text(
        person.firstLetterName,
        style: fontSize == null ? null : TextStyle(fontSize: fontSize),
      ),
    );
  }
}
