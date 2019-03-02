import 'dart:convert';
import 'pojo/pojo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pojo/Global.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

List<pokemons> pokemons_list = new List();

  Future getschool() async {
    http.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json")
        .then((sp) {
          print(sp.statusCode);
      var decode = jsonDecode(sp.body);
      Global.myPokemons = (decode['pokemon'] as List)
          .map((sch) => pokemons.getmyschools(sch))
          .toList();
      setState(() {

      });
    });
  }

  String Decoded_types(List<dynamic> value){
String Data="";
    for (var i = 0; i < value.length; ++i) {
      if(Data!="") {
        Data += ", " + value[i].toString();
      }
      else
        {
          Data +=value[i].toString();
        }
    }
    Data += ".";
    return Data;
  }

String Decoded_evolutions(List<dynamic> value){
  String Data="";
  for (var i = 0; i < value.length; ++i) {
    if(Data!="") {
      Data += ", " + value[i]['name'].toString();
    }else
      {
        Data += value[i]['name'].toString();
      }

  }
  Data += ".";
  return Data;
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getschool();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.cover)
        ),
        child: new ListView.builder(
            itemCount: Global.myPokemons.length,
            itemBuilder: (c, i) {
              return GestureDetector(
                               
                onTap: (){
                  Global.currentdetails=i;
                  Navigator.of(context).pushNamed('detail');},
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(

                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))  ,
                        image: DecorationImage(image: AssetImage("assets/images/blackbg.png"),fit: BoxFit.cover)
                      ),
                      height: 300,

                      child: Stack(
                      overflow: Overflow.clip,
                        children: <Widget>[
                          //Background
                          new Column(
                            children: <Widget>[
                              Expanded(child: Text("")),
                              Expanded(child: Container(

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10))  ,
                                    image: DecorationImage(image: AssetImage("assets/images/gradientoverly.png"),fit: BoxFit.cover)
                                ),
                                height: 150,) ),
                            ],
                          ),
                          new Center(
                            child: Image.asset("assets/images/circle.png",width: 200,),
                          ),
                          new Positioned(
                            right: (MediaQuery.of(context).size.width/2)-70,
                            top:40,
                            child: Image.network(Global.myPokemons[i].img,height: 120,width: 120,),
                          ),
                          new Positioned(
                            width: MediaQuery.of(context).size.width-15,
                            bottom:80,
                            child: Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(Global.myPokemons[i].name.toUpperCase(),textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white),),
                              ],
                            ),
                          ),
                          new Positioned(
                            left: 20,
                            bottom:20,
                            child: Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/candycount.png",height: 40,width: 40,),
                                Padding(padding: EdgeInsets.all(5)),
                                Text(Global.myPokemons[i].candy_count,textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white),),
                              ],
                            ),
                          ),
                          new Positioned(
                            right: 20,
                            bottom:20,
                            child: Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(Global.myPokemons[i].candy,textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white),),
                                Padding(padding: EdgeInsets.all(5)),

                                Image.asset("assets/images/candy.png",height: 40,width: 40,),
                              ],
                            ),
                          )


                        ],
                      ),
                    )
                ),
              );
            }),
        ),

    );
  }
}
