import 'dart:convert';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/models/result_model.dart';
import 'package:pokedex/app/data/models/type_model.dart';
import 'package:pokedex/app/data/provider/pokemon_provider.dart';
import 'package:pokedex/app/global/widgets/dialogs.dart';

class PokemonRepository {
  final PokemonProvider api = PokemonProvider();

  getResultList() async {
    final response = await api.fetchListResults();

    if (response.isOk) {
      return List<Result>.from(
        json
            .decode(response.bodyString!)["results"]
            .map((x) => Result.fromJson(x)),
      );
    } else {
      Get.dialog(FailureDialog('Erro ao carregar Lista de Pokemons.'));
    }
  }

  getPokemonByName(String name) async {
    final response = await api.fetchPokemonByName(name);

    if (response.isOk) {
      return pokemonFromJson(response.bodyString!);
    } else {
      Get.dialog(FailureDialog('Erro ao buscar Pokémon por nome.'));
    }
  }

  getPokemonsByResult(List<Result> list) async {
    List<Pokemon> listPokemons = [];
    for (var item in list) {
      listPokemons.add(await getPokemonByName(item.name));
    }
    return listPokemons;
  }

  getResultsByType(String type) async {
    final response = await api.fetchResultsByType(type);

    if (response.isOk) {
      return List<Result>.from(
        json
            .decode(response.bodyString!)["pokemon"]
            .map((x) => x["pokemon"])
            .map((x) => Result.fromJson(x)),
      );
    } else {
      Get.dialog(FailureDialog('Erro ao carregar Lista de Pokemons por tipo.'));
    }
  }

  getAllTypes() async {
    final response = await api.fetchAllTypes();

    if (response.isOk) {
      var body = json.decode(response.bodyString!);
      var ret =
          List<TypePoke>.from(body["results"].map((x) => TypePoke.fromJson(x)));
      return ret;
    } else {
      // If that response was not OK, throw an error.
      Get.dialog(FailureDialog('Erro ao buscar todos os tipos.'));
    }
  }
}
