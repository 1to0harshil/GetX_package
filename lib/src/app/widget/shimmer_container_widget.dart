import 'package:flutter/material.dart';

import '../core/theme/theme_helper.dart';

class ShimmerContainer {
  Widget shimmerContainerWidget() => Container(
      width: double.infinity,
      height: 8,
      color: appTheme.whiteA700,
    );
}
