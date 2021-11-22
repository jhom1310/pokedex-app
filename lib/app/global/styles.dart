import 'package:flutter/material.dart';

final blackStyle = TextStyle(
  color: Colors.black,
);

final greybuttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  ),
);

final borderButtonStyle = ButtonStyle(
  //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(color: Colors.grey),
    ),
  ),
);
