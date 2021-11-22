import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/models/type_model.dart';
import 'package:pokedex/app/data/repository/pokemon_repository.dart';
import 'package:pokedex/app/database/storage.dart';
import 'package:pokedex/app/routes/app_pages.dart';

class HomeController extends GetxController {
  TextEditingController ctrlSearch = TextEditingController();

  late TabController tabController;
  final PokemonRepository repository = PokemonRepository();

  var isLoading = true.obs;

  RxList<Pokemon> pokesearchlist = RxList<Pokemon>();
  Future searchPokemon() async {
    print('buscando pokemon');
    var poke = await repository.getPokemonByName(ctrlSearch.text);
    if (poke != null) {
      pokesearchlist.insert(0, poke);
    }
  }

  teste() {
    print(ctrlSearch.text);
  }

  //Lista de pokemons
  RxList<Pokemon> pokelist = RxList<Pokemon>();
  Future attPokeList() async {
    isLoading.value = true;
    pokelist.value =
        await repository.getPokemonsByResult(await repository.getResultList());
    isLoading.value = false;
  }

  //Lista de tipos
  RxList<TypePoke> typeslist = RxList<TypePoke>();
  Future attTypes() async {
    typeslist.value = await repository.getAllTypes();
  }

  //Filtrando por Tipo
  Future fetchPoketype(String text) async {
    isLoading.value = true;
    pokelist.value = await repository
        .getPokemonsByResult(await repository.getResultsByType(text));
    isLoading.value = false;
  }

  @override
  void onInit() {
    storeFavorites();
    attPokeList();
    attTypes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
/////////////////////// Favorites /////////////////////////
  RxList<Pokemon> pokefavlist = RxList<Pokemon>();
  final countFavorites = 0.obs;
  Future<void> addFavorites(Pokemon poke) async {
    if (Store.hasKey(poke.name)) {
      Store.remove(poke.name);
      pokefavlist.remove(poke);
      countFavorites.value--;
    } else {
      Store.saveMap(poke.name, poke.toJson());
      pokefavlist.add(poke);
      countFavorites.value++;
    }
    await Store.saveFavorites(pokefavlist.value);
  }

  void storeFavorites() {
    var store = Store.getFavorites2();
    if (store != null) {
      for (var i = 0; i < store.length; i++) {
        pokefavlist.add(Pokemon.fromJson(store[i]));
        countFavorites.value++;
      }
    }
    super.update();
  }
////////////////////////////////////////////////////////////

  Future logoff() async {
    await Store.clearStore();
    Get.offAllNamed(Routes.LOGIN);
  }
}
