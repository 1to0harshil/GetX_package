import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/product_list_widget.dart';
import '../../../widget/shimmer_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
      () => Scaffold(
        body: controller.isLoading.value
            ? shimmerWidget()
            : getProductListWidget(),
      ),
    );

  Widget getProductListWidget() => ProductListWidget(
      listData: controller.productList,
    ).paddingOnly(top: 10, right: 10, left: 10);

  Widget shimmerWidget() => const ShimmerWidget();
}
