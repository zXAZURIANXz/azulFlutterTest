
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardDos extends StatelessWidget {
  
  final List<dynamic> notas;
  CardDos({  @required this.notas   });
  

  @override
  Widget build(BuildContext context) {
        

    return ListView.builder(
       itemBuilder: (BuildContext context, int index){
         print(notas);
         return _tarjeta(context,notas[index].image,notas[index].title,notas[index].subtitle,notas[index]);
       }

    );


//onTap: () => Navigator.pushNamed(context, '/notaDetail', arguments: notas[index]

  }

  Widget _imagen(image,notaid){

    return Hero(
      tag: notaid,
          child: Image.network
      (
        image,
        height: 350,
        fit:BoxFit.cover
      ),
    );

  }



  Widget _tituloNota(titulo){
    return Positioned
    (
      top:250.0,
      width: 300.0,
      left: 10.0,
      child: Text
      ( 
        titulo,
        textAlign: TextAlign.left,
        style: TextStyle
        (
          color:Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,
          shadows: 
          [
            Shadow(
              blurRadius: 5.0,
              
            )
          ]

        ),  
        
      ),
    );

  }

  Widget _footerCard(subtitulo){

    return Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>
      [
        
        new SizedBox(
          width: 230,
          child: Container(
            margin: EdgeInsets.only(top:20.0),
            child: Text(
              subtitulo,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        Icon(Icons.share),
        Icon(Icons.favorite_border),

      ],
    
    );



  }



  Widget _tarjeta(context,imagen,titulo,subtitulo,nota){

    final tarjeta =  Container
          (
            //color: Colors.red,
            margin: EdgeInsets.only(top: 15.0),
            //width: 345.0,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: 450,
            child: Card
            (
              //color: Colors.blue,
              elevation: 3.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0) ),
              child: Column
              (
                children: <Widget>
                [
                  ClipRRect
                  (
                    borderRadius: BorderRadius.only
                    (
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        
                    ),
                    child: Stack
                    (
                      children: <Widget>
                      [
                          _imagen(imagen,nota.id),
                          _tituloNota(titulo),
                      ],
                    
                    ),
                  ),
                  _footerCard(subtitulo)
                ],
              )

            ),
          );


    return GestureDetector
    (
      child: tarjeta,
      onTap: (){
        Navigator.pushNamed(context, '/notaDetail', arguments: nota);
      }
    );
  }


}