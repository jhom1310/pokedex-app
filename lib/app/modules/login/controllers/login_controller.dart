import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/database/storage.dart';
import 'package:pokedex/app/database/storage_keys.dart';
import 'package:pokedex/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();

  void logar() {
    Store.saveString(StoreKeys.TOKEN, ctrlPass.text);
    Get.offNamed(Routes.HOME);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
