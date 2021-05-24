import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onClicked,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      );
}
