import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    required this.height,
    required this.id,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  int height;
  int id;
  String name;
  Sprites sprites;
  List<StatElement> stats;
  List<Type> types;
  int weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "id": id,
        "name": name,
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.frontDefault,
  });

  String backDefault;
  String frontDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "front_default": frontDefault,
      };
}

class StatElement {
  StatElement({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  int baseStat;
  int effort;
  TypeClass stat;

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: TypeClass.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class TypeClass {
  TypeClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  TypeClass type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: TypeClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
