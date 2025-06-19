import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget paddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Widget paddingVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget paddingHV(double pHorizontal, double pVertical) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: pHorizontal, vertical: pVertical),
        child: this,
      );

  Widget paddingLeft(double padding) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: this,
      );

  Widget paddingRight(double padding) => Padding(
        padding: EdgeInsets.only(right: padding),
        child: this,
      );

  Widget paddingTop(double padding) => Padding(
        padding: EdgeInsets.only(top: padding),
        child: this,
      );

  Widget paddingBottom(double padding) => Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );

  Widget paddingLTRB(
    double pLeft,
    double pTop,
    double pRight,
    double pBottom,
  ) =>
      Padding(
        padding: EdgeInsets.only(
          left: pLeft,
          top: pTop,
          right: pRight,
          bottom: pBottom,
        ),
        child: this,
      );
}
