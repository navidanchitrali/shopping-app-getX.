import 'package:shopping_app_getx/core/models/ItemModel.dart';
import 'package:shopping_app_getx/core/services/sqlService.dart';
import 'package:shopping_app_getx/core/services/storageService.dart';

class ItemServices {
  SQLService sqlService = SQLService();
  StorageService storageService = StorageService();
  List<ShoppingItem> shoppingList = [];

  List<ShoppingItem> getShoppingItems() {
    int count = 1;
    data.forEach((element) {
      element['id'] = count;
      shoppingList.add(ShoppingItem.fromJson(element));
      count++;
    });
    return shoppingList;
  }

  List<ShoppingItem> get items => getShoppingItems();

  Future openDB() async {
    return await sqlService.openDB();
  }

  loadItems() async {
    bool isFirst = await isFirstTime();

    if (isFirst) {
      // Load From local DB
      List items = await getLocalDBRecord();
      return items;
    } else {
      // Save Record into DB & load record
      List items = await saveToLocalDB();
      return items;
    }
  }

  Future<bool> isFirstTime() async {
    return await storageService.getItem("isFirstTime") == 'true';
  }

  Future saveToLocalDB() async {
    List<ShoppingItem> items = this.items;
    for (var i = 0; i < items.length; i++) {
      await sqlService.saveRecord(items[i]);
    }
    storageService.setItem("isFirstTime", "true");
    return await getLocalDBRecord();
  }

  Future getLocalDBRecord() async {
    return await sqlService.getItemsRecord();
  }

  Future setItemAsFavourite(id, flag) async {
    return await sqlService.setItemAsFavourite(id, flag);
  }

  Future addToCart(ShoppingItem data) async {
    return await sqlService.addToCart(data);
  }

  Future getCartList() async {
    return await sqlService.getCartList();
  }

  removeFromCart(int shopId) async {
    return await sqlService.removeFromCart(shopId);
  }
}
