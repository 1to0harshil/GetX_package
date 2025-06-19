import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_x_structure/src/app/data/model/response_model/get_productlist_response_model.dart';
import 'package:get_x_structure/src/app/utils/extensions.dart';
import 'package:get_x_structure/src/app/widget/custom_image_widget.dart';

import '../core/theme/custom_text_style.dart';
import '../core/theme/theme_helper.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    required this.listData,
    this.onTap,
    super.key,
  });

  final RxList<Products> listData;
  final Function(int id)? onTap;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: listData.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final productData = listData[index];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.screenHeight),
            child: Row(
              children: [
                productImageWidget(productData),
                2.screenWidth.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productTitleWidget(productData),
                      productBrandWidget(productData),
                    ],
                  ),
                ),
                // editProductWidget(productData),
                // deleteProductWidget(productData)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            appTheme.gray50.divider(d: 0.1.screenHeight),
      );

  Widget productImageWidget(productData) =>
      CustomImageWidget.imageNetworkWidget(
        productData.thumbnail,
        imgHeight: 50,
        imgWidth: 50,
        objectFit: BoxFit.fill,
      );

  Widget productTitleWidget(productData) => Text(
        productData.title ?? '',
        style: CustomTextStyles.bodyMediumWhiteA70001,
      );

  Widget productBrandWidget(productData) => Text(
        productData.brand ?? '',
        style: CustomTextStyles.bodyMediumWhiteA70001,
      );

  Widget editProductWidget(productData) => IconButton(
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        splashColor: theme.primaryColor.withValues(alpha:0.4),
        highlightColor: appTheme.gray50.withValues(alpha:0.4),
        icon: Icon(
          Icons.edit,
          color: theme.primaryColor,
        ),
        onPressed: () {},
      );

  Widget deleteProductWidget(productData) => IconButton(
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
        splashColor: appTheme.amber500.withValues(alpha: 0.4),
        highlightColor: appTheme.amber500.withValues(alpha: 0.4),
        icon: Icon(
          Icons.delete,
          color: appTheme.amber500,
        ),
        onPressed: () {},
      );
}
