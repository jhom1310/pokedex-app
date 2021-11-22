import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/database/storage.dart';
import 'package:pokedex/app/global/widgets/type.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class DetailView extends StatelessWidget {
  final Pokemon poke;
  const DetailView({Key? key, required this.poke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    var bFav = true.obs;
    var color = Colors.yellow.obs;
    var text = 'Adicionar aos favoritos'.obs;
    if (Store.hasKey(poke.name)) {
      bFav.value = true;
      color.value = Colors.red;
      text.value = 'Remover dos Favoritos';
    }

    void toggleFavorite() {
      if (bFav.value) {
        color.value = Colors.red;
        text.value = 'Remover dos Favoritos';
      } else {
        color.value = Colors.yellow;
        text.value = 'Adicionar aos favoritos';
      }
      bFav.value = !bFav.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              poke.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.grey[200],
                  child: Container(
                    child: Image.network(poke.sprites.frontDefault),
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  child: Container(
                    child: Image.network(poke.sprites.backDefault),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${poke.height.toString()}m',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 20),
                Text(
                  '${poke.weight.toString()}Kg',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in poke.types)
                  TypePoke(color: Colors.black45, text: item.type.name),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Estatisticas',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 15),
            for (var item in poke.stats)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.red,
                    margin: EdgeInsets.all(5),
                    child: Text(item.stat.name.toUpperCase()),
                  ),
                  SizedBox(width: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: LinearPercentIndicator(
                      width: Get.width * 0.50,
                      lineHeight: 14.0,
                      percent: 0.5,
                      backgroundColor: Colors.grey[200],
                      progressColor: Colors.yellow[700],
                      //leading: Text(item.stat.name.toUpperCase()),
                      trailing: Text(item.baseStat.toString()),
                    ),
                  ),
                ],
              ),
            Container(
              margin: EdgeInsets.all(50),
              alignment: Alignment.center,
              child: Obx(() => ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(color.value),
                    ),
                    onPressed: () {
                      toggleFavorite();
                      controller.addFavorites(poke);
                    },
                    child: Text(text.value),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
