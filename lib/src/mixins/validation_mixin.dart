import 'dart:async';

class Validation{

  String isValidEmail(String email){
    String saida = '';
    final _emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
      if(!RegExp(_emailRegExpString, caseSensitive: false).hasMatch(email)){
        saida =  'Insiraum email válido';
      }else{
        saida = null;
      }
      return saida;
  }

}