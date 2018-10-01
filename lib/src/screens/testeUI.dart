import 'package:flutter/material.dart';

class Teste extends StatefulWidget{

  @override
  createState() => TesteUI();
}

class TesteUI extends State<Teste>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Teste'),
        actions: <Widget>[
          notification(),
          IconButton(icon: Icon(Icons.class_),),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            not(),
            
          nnotif(),
          ],
        ),
      ),
    );
  }

  double lsize = 13.0;
  Widget notification(){
    return IconButton(
      color: Colors.white,
      iconSize: 35.0,
      icon: Stack(
        children: <Widget>[
          Icon(Icons.notifications, color: Colors.black,),
          Positioned(
            top: -0.30,
            right: -0.60,
            width: 20.0,
            height: 20.0,
          child: Center(child: CircleAvatar(backgroundColor: Colors.red, child: Text('$c', style: TextStyle(fontSize: lsize),),),),),
        ],
      ),
      onPressed: (){
        setState(() {
          c++;
          if(c == 100){
            lsize = lsize/1.5;
          }    
        });
      },
    );
  }

  Color c1 = Colors.black;
  Widget nnotif(){
    return IconButton(
      iconSize: 100.0,
      icon: Icon(Icons.notifications, color: c1,),
      onPressed: (){
        if(c1 == Colors.black){
          setState(() {
            c1 = Colors.red;
          });
        }else{
          setState(() {
            c1 = Colors.black;
          });
        }
      },
    );
  }

  int c = 99;
  double lsize2 = 35.0;
  Widget not(){
  return IconButton(
    iconSize: 100.0,
      color: Colors.white,
      icon: Stack(
        children: <Widget>[
          Icon(Icons.notifications, color: Colors.black,),
          Positioned(
            top: 0.0,
            right: 0.0,
            width: 50.0,
            height: 50.0,
            child: CircleAvatar(backgroundColor: Colors.red, child: Text('$c', style: TextStyle(fontSize: lsize2),),),
          ),
        ],
      ),
      onPressed: (){
        setState(() {
          c++;  
          if(c == 100){
            lsize2 = lsize2/1.5;
          }   
        });
      }
    ); 
}



}

/*
int c = 0;
  Widget notificationButton(){
    return IconButton(
      color: Colors.white,
      icon: Stack(
        children: <Widget>[
          Icon(Icons.notifications),
          Positioned(
            top: -20.0,
            right: -10.0,
            width: 10.0,
            height: 10.0,
            child: CircleAvatar(backgroundColor: Colors.orange),//Container(color: Colors.orange),
          ),
        ],
      ),
      onPressed: (){
        setState(() {
          c++;    
        });
      }
    );
  }
  */