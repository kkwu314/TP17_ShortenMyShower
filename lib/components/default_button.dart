import 'package:flutter/material.dart';
import 'package:shorten_my_shower/constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() press;
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
