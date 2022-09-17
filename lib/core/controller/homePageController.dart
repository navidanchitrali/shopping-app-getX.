import 'package:get/get.dart';
import 'package:shopping_app_getx/core/models/ItemModel.dart';
import 'package:shopping_app_getx/core/services/itemService.dart';

class HomePageController extends GetxController {
  ItemServices itemServices = ItemServices();
  List<ShoppingItem> items = [];
  List<ShoppingItem> cartItems = [];
  bool isLoading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadDB();
  }

  loadDB() async {
    await itemServices.openDB();
    loadItems();
    getCardList();
  }

  getItem(int id) {
    return items.singleWhere((element) => element.id == id);
  }

  bool isAlreadyInCart(id) {
    return cartItems.indexWhere((element) => element.shopId == id) > -1;
  }

  getCardList() async {
    try {
      List list = await itemServices.getCartList();
      cartItems.clear();
      list.forEach((element) {
        cartItems.add(ShoppingItem.fromJson(element));
      });
      update();
    } catch (e) {
      print(e);
    }
  }

  loadItems() async {
    try {
      isLoading = true;
      update();

      List list = await itemServices.loadItems();
      list.forEach((element) {
        items.add(ShoppingItem.fromJson(element));
      });

      isLoading = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  setToFav(int id, bool flag) async {
    int index = items.indexWhere((element) => element.id == id);

    items[index].fav = flag;
    update();
    try {
      await itemServices.setItemAsFavourite(id, flag);
    } catch (e) {
      print(e);
    }
  }

  Future addToCart(ShoppingItem item) async {
    isLoading = true;
    update();
    var result = await itemServices.addToCart(item);
    isLoading = false;
    update();
    return result;
  }

  removeFromCart(int shopId) async {
    itemServices.removeFromCart(shopId);
    int index = cartItems.indexWhere((element) => element.shopId == shopId);
    cartItems.removeAt(index);
    update();
  }
}
