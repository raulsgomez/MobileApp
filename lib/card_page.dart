import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/person_model.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          _Top(),
          _Bot(),
        ],

      ),
    );
  }
}
class _Top extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return SizedBox(
  height: 300,
  width: double.infinity,
  child:   Container(

      color: Colors.white,

      child:Center(

        child: Image.asset("assets/images.png",height: 200,),

      ),





  ),
);

  }
  }
class _Bot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(Yo.name,style: TextStyle(fontSize: 40,),),
          SizedBox(height: 30,),
          Text(Yo.date,style: TextStyle(fontSize: 20),),
          Text(("Género: ${Yo.gender}"),style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          _Number(),
        ],

      ),
    );
  }
  
  
}

class _Number extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.phone_rounded),
        Text("+34 ${Yo.number}",style: TextStyle(fontSize: 25),),
      ],
    );
  }
}