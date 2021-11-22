import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/global/widgets/item_card.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class MyGridView extends StatelessWidget {
  final List<Pokemon> pokeList;
  const MyGridView({
    Key? key,
    required this.pokeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() => controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: pokeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard(
              poke: pokeList[index],
            ),
          ));
  }
}
