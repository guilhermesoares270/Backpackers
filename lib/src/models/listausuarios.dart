import 'usuario.dart';
import 'dart:convert';
import 'post_model.dart';
  
class ListaUsuarios {
  static final ListaUsuarios _singleton = new ListaUsuarios._internal();
  Usuario ative;
  List<Usuario> usuarios = [];

  ListaUsuarios._internal() {
    usuarios = new List<Usuario>();
  }

  //Ative user getters
  List<int> get ativeFriends => ative.myFriends;
  int get ativeFriendsLength => ative.myFriends.length;
  List<Post> get ativePosts => ative.myPosts;

  //Users list getters
  List<Usuario> get usuarioList => usuarios;

  void createUsers() async{
    /*
    Inicializa a classe com uma série de usuários teste
    */  
   String stringDeUsuarios = '''
   [
     {
        "image":"assets/joaquina.jpg",
        "nome":"Joaquina",
        "sobrenome":"Soares",
        "sexo":"Feminino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"joaquina@gmail.com",
        "senha":"123",
        "rua":"Via Dolorosa",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[]
      },
      {
        "image":"assets/maria.jpg",
        "nome":"Maria",
        "sobrenome":"Soares",
        "sexo":"Feminino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"maria@gmail.com",
        "senha":"123",
        "rua":"Orchard Road",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[]
      },
      {
        "image":null,
        "nome":"Joao",
        "sobrenome":"Soares",
        "sexo":"Masculino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"joao@gmail.com",
        "senha":"123",
        "rua":"Champs Elysees",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[1,2,3]
      },
      {
        "image":null,
        "nome":"Guilherme",
        "sobrenome":"Soares",
        "sexo":"Masculino",
        "cpf":"43850031810",
        "idade":"22",
        "cep":"12710400",
        "email":"guilherme.soares270@gmail.com",
        "senha":"123",
        "rua":"Marcio Pereira de Carvalho",
        "bairro":"Vila Celestina",
        "numero":"94",
        "transporte":"Carro",
        "myFriends":[0, 2]
      }
    ]
   ''';

    var jsonmap = jsonDecode(stringDeUsuarios);
  
    Usuario user;
    for(int i = 0; i < jsonmap.length; i++){
      user = Usuario.fromJson(jsonmap[i]);
      usuarios.add(user);
    }
  }

  factory ListaUsuarios(){
    return _singleton;
  }

  bool nameExists(String nome){
    for(int i = 0; i < usuarios.length; i++){
      if(usuarios[i].nome == nome){
        //print('Exists');
        return true;
      }
    }
    //print('Not Exists');
    return false;
  }

  Usuario usuarioRequisitado(String nome, String senha){
    if(nameExists(nome)){
      for(int i = 0; i < usuarios.length; i++){
        //print('Usuário nome: ${usuarios[i].nome}');
        //print('Usuário senha: ${usuarios[i].senha}');
        print('Usuario id: ${usuarios[i].id}');
        if(usuarios[i].nome == nome && usuarios[i].senha == senha){
          print('Usuário encontrado');
          return usuarios[i];
        }
      }
    }
    print("Usuário não encontrado");
    return null;
  }

  int get getLength => usuarios.length;
}