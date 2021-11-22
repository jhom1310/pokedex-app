import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/widgets/item_card.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () => Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller.ctrlSearch,
              textInputAction: TextInputAction.search,
              onSubmitted: controller.teste(),
              decoration: InputDecoration(
                hintText: 'Pesquisar',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    controller.searchPokemon();
                  },
                ),
              ),
              //controller: ,
            ),
          ),
          controller.pokesearchlist.length > 0
              ? ItemCard(poke: controller.pokesearchlist[0])
              : Container(
                  alignment: Alignment.center,
                  child: Text('Clique na lupa para pesquisar'),
                )
        ],
      ),
    );
  }
}
