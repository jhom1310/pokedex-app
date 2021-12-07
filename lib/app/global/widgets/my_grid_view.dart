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
    int count = 20;
    ScrollController scrollController = ScrollController();
    final controller = Get.find<HomeController>();
    scrollController.addListener(() {
      var triggerFetchMoreSize =
          0.5 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !controller.isFilter.value) {
        print('object');
        controller.attPokeList(controller.countPage.value);
        controller.countPage.value += 20;
        triggerFetchMoreSize = 2 * triggerFetchMoreSize;
      }
    });

    return Obx(
      () => GridView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: controller.isLoading.value
              ? pokeList.length + 20
              : pokeList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6),
          itemBuilder: (BuildContext context, int index) {
            if (pokeList.length <= index) {
              return Center(child: CircularProgressIndicator());
            }
            return ItemCard(
              poke: pokeList[index],
            );
          }),
    );
  }
}
