import 'package:flutter/material.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';

class Connect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: UiSpacing.fullWidth(context) / 1.10,
        child: Column(children: <Widget>[
          connectTile(context,
              connectType: 'Facebook', image: "assets/images/social/fb.png"),
          UiSpacing.verticalSpacingTiny(),
          connectTile(context,
              connectType: 'Twitter',
              image: "assets/images/social/twitter.png"),
          UiSpacing.verticalSpacingTiny(),
          connectTile(context,
              connectType: 'Whatsapp',
              image: "assets/images/social/whatsapp.png",
              scale: 20),
          UiSpacing.verticalSpacingTiny(),
          connectTile(context,
              connectType: 'Ghana Health Service',
              image: "assets/images/social/linker.png",
              scale: 18),
          UiSpacing.verticalSpacingTiny(),
          connectTile(context,
              connectType: 'p@ghanahealthservice.org',
              image: "assets/images/social/mailer.png",
              scale: 8),
          UiSpacing.verticalSpacingTiny(),
          connectTile(
            context,
            connectType: 'Toll Free',
            image: "assets/images/social/toll.png",
          ),
        ]));
  }

  ListTile connectTile(BuildContext context,
      {Function onTap, String connectType, String image, double scale}) {
    return ListTile(
        leading: Image.asset(
          image,
          scale: scale != null ? scale : 13,
        ),
        title: Text(
          connectType,
          style: Theme.of(context).textTheme.body2.copyWith(color: kgrey),
        ),
        onTap: onTap);
  }
}
