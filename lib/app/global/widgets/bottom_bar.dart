import 'package:flutter/material.dart';
import 'package:pokedex/app/global/widgets/logoff_button.dart';
import 'package:pokedex/app/global/widgets/theme_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ThemeButton(),
          SizedBox(
            width: 150,
          ),
          LogoffButton(),
        ],
      ),
    );
  }
}
