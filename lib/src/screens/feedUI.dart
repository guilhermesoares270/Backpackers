import 'package:flutter/material.dart';
import '../models/listausuarios.dart';
import 'loginUI.dart';
import 'perfil.dart';
import 'testeUI.dart';
import 'amigosUI.dart';
import 'newPost.dart';

import 'image-picker_test.dart';

class FeedUI extends StatefulWidget{

  /*
    Apenas para teste

    Coloca alguns post para criar a lista 


    Deve procurar o post no objeto dos amigos
  */
  FeedUI(){
    //ListaUsuarios().ative.friendsPosts = List.generate(3, (i) => Post(texto: 'post: ${i}', image: AssetImage('assets/logo-01.png')));
    ListaUsuarios().ative.friendsPosts = List.generate(5, (i) => {i : i});
    
  }
  /*
  
  */

  createState() => FeedState();

}

class FeedState extends State<FeedUI>{

  int _i = -1;

  //int _c = ListaUsuarios().ative.friendsPosts.length;
  int _c = 120;
  double _lsize = 13.0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xFF125254),
          child: ListView(
            children: <Widget>[
              hero(),
              friendsButton(),
              verticalSpace(),
              perfilButton(),              
              verticalSpace(),
              teste(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF125254),
        title: Text(ListaUsuarios().ative.nome),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          newPost(),
          notificationButton(),
          logOutButton(),
        ],
        //flexibleSpace: Icon(Icons.email),
      ),
      body: Container(
        color: Color(0xFFB0EACE),
        child: ListView.builder(
          itemCount: ListaUsuarios().ative.friendsPosts.length,
          itemBuilder: (BuildContext context, int index){
            _i++;
            print(ListaUsuarios().ative.image);
            return buildPosts('Hello: ${index}', AssetImage('assets/logo-01.png'));
          },
        )
      ),

    );
  }

  //Change
  Widget friendsButton(){
    return  Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.face),
        title: Text('Amigos', style: TextStyle(color: Colors.black, fontSize: 18.0),),
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => AmigosUI(ListaUsuarios())));
          Navigator.push(context, MaterialPageRoute(builder: (context) => AmigosUI()));
        },
      ),
    );
  }

  Widget teste(){
    return  Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('teste', style: TextStyle(color: Colors.black, fontSize: 18.0),),
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Teste()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
      ),
    );
  }

  Widget perfilButton(){
    return  Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Perfil', style: TextStyle(color: Colors.black, fontSize: 18.0),),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil(ListaUsuarios().ative)));
        },
      ),
    );
  }

  Widget messagesButton(){
    return  Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: RaisedButton(
        child: Row(
          children: <Widget>[
            Icon(Icons.email),
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Text('Messages', style: TextStyle(color: Colors.black, fontSize: 18.0),),
          ],
        ),
        color: Colors.white,
        onPressed: (){
          print('Messages pressed');
        },
      ),
    );
  }

  Widget notificationButton(){
    return IconButton(
      color: Colors.white,
      iconSize: 30.0,
      icon: Stack(
        children: <Widget>[
          Icon(Icons.notifications, color: Colors.white),
          Positioned(
            top: -0.30,
            right: -0.60,
            width: 20.0,
            height: 20.0,
          child: Center(child: CircleAvatar(backgroundColor: Colors.red, child: Text('${_c >= 100 ? '+' : '_c'}', style: TextStyle(fontSize: _lsize),),),),),
        ],
      ),
      onPressed: (){
        setState(() {
          if(_c == 100){
            _lsize = _lsize/1.5;
          }    
        });
      },
    );
  }    

  Widget logOutButton(){
    return IconButton(
      color: Colors.white,
      //iconSize: 30.0,
      icon: Icon(Icons.exit_to_app),
      onPressed: (){
        ListaUsuarios().ative = null;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginUi()));
      }, 
    );
  }

  Widget newPost(){
    return IconButton(
      color: Colors.white,
      //iconSize: 30.0,
      icon: Icon(Icons.playlist_add),
      onPressed: (){
        ListaUsuarios().ative = null;//////////////
        Navigator.push(context, MaterialPageRoute(builder: (context) => CriarPost()));
      }, 
    );
  }
    
  Widget verticalSpace(){
    return Container(
      margin: EdgeInsets.only(bottom: 3.0),
    );
  }

  Widget listTile(Text title, Icon icon){
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      color: Colors.white,
      child: ListTile(
      leading: icon,
      title: title,
      ),
    );
  }

  Widget hero(){
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: CircleAvatar(
          radius: 120.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/logo-01.png'),
        ),
      ),
    );
  }

  Widget buildPosts(String text, AssetImage image){
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
        ),
      child: Column(  
        children: <Widget>[
          Padding(
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Container(
                width: 350.0,
                height: 350.0,
                child: Column(
                children: <Widget>[
                  Image(image: image),
                ],
              ),
              ),
            ),
            padding: EdgeInsets.only(bottom: 8.0),
            /*Container(
              child: Image(
                image: image,
              ),
              color: Colors.black38, 
              width: 300.0, 
              height: 300.0,
            ),//Image.network(image.url),
            padding: EdgeInsets.only(bottom: 8.0),
            */
          ),
        Text(text, textScaleFactor: 1.5, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}