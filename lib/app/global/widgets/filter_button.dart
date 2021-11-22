import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/styles.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class FilterButton extends StatelessWidget {
  final String text;
  const FilterButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return TextButton(
      style: borderButtonStyle,
      onPressed: () {
        controller.fetchPoketype(text);
      },
      child: Text(text),
    );
  }
}
