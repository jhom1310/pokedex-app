import 'package:get_storage/get_storage.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';

class Store {
  static Future<void> saveString(String key, String value) async {
    GetStorage().write(key, value);
  }

  static String getString(String key) {
    return GetStorage().read(key);
  }

  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    GetStorage().write(key, value);
  }

  static Future<Map<String, dynamic>?> getMap(String key) async {
    try {
      Map<String, dynamic> map = GetStorage().read(key);
      return map;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  static bool hasKey(String key) {
    return GetStorage().hasData(key);
  }

  static Future<void> clearStore() async {
    return GetStorage().erase();
  }

  static Future<void> remove(String key) async {
    return GetStorage().remove(key);
  }

  static Future saveFavorites(List list) =>
      GetStorage().write('favorites', list);

  static Future<List<Pokemon>> getFavorites() async {
    return GetStorage().read('favorites');
  }

  static List<dynamic>? getFavorites2() {
    return GetStorage().read('favorites');
  }
}
