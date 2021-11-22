import 'package:flutter/material.dart';
import 'package:pokedex/app/global/widgets/logoff_button.dart';
import 'package:pokedex/app/global/widgets/theme_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 60,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
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
