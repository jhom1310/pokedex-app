import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/widgets/bottom_bar.dart';
import 'package:pokedex/app/global/widgets/my_top_bar.dart';
import 'package:pokedex/app/modules/home/views/all.dart';
import 'package:pokedex/app/modules/home/views/favorites.dart';
import 'package:pokedex/app/modules/home/views/search.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/pokemon.png',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: MyTopBar(
        body1: FavoritesView(),
        body2: SearchView(),
        body3: AllTView(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
