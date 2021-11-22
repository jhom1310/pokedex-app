class TypePoke {
  String name;
  String url;
  bool selected = false;

  TypePoke({
    required this.name,
    required this.url,
  });

  factory TypePoke.fromJson(Map<String, dynamic> json) => TypePoke(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
