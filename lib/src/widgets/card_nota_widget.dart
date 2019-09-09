
import 'package:flutter/material.dart';

class CardNote extends StatelessWidget {
  
  final List<dynamic> notas;
  
  CardNote({  @required this.notas   });

  @override
  Widget build(BuildContext context) {
    
    //print(notas);

    return ListView.builder(

        itemBuilder: (BuildContext context, int index){
            
          //Navigator.pushNamed(context, 'notaDetail');
        
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/notaDetail'),
                  child: Card
          (
            elevation: 15.0,
            //margin: const EdgeInsets.only(top: 15.0),
            child:Column
            (
              children: <Widget>
              [
                Stack(
                    children:<Widget>[

                      /* CONTAINER DE LA IMAGEN */
                      Container
                      (
                        height: 250.0,
                        width: double.infinity,
                        decoration: BoxDecoration
                        (
                            image: DecorationImage
                            (
                              //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                              image: NetworkImage(notas[index].image), 
                              fit: BoxFit.cover,

                            ),
                        ),
                      ),

                      /* CONTAINER DEL DEGRADADO */
                      // Container
                      // (
                      //   height: 200.0,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration
                      //   (
                      //     color: const  Color.fromRGBO(0, 83, 130, 0.7),
                      //     gradient: LinearGradient(
                      //       begin: FractionalOffset.topCenter,
                      //       end: FractionalOffset.bottomCenter,
                      //       colors: 
                      //       [
                      //         Colors.grey.withOpacity(0.0),
                      //         Colors.black,
                      //       ],
                      //       stops: 
                      //       [
                      //         0.0,              
                      //         1.0
                      //       ]),
                      //   ),
                      // ),


                     // Text('Cartera', style: TextStyle(color: Colors.black),),
                        
                      Container
                        (
                          padding: const EdgeInsets.only(left: 5.0 , top: 5.0),
                          color: Color.fromRGBO(237, 33, 33, 1),
                          width: 100.0,
                          height: 25.0,
                          child: Text(notas[index].section, style: TextStyle(color: Colors.white, fontSize: 14.0),),
                          // child: FittedBox
                          // (
                          //   fit: BoxFit.contain,
                          //   child: Text("ESTADOS", style: TextStyle(color: Colors.white, fontSize: 10.0)),
                          // ),
                        ),
                      

                    ]
                           
                ),

                
                Container
                (
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          notas[index].title, //'Tras falla, Banorte restablece todos sus servicios',
                          style: TextStyle(color:Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),  
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text( 
                         notas[index].pubdate + ' | ' + notas[index].pubtime,
                          textAlign: TextAlign.left,
                          style: TextStyle(color:Color.fromRGBO(158, 158, 158, 1),fontSize: 10.0,),  
                        ),
                      ),
                      Text( 
                        notas[index].subtitle,
                        textAlign: TextAlign.left,
                        style: TextStyle(color:Colors.black,fontSize: 13.0,),  
                      ),
                       
                    ],
                  ),
                )
              ],
            ),

          ),
        );
  

        }
          
    );

  }

  

}























