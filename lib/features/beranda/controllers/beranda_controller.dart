import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../configs/routes/route.dart';
import '../../../shared/models/promo_model.dart';
import '../models/menu_model.dart';
import '../repositories/menu/menu_repository.dart';
import '../../../shared/repositories/promo/promo_repository.dart';

class BerandaController extends GetxController {
  static BerandaController get to => Get.find<BerandaController>();

  final RxList<MenuModel> menuItems = <MenuModel>[].obs;
  final RxList<PromoModel> promoItems = <PromoModel>[].obs;

  final RxList<MenuModel> menuItemsMinuman = <MenuModel>[].obs;
  final RxList<MenuModel> menuItemsMakanan = <MenuModel>[].obs;
  final RxList<MenuModel> menuItemsSnack = <MenuModel>[].obs;

  final RxString selectedcategory = 'all'.obs;
  final RxList<MenuModel> seleectedMenu = <MenuModel>[].obs;

  final List<String> category = ['All', 'Makanan', 'Minuman', "Snack"];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  late final MenuRepository menuRepository;
  late final PromoRepository promoRepository;

  final RxInt page = 0.obs;
  final RxBool canLoadMore = true.obs;
  final RxString keyword = ''.obs;

  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    menuRepository = MenuRepository();
    promoRepository = PromoRepository();
    onRefresh();
  }

  List<MenuModel> get filteredList {
    return menuItems
        .where((menu) =>
            menu.nama!.toLowerCase().contains(keyword.value.toLowerCase()) &&
            (selectedcategory.value == 'all' ||
                menu.kategori!.toLowerCase() == selectedcategory.value))
        .toList();
  }

/*
Code Bagian Menu
*/

  List<dynamic> pisahMenu(List<dynamic> menu) {
    for (var item in menu) {
      if (item.kategori!.toLowerCase() == "makanan") {
        menuItemsMakanan.add(item);
      } else if (item.kategori!.toLowerCase() == "minuman") {
        menuItemsMinuman.add(item);
      } else {
        menuItemsSnack.add(item);
      }
    }
    return [menuItemsMakanan, menuItemsMinuman];
  }

  Future<void> fetchMenuData() async {
    try {
      final data = await menuRepository.getAllMenu();

      menuItems.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch menu data: $e');
    }
  }

  Future<void> fetchMenuByCategory(String category) async {
    selectedcategory.value = category.toLowerCase();
    try {
      final data = await menuRepository.getMenuByCategory(category);
      seleectedMenu.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', "Failed to fetch menu data by category : $e");
    }
  }

/*
Code Bagian Promo
*/

  Future<void> fetchPromoData() async {
    try {
      final data = await promoRepository.getAllPromo();
      promoItems.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch promo data: $e");
    }
  }

  void onRefresh() async {
    await fetchMenuData();
    await fetchPromoData();
    update();

    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
    print("Peranda Controller : $index");
    switch (index) {
      case 0:
        Get.offNamed(Routes.berandaRoute);
        break;
      case 1:
        Get.offNamed(Routes.pesananRoute);
        break;
      case 2:
        Get.offNamed('/profil');
        break;
    }
  }
}
