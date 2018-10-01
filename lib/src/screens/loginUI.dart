import 'package:flutter/material.dart';
import 'cadastro_usuario.dart';
import '../models/listausuarios.dart';
import 'feedUI.dart';
import '../models/listausuarios.dart';

import '../mixins/validation_mixin.dart';

class LoginUi extends StatefulWidget{

  @override
  createState() => LoginUiState();
}

class LoginUiState extends State<LoginUi> with Validation{

  TextEditingController _mensagemRetorno = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _recuperarSenha = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();  
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,/////////////
      drawer: drawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill,image: new AssetImage('assets/fundo-teste.jpg')),
        ),
        child: ListView(
          children: <Widget>[
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            logoCenter(),
            Container(margin: EdgeInsets.only(bottom: 50.0)),
            nome(),
            Container(margin: EdgeInsets.only(bottom: 30.0)),
            senha(),
            Container(margin: EdgeInsets.only(bottom: 40.0)),
            submitButtom(context),
            Container(margin: EdgeInsets.only(bottom: 5.0)),
            cadastrar(context),
            Container(margin: EdgeInsets.only(bottom: 5.0)),
            openDrawer(),
          ]
        ),
      ),
    );
  }

  Widget drawer(){
    return Drawer(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF125254)),
              child: Text('Recuperar Usuário', style: TextStyle(color: Colors.white, fontSize: 25.0),),
            ),
            email(),
            Container(margin: EdgeInsets.only(bottom: 30.0)),
            recuperarSenha(),
            Container(margin: EdgeInsets.only(bottom: 20.0)),
            mudarSenha(),
            Container(margin: EdgeInsets.only(bottom: 20.0)),
            mensagemRetorno(),              
          ],
        ),
      ),
    );
  }

  Widget logoCenter(){
    return Container(
      color: Colors.transparent,
      width: 280.0,
      height: 280.0,
      child:Center(
      child: Image.asset('assets/logo-01.png'),
      ),
    );
  }

  Widget submitButtom(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 90.0, left: 90.0),
      child: RaisedButton(
        color: Colors.green[300],
        child: Text('Entrar'),
        onPressed: () {
            var ativeUser = ListaUsuarios().usuarioRequisitado(_nomeController.text, _senhaController.text);
            if(_nomeController.text.isNotEmpty && ativeUser != null){
              /*
              Passa o usuário encontrado para a lista de usuários como ativeUser
              Instancia a tela principal
              */
              ListaUsuarios().ative = ativeUser;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FeedUI()));
            }else{
              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Email ou senha inválidos'), backgroundColor: Colors.red,));
            }
        },
      ),
    );
  }

  Widget nome(){
    return Container(
          margin: EdgeInsets.only(left: 20.0, right:  20.0),
          child: TextField(
            controller: _nomeController,
            decoration: InputDecoration(
            hintText: 'Nome',
            filled: true, 
            fillColor: Colors.white
            ),
          ),
        );
  }

  Widget senha(){
    return Container(
        margin: EdgeInsets.only(left: 20.0, right:  20.0),
        child: TextField(
          controller: _senhaController,
          decoration: InputDecoration(
          hintText: 'Senha',
          filled: true, 
          fillColor: Colors.white
          ),
        ),
      );
  }

  Widget cadastrar(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 90.0, left: 90.0),
      child: FlatButton(
        color: Colors.green[300],//Colors.green,
        child: Text('Cadastrar'), 
        onPressed: (){

          //var t = ListaUsuarios().usuarios.length;
          //print('Usuarios cadastrados : $t');

          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => CadastroUsuarioUI())/////////////////
          );
        },
      ),
    );
  }

  Widget recuperarSenha(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
      child: TextFormField(
        controller: _recuperarSenha,
          decoration: InputDecoration(
            labelText: 'Senha',
            hintText: 'Senha',
            filled: true, 
            fillColor: Colors.white
          ),
          validator: (value){
            if(value.length < 4){
            return 'Insira algum valor';
          }
          },
      ),
    );
  }

  Widget email(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'coloque o email cadastrado',
        labelText: 'Email',
        filled: true, 
        fillColor: Colors.white
        ),
        validator: isValidEmail,
      ),
    );
  }

  Widget mensagemRetorno(){
    return Text(
      //'Recuperar Usuário',
      _mensagemRetorno.text,
      textAlign: TextAlign.center, 
      style: TextStyle(
        color: Colors.black, 
        fontSize: 20.0),
    );
  }

  Widget mudarSenha(){
    return FlatButton(
      child: Text('Mudar senha'),
      onPressed: (){
        if(_formKey.currentState.validate()){
          bool found = false;
          for(int i = 0; i < ListaUsuarios().usuarioList.length; i++){
            if(_emailController.text == ListaUsuarios().usuarioList[i].email){
              found = true;
              //Troca a senha
              ListaUsuarios().usuarioList[i].senha = _recuperarSenha.text;

              //mostra a mensagem de sucesso
              setState(() {
                _mensagemRetorno.text = 'Sucesso';    
              });
              break;
            }
          }
          if(!found){
            _mensagemRetorno.text = 'Ocorreu algum erro';
          }
        }else{
          print('validade falso');
        }
      },
    );
  }

  Widget openDrawer(){
    return Container(
      margin: EdgeInsets.only(right: 120.0, left: 120.0),
      child: FlatButton(
        onPressed: (){
          _scaffoldKey.currentState.openDrawer();
        },
        color: Colors.white,
        child: Text('Recuperar Senha', textAlign: TextAlign.center ,style: TextStyle(color: Colors.black),)
      ),
    );
  }
}
  