import 'package:flutter/material.dart';

class CriarPost extends StatefulWidget{

  @override
  createState() => CriarPostState();
}

class CriarPostState extends State<CriarPost> {

  TextEditingController _texto = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(margin: EdgeInsets.only(bottom: 20.0),),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                controller: _texto,
                maxLength: 150,
                decoration: InputDecoration(
                  helperText: 'Insira o texto do post',
                  suffixIcon: Icon(Icons.text_fields),
                ),
              ),
            ),
            Container(margin: EdgeInsets.only(bottom: 20.0),),
            Container(color: Colors.black38,),
          ],
        ),
      ),
    );
  }
}