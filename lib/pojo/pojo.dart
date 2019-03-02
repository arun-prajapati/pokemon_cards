import 'evolution.dart';
class pokemons{
  String id;
  String num;
  String name;
  String img;
  List<dynamic> type;
  String height;
  String weight;
  String candy;
  String candy_count;
  String egg;
  String spawn_chance;
  String avg_spawns;
  String spawn_time;
  String multipliers;
  String weaknessess;
  List<dynamic> prev_evolution;
  List<dynamic> next_evolution;


  pokemons._({this.id, this.num, this.name, this.img, this.type, this.height,
    this.weight, this.candy, this.candy_count, this.egg, this.spawn_chance,
    this.avg_spawns, this.spawn_time, this.multipliers, this.weaknessess,
    this.prev_evolution, this.next_evolution});

  factory pokemons.getmyschools(Map<String,dynamic> pokemonss){
    return  pokemons._(
      id: pokemonss['id'].toString(),
      num: pokemonss['num'].toString(),
      name: pokemonss['name'].toString(),
      img: pokemonss['img'].toString(),
        type: pokemonss['type'],
        height: pokemonss['height'].toString(),
        weight: pokemonss['weight'].toString(),
        candy: pokemonss['candy'].toString(),
        candy_count: pokemonss['candy_count']==null?"0":pokemonss['candy_count'].toString(),
        egg: pokemonss['egg'].toString(),
        spawn_chance: pokemonss['spawn_chance'].toString(),
        avg_spawns: pokemonss['avg_spawns'].toString(),
        spawn_time: pokemonss['spawn_time'].toString(),

        multipliers: pokemonss['multipliers'].toString(),
        weaknessess: pokemonss['weaknessess'].toString(),
        prev_evolution:pokemonss['prev_evolution'],
      next_evolution:pokemonss['next_evolution']

    );
  }


}