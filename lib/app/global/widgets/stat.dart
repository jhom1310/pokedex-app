import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/global/widgets/stats_bar.dart';

class Stat extends StatelessWidget {
  const Stat({
    required this.label,
    required this.value,
  });

  final String label;

  final num value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              label,
            ),
          ),
          Expanded(
            flex: 5,
            child: ProgressBar(
              progress: value / 100,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('$value'),
          ),
        ],
      ),
    );
  }
}
