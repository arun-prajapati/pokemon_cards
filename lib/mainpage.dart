import 'dart:convert';
import 'pojo/pojo.dart';
import 'package:flutter/material.dart';
import 'pojo/Global.dart';
import 'package:http/http.dart' as http;
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int i=0;

//  Future getschool() async {
//    http.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json")
//        .then((sp) {
//      print(sp.statusCode);
//      var decode = jsonDecode(sp.body);
//      Global.myPokemons = (decode['pokemon'] as List)
//          .map((sch) => pokemons.getmyschools(sch))
//          .toList();
//      setState(() {
//
//      });
//    });
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 //   getschool();
    i=Global.currentdetails;
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
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.cover)
        ),
        child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))  ,
                  image: DecorationImage(image: AssetImage("assets/images/blackbg.png"),fit: BoxFit.cover)
              ),
              child: Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  //Background
                  new Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                          child: Text("")),
                      Expanded(child: Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10))  ,
                            image: DecorationImage(image: AssetImage("assets/images/gradientoverly.png"),fit: BoxFit.cover)
                        ),
                        height: 150,) ),
                    ],
                  ),
                  new Positioned(
                    width: MediaQuery.of(context).size.width-15,
                    top:100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/circle.png",width: 200,),
                      ],
                    ),
                  ),
                  new Positioned(
                    right: (MediaQuery.of(context).size.width/2)-70,
                    top:40,
                    child: Image.network(Global.myPokemons[i].img,height: 120,width: 120,),
                  ),
                  new Positioned(
                    width: MediaQuery.of(context).size.width-15,
                    top:190,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          new Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(Global.myPokemons[i].name.toUpperCase(),textAlign: TextAlign.center,style: TextStyle(fontSize: 35,color: Colors.white),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    width: MediaQuery.of(context).size.width,
                    top:230,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(5)),
                          Row(children: <Widget>[
                            Expanded(child: Image.asset("assets/images/stripe.png"))
                          ],),
                          //Type
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Type",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Decoded_types(Global.myPokemons[i].type),style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                          //Height
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Height",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Global.myPokemons[i].height,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                          //Weight
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Weight",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Global.myPokemons[i].weight,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                          // Candy
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Candy",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Global.myPokemons[i].candy,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                          //Candy_count
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Candy Count",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Global.myPokemons[i].weight,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                          //egg
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Egg",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Global.myPokemons[i].egg,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                          //spawn_chance
                          new Padding(
                            padding: const EdgeInsets.all(15),
                            child: new Row(
                              children: <Widget>[
                                Expanded(flex:1,child: Text("Spawn Chance",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w100),)),
                                Expanded(flex:1,child: Text(Global.myPokemons[i].spawn_chance,style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),





                ],
              ),
            )
        ) ,

      ),

    );
  }
}
