class Pokemon {
  String nome;
  String imageUrl;
  String especie;
  List<Ability> abilities;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    imageUrl = json['sprites']['front_default'];
    especie = json['species']['name'];

    var arrayAbilities = json['abilities'] as List;

    abilities = arrayAbilities.map((item) {
      return Ability.fromJson(item['ability']);
    }).toList();
  }
}

class Ability {
  String name;
  String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
