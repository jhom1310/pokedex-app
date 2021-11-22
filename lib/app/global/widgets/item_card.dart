import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/database/storage.dart';
import 'package:pokedex/app/global/widgets/type.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';
import 'package:pokedex/app/modules/home/views/detail.dart';

class ItemCard extends StatelessWidget {
  final Pokemon poke;
  const ItemCard({Key? key, required this.poke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    var iconFav = true.obs;
    var icon = Icon(CupertinoIcons.heart).obs;
    if (Store.hasKey(poke.name)) {
      iconFav = true.obs;
      icon.value = Icon(CupertinoIcons.heart_fill);
    }

    void toggleFavorite() {
      iconFav.value
          ? icon.value = Icon(CupertinoIcons.heart_fill)
          : icon.value = Icon(CupertinoIcons.heart);
      iconFav.value = !iconFav.value;
    }

    return Card(
      child: Container(
        width: Get.width * 0.40,
        height: Get.height * 0.30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          //color: Colors.grey[100],
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.network(
                poke.sprites.frontDefault,
                scale: 0.7,
              ),
            ),
            Obx(() => Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      toggleFavorite();
                      controller.addFavorites(poke);
                    },
                    icon: icon.value,
                    color: Colors.red,
                  ),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    poke.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Id: ${poke.id.toString()}'),
                  Row(
                    children: [
                      for (var item in poke.types)
                        TypePoke(color: Colors.black45, text: item.type.name),
                    ],
                  ),
                  Container(
                    width: 250,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(DetailView(poke: poke));
                      },
                      child: Text('Ver Detalhes'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
