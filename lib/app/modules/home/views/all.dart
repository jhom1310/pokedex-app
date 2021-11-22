import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/type_model.dart';
import 'package:pokedex/app/global/widgets/filter_button.dart';
import 'package:pokedex/app/global/widgets/my_grid_view.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class AllTView extends StatelessWidget {
  const AllTView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _filter(controller.typeslist),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: MyGridView(pokeList: controller.pokelist),
            ),
          ),
        ],
      ),
    );
  }

  _filter(List<TypePoke> list) {
    return Obx(() => Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var item in list)
                Container(
                  width: Get.width * 0.20,
                  padding: EdgeInsets.all(2),
                  child: FilterButton(
                    text: item.name,
                  ),
                ),
            ],
          ),
        ));
  }
}
