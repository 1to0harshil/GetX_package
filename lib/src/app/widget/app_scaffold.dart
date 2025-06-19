import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.bottomNavigation,
    this.backgroundColor = const Color(0xFFF9F7F3),
    this.statusBarBackgroundColor = const Color(0xFFFFFFFF),
    this.isDark = true,
    this.absorbing = false,
    this.bottomPadding = false,
  });

  final Widget body;
  final Widget? bottomNavigation;
  final Color? backgroundColor;
  final Color? statusBarBackgroundColor;
  final bool isDark;
  final bool absorbing;
  final bool bottomPadding;

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        bottom: bottomPadding,
        child: AbsorbPointer(
          absorbing: absorbing,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: statusBarBackgroundColor,
              systemOverlayStyle: (!isDark)
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark,
            ),
            backgroundColor: backgroundColor,
            body: body,
            bottomNavigationBar: bottomNavigation,
          ),
        ),
      );
}
