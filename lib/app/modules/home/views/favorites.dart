import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/styles.dart';
import 'package:pokedex/app/global/widgets/item_card.dart';
import 'package:pokedex/app/global/widgets/my_grid_view.dart';
import 'package:pokedex/app/global/widgets/my_top_bar.dart';
import 'package:pokedex/app/global/widgets/theme_button.dart';
import 'package:pokedex/app/global/widgets/top_bar.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';
import 'package:pokedex/app/modules/home/views/all.dart';
import 'package:pokedex/app/modules/home/views/search.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return controller.countFavorites > 0 ? _body() : _bodyempty();
  }

  _bodyempty() {
    final controller = Get.find<HomeController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/vazio.png'),
        Text(
          'Está meio vazio por aqui!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: 10),
        Text(
          'Procure por pokémons para adiciona-los\nao seus favoritos',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            // MyTopBar._myTabbedPageKey.currentState._tabController.animateTo(2);
            controller.tabController.animateTo(1);
          },
          child: Text('Procurar pokémons'),
          style: borderButtonStyle,
        ),
      ],
    );
  }

  _body() {
    final controller = Get.find<HomeController>();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: MyGridView(
                pokeList: controller.pokefavlist,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
