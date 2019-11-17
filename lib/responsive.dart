import 'package:flutter/material.dart';

class Responsive {
  static double debugPhoneHeight = 816.0;
  static double debugPhoneWidth = 432.0;

  static double responsiveHeight(BuildContext context, double height) {
    return ((height / debugPhoneHeight) * MediaQuery.of(context).size.height);
  }

  static double responsiveHeightFraction(BuildContext context, double height) {
    return (height / debugPhoneHeight);
  }

  static double responsiveWidth(BuildContext context, double width) {
    return ((width / debugPhoneWidth) * MediaQuery.of(context).size.width);
  }

  static double responsiveWidthFraction(BuildContext context, double width) {
    return (width / debugPhoneWidth);
  }

  static double responsiveRadius(BuildContext context, double radius) {
    return ((radius / (debugPhoneWidth / 2)) *
        (MediaQuery.of(context).size.width / 2));
  }
}
