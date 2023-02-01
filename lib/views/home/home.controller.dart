import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var pageIndex = 0.obs;

  void selectedIndex(int value) => pageIndex.value = value;

  @override
  void onInit() {
    super.onInit();
  }
}
