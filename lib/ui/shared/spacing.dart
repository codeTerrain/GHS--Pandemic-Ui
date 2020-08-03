import 'package:flutter/material.dart';

class UiSpacing {
  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Widget verticalSpacingTiny() {
    return SizedBox(
      height: 10,
    );
  }

  static Widget verticalSpacingSmall() {
    return SizedBox(
      height: 20,
    );
  }

  static Widget verticalSpacingMedium() {
    return SizedBox(
      height: 40,
    );
  }

  static Widget verticalSpacingLarge() {
    return SizedBox(
      height: 70,
    );
  }

  static Widget horizontalSpacingLarge() {
    return SizedBox(
      width: 70,
    );
  }

  static Widget horizontalSpacingMedium() {
    return SizedBox(
      width: 70,
    );
  }

  static Widget horizontalSpacingSmall() {
    return SizedBox(
      width: 20,
    );
  }

  static Widget horizontalSpacingTiny() {
    return SizedBox(
      width: 10,
    );
  }

  static Widget horizontalSpacingVeryTiny() {
    return SizedBox(
      width: 5,
    );
  }
}
