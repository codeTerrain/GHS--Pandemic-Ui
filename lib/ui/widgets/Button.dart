import 'package:ghspandemic/ui/shared/style.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonName;
  final Function onPressed;
  final Size size;
  RoundedButton({this.buttonName, this.onPressed, this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 50,
      child: FlatButton(
        color: kred,
        textColor: Theme.of(context).textTheme.button.color,
        onPressed: onPressed,
        child: Center(
            child: Text(
          buttonName,
          style: Theme.of(context).textTheme.display1.copyWith(color: kwhite),
        )),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  final Function onTap;
  final String text;
  final Widget icon;
  final double width;
  Button2({
    Key key,
    this.width = 100,
    this.onTap,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30,
          width: width,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            '$text',
            style: Theme.of(context).textTheme.display1.copyWith(color: kwhite),
          ))),
    );
  }
}
