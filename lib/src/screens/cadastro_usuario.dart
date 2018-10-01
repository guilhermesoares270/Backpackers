import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../models/listausuarios.dart';
import '../mixins/validation_mixin.dart';

//image
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

//image helper
import '../mixins/image_helper.dart';

class CadastroUsuarioUI extends StatefulWidget{

  @override
  createState() => CadastroUsuarioUIState();
}

class CadastroUsuarioUIState extends State<CadastroUsuarioUI> with Validation{

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final numeroController = TextEditingController();
  final cepController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final cadastrarController = TextEditingController();

  File _image;

  static final formKey = GlobalKey<FormState>();
  static final _scaffoldkey = GlobalKey<ScaffoldState>();

  ImageHelper ih = ImageHelper();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        //backgroundColor: Color(0xFF125254),
        title: Text('Cadastro de Usuário'),
      ),
      body:Container(
          color: Color(0XFFB0EACE),
          child: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
              logoCenter(),
              nome(),
              verticalSpace(),
              sobrenome(),
              verticalSpace(),
              rua(),
              verticalSpace(),
              bairro(),
              verticalSpace(),
              numero(),
              verticalSpace(),
              cep(),
              verticalSpace(),
              email(),
              verticalSpace(),
              senha(),
              verticalSpace(),
              cadastrar(),
              verticalSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget verticalSpace(){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }

  Widget nome(){
    return Container(
    margin: EdgeInsets.only(left: 20.0, right:  20.0),
      child: TextFormField(
        controller: nomeController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'Nome',
        labelText: 'Nome',
        filled: true, 
        fillColor: Colors.white
        ),
      ),
    );
  }

  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageFolder() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
        _image = image;  
    });
  }

  //Serve para salvar a imagem de perfil
  Widget logoCenter(){
    return GestureDetector(
        child: Container(
        margin: EdgeInsets.only(right: 40.0, left: 40.0, top: 10.0, bottom: 10.0),
        //color: Colors.transparent,
        //color: Colors.blueGrey,
        width: 280.0,
        height: 280.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: _image == null ? AssetImage('assets/profile-test.jpg') : FileImage(_image),
          ),
        ),
      ),
      onTap: (){
        /*
          Colocar um seletor para imagem da camera ou do file system
        */       
       showModalBottomSheet<void>(context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.camera_alt),
                title: new Text('Camera'),
                onTap: () {
                  getImageCamera();
                },          
              ),
              ListTile(
                leading: Icon(Icons.folder),
                title: Text('Pasta'),
                onTap: () {
                  getImageFolder();
                },
              ),
            ],
          );
        }

       );
      },
    );
  }

  Widget sobrenome(){
  return Container(
    margin: EdgeInsets.only(left: 20.0, right:  20.0),
      child: TextFormField(
        controller: sobrenomeController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'Sobrenome',
        labelText: 'Sobrenome',
        filled: true, 
        fillColor: Colors.white
        ),
      ),
    );
  }

  Widget rua(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
        child: TextFormField(
          controller: ruaController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          hintText: 'Rua',
          labelText: 'Rua',
          filled: true, 
          fillColor: Colors.white
          ),
        ),
      );
  }

  Widget bairro(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
        child: TextFormField(
          controller: bairroController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          hintText: 'Bairro',
          labelText: 'Bairro',
          filled: true, 
          fillColor: Colors.white
          ),
        ),
      );
  }

  Widget numero(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
        child: TextFormField(
          controller: numeroController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          hintText: 'Número',
          labelText: 'Número',
          filled: true, 
          fillColor: Colors.white
          ),
        ),
      );
  }

  Widget cep(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
        child: TextFormField(
          controller: cepController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          hintText: 'Cep',
          labelText: 'Cep',
          filled: true, 
          fillColor: Colors.white
          ),
        ),
      );
  }

  Widget email(){
    return Container(
      margin: EdgeInsets.only(left: 20.0, right:  20.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'example@example.com',
        labelText: 'Email',
        filled: true, 
        fillColor: Colors.white
        ),
        validator: isValidEmail,
      ),
    );
  }

  Widget senha(){
    return Container(
    margin: EdgeInsets.only(left: 20.0, right:  20.0),
      child: TextFormField(
        controller: senhaController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
        hintText: 'Senha',
        labelText: 'Senha',
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

  Widget cadastrar(){
    return Container(
        margin: EdgeInsets.only(left: 100.0, right: 100.0),
        child: RaisedButton(
        child: Text('Cadastrar', style: TextStyle(color: Colors.white, letterSpacing: 1.0),),
        color: Color(0xFF125254),
        onPressed: (){
          if(formKey.currentState.validate()){
            
            if(_image != null){
              
              //salvar imagem
              ih.setFileName(nomeController.text);
              ih.setImageLocal(_image);

              //ih.deleteFile();
              ih.writeImage();
              //
              print('Imagem salva');
            }
            

            ListaUsuarios().usuarios.add(createnew());
            showDialog(context: context, builder: (context) => simpleDialog());
          }
        },
      ),
    );
  }

  Widget simpleDialog(){
    return AlertDialog(
      title: Text('Usuário'),
      content: Text('Usuário cadastrado com sucesso'),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: (){
            clearAll();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void clearAll(){
    nomeController.clear();
    sobrenomeController.clear();
    ruaController.clear();
    bairroController.clear();
    numeroController.clear();
    cepController.clear();
    emailController.clear();
    senhaController.clear();
    cadastrarController.clear();
  }

  //Por enquanto sem imagem
  Usuario createnew(){
    return Usuario.obrigatory(
      _image == null ? 'assets/profile-test.jpg' : ih.savedImagePath(),
      nomeController.text, 
      sobrenomeController.text, 
      ruaController.text, 
      bairroController.text, 
      numeroController.text, 
      cepController.text, 
      emailController.text, 
      senhaController.text
    );
  }
}