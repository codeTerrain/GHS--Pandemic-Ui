import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:ghspandemic/ui/widgets/extensions.dart';

Widget search(
    {String hintText, String filter, TextEditingController controller}) {
  return Container(
    margin: EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kblack.withAlpha(20),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  suffixIcon: filter == null || filter == ""
                      ? Container(
                          height: 0.0,
                          width: 0.0,
                        )
                      : InkWell(
                          child: Icon(
                            Icons.clear,
                            color: kred,
                          ),
                          onTap: () {
                            controller.clear();
                          },
                        ),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                  prefixIcon: Icon(Icons.search, color: Colors.black54)),
            ),
          ),
        ),

        // _icon(Icons.filter_list, color: Colors.black54)
      ],
    ),
  );
}

Widget _icon(IconData icon, {Color color = iconColor}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(13)),
      //color: Theme.of(context).backgroundColor,
    ),
    child: Icon(
      icon,
      color: color,
    ),
  ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
}
