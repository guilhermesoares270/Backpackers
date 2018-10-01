import 'post_model.dart';
import 'mensagem_model.dart';
import 'listausuarios.dart';

class Usuario{
  int id = 0;
  String image;
  String nome;
  String sobrenome;
  String sexo;
  String cpf;
  String idade;
  String cep;
  String email;
  String senha;
  String rua;
  String bairro;
  String numero;
  String transporte;
  //TRANSPORTE transporte;

  //indice na lista de amigos
  List<int> myFriends = [];
  List<Post> myPosts = [];
  List<Mensagem> myMessages = [];

  //Guarda o nome do usuario e o id do post
  // id usuario
  // id post
  List<Map<int, int>> friendsPosts = []; 

  /*
  @param int id do usuario
  @param mensagem recebida
  */
  List<Map<int, Mensagem>> friendsMessages = [];

  void addToPosts(Post newPost){
    myPosts.add(newPost);
  }

  Usuario.obrigatory(this.image, this.nome, this.sobrenome, this.rua, this.bairro, this.numero,
  this.cep, this.email, this.senha){
    if(ListaUsuarios().usuarios.isNotEmpty){
      id = ListaUsuarios().usuarios.length;
    }
    if(image == null){
      image = 'assets/profile-teste.jpg';
    }
  }

  Usuario.fromJson(Map<String, dynamic> json){
    if(ListaUsuarios().usuarios.isNotEmpty){
      id = ListaUsuarios().usuarios.length;
    } 
    String img = json['image'];
    if(img != null){
      image = json['image'];
      //print('Imagem: ${json['image']}');
    }else{
      image = 'assets/profile-test.jpg';
      //print('Imagem padrão');
    }
    nome =  json['nome'];
    sobrenome =  json['sobrenome'];
    sexo = json['sexo'];
    cpf = json['cpf'];
    idade = json['idade'];
    cep = json['cep'];
    email = json['email'];
    senha = json['senha'];
    rua = json['rua'];
    bairro = json['bairro'];
    numero = json['numero'];
    transporte = json['transporte'];
    for(var friends in json['myFriends']){
      myFriends.add(friends);
    }
  }

  Map<String, dynamic> toJson() =>
    {
      'image': image,
      'nome': nome,
      'sobrenome': sobrenome,
      'sexo': sexo,
      'cpf': cpf,
      'idade': idade,
      'cep': cep,
      'email': email,
      'senha': senha,
      'rua': rua,
      'bairro': bairro,
      'numero': numero,
      'transporte': transporte,
      'myFriends': myFriends,
    };
   

  Usuario setNome(String nome){
    this.nome = nome;
    return this;
  }

  Usuario setSobrenome(String sobrenome){
    this.sobrenome = sobrenome;
    return this;
  }

  Usuario setSexo(String sexo){
    this.sexo = sexo;
    return this;
  }

  Usuario setCpf(String cpf){
    this.cpf = cpf;
    return this;
  }
  /*
  Usuario setPassword(String pass){
    this.password = pass;
    return this;
  }
  */
  Usuario setIdade(String idade){
    this.idade = idade;
    return this;
  }

  Usuario setRua(String rua){
    this.rua = rua;
    return this;
  }

  Usuario setBairro(String bairro){
    this.bairro = bairro;
    return this;
  }

  Usuario setNumero(String numero){
    this.numero = numero;
    return this;
  }  
}

class PostData{
  int userID;
  int postID;

  PostData(this.userID, this.postID);
}

enum TRANSPORTE {
  Andar,
  Carro,
  Bicicleta
}