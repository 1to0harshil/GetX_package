import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

mixin CustomImageWidget {
  static Image imageAssetWidget(
    String imgPath, {
    double? imgHeight,
    double? imgWidth,
  }) =>
      Image.asset(
        imgPath,
        height: imgHeight,
        width: imgWidth,
        fit: BoxFit.fill,
      );

  static Image imageMemoryWidget(
    Uint8List imgPath, {
    double? imgHeight,
    double? imgWidth,
  }) =>
      Image.memory(
        imgPath,
        height: imgHeight,
        width: imgWidth,
        fit: BoxFit.fill,
      );

  static Image imageFileWidget(
    String imgPath, {
    double? imgHeight,
    double? imgWidth,
  }) =>
      Image.file(
        File(imgPath),
        height: imgHeight,
        width: imgWidth,
        fit: BoxFit.fill,
      );

  static Image imageNetworkWidget(
    String imgPath, {
    double? imgHeight,
    double? imgWidth,
    BoxFit? objectFit,
  }) =>
      Image.network(
        imgPath,
        height: imgHeight,
        width: imgWidth,
        fit: objectFit ?? BoxFit.fill,
      );
}
