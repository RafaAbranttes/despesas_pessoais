import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : RaisedButton(
            child: Text(label),
            onPressed: onPressed,
            color: Colors.orange,
            textColor: Colors.white,
          );
  }
}
