import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex/app/global/bindings/global_binding.dart';
import 'package:pokedex/app/global/themes.dart';

import 'app/database/storage.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
    ),
  );
}
