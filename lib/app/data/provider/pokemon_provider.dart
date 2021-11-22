import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/models/pokemon_model.dart';
import 'package:pokedex/app/data/models/result_model.dart';
import 'package:pokedex/app/data/models/type_model.dart';

class PokemonProvider extends GetConnect {
  static const String BASE_URL = 'https://pokeapi.co/api/v2/';

  Future<Response> fetchPokemonByName(String name) async {
    final response = await get(BASE_URL + 'pokemon/$name',
        contentType: 'application/json; charset=utf-8');

    return response;
  }

  Future<Response> fetchListResults() async {
    final response = await get(BASE_URL + 'pokemon?limit=20&offset=0',
        contentType: 'application/json; charset=utf-8');
    Get.log('Requisitando lista de Pokemons');
    return response;
  }

  Future<Response> fetchResultsByType(String type) async {
    final response = await get(BASE_URL + 'type/$type',
        contentType: 'application/json; charset=utf-8');

    return response;
  }

  Future<Response> fetchAllTypes() async {
    final response = await get(BASE_URL + 'type',
        contentType: 'application/json; charset=utf-8');
    return response;
  }
}
