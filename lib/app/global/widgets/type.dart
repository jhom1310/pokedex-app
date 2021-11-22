import 'package:flutter/material.dart';

class TypePoke extends StatelessWidget {
  final Color color;
  final String text;

  const TypePoke({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }
}
