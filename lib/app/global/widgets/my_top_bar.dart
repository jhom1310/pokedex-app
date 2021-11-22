// ignore_for_file: unnecessary_new

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class MyTopBar extends StatefulWidget {
  final Widget body1, body2, body3;
  const MyTopBar({
    Key? key,
    required this.body1,
    required this.body2,
    required this.body3,
  }) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTopBar>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 4,
        elevation: 0,
        backgroundColor: Colors.white12,
        bottom: TabBar(
          controller: controller.tabController,
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
        controller: controller.tabController,
        children: [widget.body1, widget.body2, widget.body3],
      ),
    );
  }
}
