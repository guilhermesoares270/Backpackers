import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

//Criar uma função para apagar todos os registros da memória
class ImageHelper {
  String _fileName;
  File imageLocal;

  String _path;

  void init() async {
    var path = await getApplicationDocumentsDirectory();
    print('iniciando ImageHelper');
    print(path.path);
    _path = path.path;
    print('caminho local');
    print(_path);
  }

  ImageHelper(){
    init();
  }

  ImageHelper.partial(this._fileName, {this.imageLocal}){
    init();
  }

  ImageHelper.obrigatory(this._fileName, this.imageLocal){
    init();
  }

  void setFileName(String filename){
    this._fileName = filename;
  }

  void setImageLocal(File imageLocal){
    this.imageLocal = imageLocal;
  }

  set setImage(File image){
    this.imageLocal = image;
  }

  set setName(String newName){
    this._fileName = newName;
  }

  File get getImage => this.imageLocal;

  String get getName => this._fileName;

  String savedImagePath() {
    //final path = await _appDocumentsDirectory;
    //String caminho = '$path/$_fileName';

    print('Caminho');
    print(_path);
    print('FileName');
    print(_fileName);

    return '$_path/$_fileName';
  }

  void deleteFile(){
    var image = _appDocumentsDirectory;
    File file = File(image.toString());
    file.delete();
  }

  Future<String> get _appDocumentsDirectory async{
    final directory = await getApplicationDocumentsDirectory();


    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _appDocumentsDirectory;
    //Salva com o nome dearquivo especificado no construtor 
    //preferencialmente o nome do usuário
    return File('$path/$_fileName',);
  }
  
  Future<File> readImage() async{
    try{
      final file = await _localFile;

      File image = File(file.path);

      return image;
      //return Image.file(file);

    }catch(e){
      print(e);
      return File('assets/profile-test.jpg');
      //return Image.asset('assets/profile-test.jpg');
    }
  }

  //teoricamente salva a imagem
  //Salva como file
  Future<File> writeImage() async{
    final file = await _localFile;
    //var image = await file.readAsBytes();
    var image = await imageLocal.readAsBytes();
    return file.writeAsBytes(image);
  }
}