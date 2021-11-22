import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/controllers/global_controller.dart';
import 'package:pokedex/app/global/styles.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalcontroller = Get.find<GlobalController>();
    return Center(
      child: TextButton(
        style: greybuttonStyle,
        onPressed: () {
          globalcontroller.toggleTheme();
        },
        child: Row(
          children: [
            Icon(
              CupertinoIcons.moon_fill,
              size: 20,
            ),
            Obx(() => Text(
                  globalcontroller.txtTheme.value,
                )),
          ],
        ),
      ),
    );
  }
}
