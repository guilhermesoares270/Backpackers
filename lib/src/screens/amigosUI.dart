import 'package:flutter/material.dart';
import '../models/listausuarios.dart';
import 'perfil.dart';

class AmigosUI extends StatefulWidget{

  //AmigosUI(this.db);
  //final ListaUsuarios db;

  @override
  createState() => AmigosUIState();
}

class AmigosUIState extends State<AmigosUI>{

  static const CLEARLIST = -2;
  static const CONTACTLIST = -1;
  static const SEARCHLIST = 0;

  //AmigosUIState(ListaUsuarios db){
  //  this.db = db;
  //}
  ListaUsuarios db = ListaUsuarios();

  bool _contactlist = true;

  // int _searchResults = -1;
  List<int> _searchResults = [];
  final _searchController = TextEditingController();


  Widget _appBarTitle = Text('Search');
  Icon _actionIcon = new Icon(Icons.search);
  Color _appBarColor = Color(0xFF125254);
  IconThemeData _icontheme = IconThemeData(color: Colors.white);

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFB0EACE),
      appBar: AppBar(
        iconTheme: _icontheme,
        backgroundColor: _appBarColor,
        title: _appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: _actionIcon,
            onPressed: (){
              setState(changeAppBar);
            },
          ),
        ],
      ),
      //body: ListView(
      //  children: listChoice(),
      body: listChoice(),
    );
  }

  ListView listChoice(){
    if(_contactlist){
      print('Lista vazia');
      return generateList();
    }else if(_searchResults.length > 0){
      print('Tamanho da lista: ${_searchResults.length}');
      print('SearchResults encontrado');
      return generateSearch();
    }//else if(_searchResults.length == 0){
     // return ListView();
    //}
    return ListView();
  }

  void performSearch(String text){
    //Limpa a cada busca
      setState(() {
        _searchResults.clear();
      });
    if(text.isEmpty){
      //se o texto estiver vazio limpa a busca
      setState(() {
              _searchResults.clear();
      });
    }else{
            //Se encontrar o nome adiciona na lista
      for(var pessoa in ListaUsuarios().usuarios){
        if(pessoa.nome.toLowerCase().substring(0, text.length) == text.toLowerCase()){
          setState(() {
            print('Nome Igual index: ${pessoa.id}');
            //_searchResults = pessoa.id;

            //Se já estive adicionado na lista não adiciona 
            bool exists = false;
            for(var lamigos in _searchResults){
              
              if(lamigos == pessoa.id){
                exists = true;
              }
            }
            if(exists == false){
              _searchResults.add(pessoa.id);
            }
          });
        }
      }
    }
  }

  ListView generateSearch(){
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (BuildContext context, int index){
        return Column(
          children: <Widget>[
            generateTile(ListaUsuarios().usuarios[_searchResults[index]].id),
          ],
        );
      },
    );
  }

  ListView generateList(){
    return ListView.builder(
      itemCount: ListaUsuarios().ative.myFriends.length,
      itemBuilder: (BuildContext context, int index){
        return Column(
          children: <Widget>[
            generateTile(ListaUsuarios().ative.myFriends[index]),
            Divider(height: 1.0, color: Colors.black),
          ],
        );
      }
    );
  }

  ////////
  Widget generateTile(int index){
    var pessoa = ListaUsuarios().usuarios[index];
    return Container(
      color: Colors.white,
      child: ListTile (
        leading: CircleAvatar(child: Text(pessoa.nome.substring(0, 1))),
        title: Text('${pessoa.nome}     ID: ${pessoa.id}'),
        subtitle: Text(pessoa.sobrenome),
        trailing: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            showDialog(context: context, builder: (context) => simpleDialog(index));
          },
        ),
        onTap: (){/////
          Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil(db.usuarioList[index])));
        },
      ),
    );
  }

  Widget simpleDialog(int index){
    return SimpleDialog(
      title: Text(ListaUsuarios().usuarios[index].nome, textAlign: TextAlign.center),
      children: <Widget>[
        ListTile(
          title: Text('Adicionar', textScaleFactor: 1.2,),
          onTap: (){
            bool add = adicionarAmigos(index);
            if(!add){
              _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("${ListaUsuarios().usuarios[index].nome} já é seu amigo")));
            }else{
              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('${db.usuarioList[index].nome} foi adicionado')));
            }
            Navigator.of(context).pop();
          } 
        ),
      ],
    );
  }

  bool adicionarAmigos(int index){
    bool passed = true;
    bool add = true;
    //for(int amigoIndex in _friendsIndex){
    for(int amigoIndex in ListaUsuarios().ative.myFriends){
      //Se encontrar algum igual não adiciona
      if(amigoIndex == index){
        passed = false;
        print('Já é seu amigo');
        add = false;
      }
    }
    if(add){
      print('Amigo adicionado');
      setState(() {
        ListaUsuarios().ative.myFriends.add(index);
      });
    }
    return passed;
  }

  void changeAppBar(){
    if(_actionIcon.icon == Icons.search){
      _actionIcon = Icon(Icons.close);
      _icontheme = IconThemeData(color: Colors.black45);
      _appBarColor = Colors.white;
      _appBarTitle = TextField(
          controller: _searchController,
          autofocus: true,
          onChanged: performSearch,
        );

        //_searchResults = -2;
        //_searchResults = SEARCHLIST;
        print('Limpando list');
        _searchResults.clear();
        _contactlist = false;

    }else if(_actionIcon.icon == Icons.close){
        _searchController.clear();
        _actionIcon = Icon(Icons.search);
        _appBarTitle = Text('Search');
        _icontheme = IconThemeData(color: Colors.white);
        _appBarColor = Color(0xFF125254);

        
        //_searchResults = -1;
       // _searchResults = CONTACTLIST;
       _contactlist = true;
       _searchResults.clear();
       _searchResults.addAll(ListaUsuarios().ative.myFriends);
    } 
  }

}