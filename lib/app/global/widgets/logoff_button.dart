import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/styles.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class LogoffButton extends StatelessWidget {
  const LogoffButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Center(
      child: TextButton(
        style: borderButtonStyle,
        onPressed: () async {
          controller.logoff();
        },
        child: Row(
          children: [
            Text(
              'Sair',
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.exit_to_app,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
