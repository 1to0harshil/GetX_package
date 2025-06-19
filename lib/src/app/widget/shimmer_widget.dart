import 'package:flutter/material.dart';
import 'package:get_x_structure/src/app/utils/extensions.dart';
import 'package:get_x_structure/src/app/widget/custom_padding_widget.dart';
import 'package:get_x_structure/src/app/widget/shimmer_container_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../core/theme/theme_helper.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appTheme.whiteA700,
                  ),
                ),
              ),
              2.screenWidth.width,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShimmerContainer().shimmerContainerWidget(),
                    1.screenHeight.height,
                    ShimmerContainer().shimmerContainerWidget(),
                  ],
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) =>
              appTheme.gray50.divider(d: 0.1.screenHeight),
        ).paddingAll(10),
      );
}
