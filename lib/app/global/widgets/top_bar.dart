import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class TopBar extends StatelessWidget {
  final Widget body1, body2, body3;
  const TopBar({
    Key? key,
    required this.body1,
    required this.body2,
    required this.body3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 4,
          elevation: 0,
          backgroundColor: Colors.white12,
          bottom: TabBar(
            //indicatorColor: Colors.black,
            tabs: [
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text("Favoritos "),
                    ),
                    Obx(() => Badge(
                          badgeColor: Colors.grey,
                          badgeContent: Text(
                            controller.countFavorites.string,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          alignment: Alignment.center,
                          position: BadgePosition.topEnd(),
                        )),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("Procurar"),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("Ver Todos"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [body1, body2, body3],
        ),
      ),
    );
  }
}
