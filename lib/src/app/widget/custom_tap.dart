import 'package:flutter/material.dart';

class CustomTap extends StatelessWidget {
  const CustomTap({
    required this.onTap,
    required this.child,
    super.key,
    this.isNormalClick = true,
  });

  final Function()? onTap;
  final Widget child;
  final bool isNormalClick;

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: Colors.transparent,
        enableFeedback: false,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          onTap!();
        },
        child: child,
      );
}
