import 'package:flutter/material.dart';
import '../models/listausuarios.dart';
import '../models/usuario.dart';

//class Perfil extends StatefulWidget{

//  @override
//  createState() => PerfilState();
//}

//class PerfilState extends State<Perfil>{

class Perfil extends StatelessWidget{

  //static final _scaffoldkey = GlobalKey<ScaffoldState>();
  //static final _appbarkey = GlobalKey();
  //static final _scrollViewController = GlobalKey();

  //static TabController _tabController;

   //Injector
  Usuario usuario;  

  Perfil(this.usuario);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,//Color(0xFFB0EACE),
      //key: _scaffoldkey,
      body: NestedScrollView(
          headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                backgroundColor: Color(0xFF125254),
                //key: _appbarkey,
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(usuario.nome, style: TextStyle(color: Colors.white),),
                  centerTitle: true,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover, 
                        //image: new AssetImage('assets/profile-test.jpg')
                        image: AssetImage(usuario.image),
                      ),
                    ),
                  ),
                ),
              ), 
            ];
          },

          body: ListView(
              children: <Widget>[
                ListTile(
                    title: Center(child: Text('Phone Number',style: TextStyle(fontSize: 22.0, color: Color(0xFF125254)),),),
                  ),
                  phones(),

                  ListTile(
                    title: Center(child: Text('Email',style: TextStyle(fontSize: 22.0, color: Color(0xFF125254)),),),
                  ),
                  //Card(
                  //  child: ListTile(
                  //    title: Center(child: Text('Email',style: TextStyle(fontSize: 22.0, color: Color(0xFF125254)),),),
                  //  ),
                  //),
                  email(),
                  
                  ListTile(
                    title: Center(child: Text('Endereço',style: TextStyle(fontSize: 22.0, color: Color(0xFF125254)),),),
                  ),
                  endereco(),

                  ListTile(
                    title: Center(child: Text('Posts',style: TextStyle(fontSize: 22.0, color: Color(0xFF125254)),),),
                  ),

              ],
            ),

        ),
    );
  }

  //Adicionar quando os post estiverem prontos
  Widget posts(){
    return Card(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover, 
                  image: new AssetImage(usuario.image),
                ),
              ),
            ),
            title: Text(usuario.rua + ', ' + usuario.numero, style: TextStyle(fontSize: 17.0),),
            subtitle: Text(usuario.bairro),
            trailing: Icon(Icons.map, color: Color(0xFF125254),),
          );
        }
      ),
    );
  }

  Widget endereco(){
    return Card(
      child: ListTile(
        leading: Icon(Icons.satellite, color: Color(0xFF125254),),
        title: Text(usuario.rua + ', ' + usuario.numero, style: TextStyle(fontSize: 17.0),),
        subtitle: Text(usuario.bairro),
        trailing: Icon(Icons.map, color: Color(0xFF125254),),
      ),
    );
  }

  Widget phones(){
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.phone, color: Color(0xFF125254),),
            title: Text('3144-3776'),
            subtitle: Text('Casa'),
            trailing: Icon(Icons.message, color: Color(0xFF125254),),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Color(0xFF125254),),
            title: Text('3144-3776'),
            subtitle: Text('Celular'),
            trailing: Icon(Icons.message, color: Color(0xFF125254),),
          ),
        ],
      ),
    );
  }

  Widget email(){
    return  Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(usuario.email, style: TextStyle(fontSize: 17.0),),
            subtitle: Text('email', style: TextStyle(fontSize: 15.0),),
            trailing: Icon(Icons.mail, color: Color(0xFF125254),),
          ),
        ],
      ),
    );
  }
  
  //It's working!!!
  ListView buildBuilder(){
    return ListView.builder(
      itemCount: ListaUsuarios().ative.myFriends.length,
      itemBuilder: (BuildContext context, int index){
        var pessoa = ListaUsuarios().usuarios[index];
        return Container(
          color: Colors.white,
          child: ListTile (
            leading: CircleAvatar(child: Text(pessoa.nome.substring(0, 1))),
            title: Text(pessoa.nome),
            subtitle: Text(pessoa.sobrenome),
            trailing: IconButton(
              icon: Icon(Icons.menu),
              //onPressed: (){
              //  showDialog(context: context, builder: (context) => simpleDialog(index));
              //},
              
            ),
          ),
        );
      },
    );
  }

  ListView buildTest(){
    return ListView(
      children: List.generate(15, (int index){
      return Container(
        color: Colors.white,
        child: ListTile (
          leading: CircleAvatar(child: Text('$index')),
          title: Text('$index'),
          subtitle: Text('$index'),
          trailing: IconButton(
            icon: Icon(Icons.menu),
            //onPressed: (){
            //  showDialog(context: context, builder: (context) => simpleDialog(index));
            //},
          ),
        ),
      );
    }),
    );
    
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }

}