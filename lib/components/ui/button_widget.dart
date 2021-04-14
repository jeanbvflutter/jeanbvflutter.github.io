import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => new Container(
        margin: EdgeInsets.only(top: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ButtonTheme(
            minWidth: 150.0,
            height: 50.0,
            child: ElevatedButton(
              child: Text(text,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.white)),
              onPressed: onClicked,
            ),
          ),
        ),
      );
}
