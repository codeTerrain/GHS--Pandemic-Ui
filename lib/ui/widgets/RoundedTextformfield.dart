import 'package:ghspandemic/ui/shared/style.dart';
import 'package:flutter/material.dart';

class RoundedTextformfield extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final IconData suffixicon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function onsaved;
  final Function onChanged;
  final Function validation;
  final bool expands;
  RoundedTextformfield({
    this.labelText,
    this.icon,
    this.suffixicon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onsaved,
    this.validation,
    this.onChanged,
    this.expands = false,
  });

  @override
  _RoundedTextformfieldState createState() => _RoundedTextformfieldState();
}

class _RoundedTextformfieldState extends State<RoundedTextformfield> {
  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: kgreyDim)),
      child: TextFormField(
        autofocus: false,
        onChanged: widget.onChanged,
        controller: widget.controller,
        onSaved: widget.onsaved,
        validator: widget.validation,
        obscureText: _obscureText,
        expands: widget.expands,
        maxLines: null,
        minLines: null,
        keyboardType: widget.keyboardType,
        style: TextStyle(fontSize: 16, color: kblack),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelStyle: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: primaryColor, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: widget.labelText == "Email Address" ||
                    widget.labelText == "Email"
                ? Image.asset(
                    "assets/images/textFieldIcons/user.png",
                    height: 1,
                    color: secondaryColor,
                  )
                : (widget.labelText == "Password"
                    ? Image.asset(
                        "assets/images/textFieldIcons/passlock.png",
                        color: primaryColor,
                        height: 1,
                      )
                    : null),
          ),
          suffixIcon: widget.labelText == "Password"
              ? IconButton(
                  onPressed: () {
                    _toggle();
                  },
                  icon: Icon(
                      _obscureText == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: primaryColor),
                )
              : (widget.suffixicon != null ? widget.suffixicon : null),
          labelText: widget.labelText != null ? widget.labelText : null,
          contentPadding: new EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.011,
              horizontal: 15.0),
        ),
        onFieldSubmitted: (String value) {},
      ),
    );
  }
}
