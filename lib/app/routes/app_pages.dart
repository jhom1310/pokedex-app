import 'package:get/get.dart';
import 'package:pokedex/app/database/storage.dart';
import 'package:pokedex/app/database/storage_keys.dart';

import 'package:pokedex/app/modules/home/bindings/home_binding.dart';
import 'package:pokedex/app/modules/home/views/home_view.dart';
import 'package:pokedex/app/modules/login/bindings/login_binding.dart';
import 'package:pokedex/app/modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL =
      Store.hasKey(StoreKeys.TOKEN) ? Routes.HOME : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
