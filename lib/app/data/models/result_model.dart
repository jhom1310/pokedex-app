// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

List<Result> resultFromJson(String str) =>
    List<Result>.from(json.decode(str).map((x) => Result.fromJson(x)));

String resultToJson(List<Result> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Result {
  Result({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
