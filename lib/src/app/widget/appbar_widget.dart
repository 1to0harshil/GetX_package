import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme/custom_text_style.dart';
import '../core/theme/theme_helper.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.title,
    super.key,
    this.backIcon = false,
    this.onBack,
    this.editIcon = false,
    this.onEdit,
  });

  final String title;
  final bool backIcon;
  final bool editIcon;
  final Function()? onBack;
  final Function()? onEdit;

  @override
  Widget build(BuildContext context) => AppBar(
        leading: Visibility(
          visible: backIcon,
          child: IconButton(
            onPressed: onBack == null && backIcon ? Get.back : onBack,
            icon: Icon(
              Icons.arrow_back_ios,
              color: appTheme.whiteA700,
            ),
          ),
        ),
        title: Text(
          title,
          style: CustomTextStyles.bodyMediumWhiteA70001,
        ),
        actions: [
          Visibility(
            visible: editIcon,
            child: IconButton(
              onPressed: onEdit,
              icon: Icon(
                Icons.logout,
                color: appTheme.whiteA700,
              ),
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: backIcon,
        scrolledUnderElevation: 0,
        backgroundColor: appTheme.whiteA700,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
