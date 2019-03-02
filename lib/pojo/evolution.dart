class evolution{
  String num;
  String name;
  evolution._({ this.num, this.name});
  factory evolution.getmyschools(Map<String,dynamic> pokemonss){
    return  evolution._(
      num: pokemonss['num'].toString(),
      name: pokemonss['name'].toString(),
    );
  }
}