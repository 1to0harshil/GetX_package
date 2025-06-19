import 'package:get/get.dart';
import 'package:get_x_structure/src/app/core/live_network/base_getx_controller.dart';
import '../../../data/model/response_model/get_productlist_response_model.dart';
import '../../../utils/extensions.dart';
import '../../../utils/frequent.dart';

class HomeController extends BaseGetXController {
  RxList<Products> productList = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getProductListData();
  }

  Future<void> getProductListData() async {
    final failureOrSuccess = await commonRepository.getProductList();

    failureOrSuccess.fold((failure) {
      Frequent().failureHandle(failure);
      isLoading.value = false;
    }, (response) {
      productList.value = response.products;
      isLoading.value = false;
    });
  }
}
