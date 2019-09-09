
import 'package:eluniversal_test_tres/src/providers/menu_provider.dart';
import 'package:eluniversal_test_tres/src/providers/portada_provider.dart';
import 'package:eluniversal_test_tres/src/widgets/card_nota_widget.dart';
import 'package:eluniversal_test_tres/src/widgets/card_type2_widget.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tweet_webview/tweet_webview.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
 // final menuOpciones = ['uno','dos','tres','cuatro','cinco','uno','dos','tres','cuatro','cinco','uno','dos','tres','cuatro','cinco','uno','dos','tres','cuatro','cinco'];
  
  ScrollController _scrollController = new ScrollController();
  
  final portadaProvider = new PortadaProvider(); // para infinite scroll
  int _ultimoItem = 0; //para infinite scroll
  List<int> _listaNumeros = new List(); //para infinite scroll
  bool _isLoading = false;


  @override
  void initState() { 
    super.initState();
    
      _agregar10();

      _scrollController.addListener((){

        if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ){

         // _agregar10();

          _fetchData();
        } // posisicon en pixeles ! posicion total
        
        

      });
    
  }



  int paginaActual = 0;
  CircularBottomNavigationController _navigationController = new CircularBottomNavigationController(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,//Color.fromRGBO(0, 83, 130, 1),
        appBar: AppBar(
          title: Align( alignment: Alignment.centerLeft, child: Image.asset('assets/logoHeader.png', fit: BoxFit.cover, width: 200.0, )),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(30.0)
          //   ),
          // ),
           elevation: 0.0,
          backgroundColor: Colors.white,
           iconTheme: new IconThemeData(color: Color.fromRGBO(0, 83, 131, 1)),
        ),
        body:_callPage(paginaActual),
          //Container(),//tarjetaNota(context),
        endDrawer: _crearMenu(),
        bottomNavigationBar:
        CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            setState(() {
                paginaActual = selectedPos;
            });
            print("clicked on $selectedPos");
            _callPage(selectedPos);
          },
        ),
        

      );
    
  }



/* *********************************** */
/*                                     */
/*            RENDER PAGINAS           */
/*                                     */
/* *********************************** */


Widget _callPage(int paginaActual){
  
 _navigationController.value = paginaActual;
 //MenuProvider menuProvider = new MenuProvider();
  switch( paginaActual ){

    case 0: return _cardNota();
    case 1: return Container(margin: const EdgeInsets.only(top: 10.0),child: _carousel());
    case 2: return CardDos();
    case 3: return WebView(

      initialUrl: 'https://www.instagram.com/p/B1qxaf2nvVv/',
      javascriptMode: JavascriptMode.unrestricted,
      
    );    //TweetWebView.tweetUrl("https://twitter.com/Interior/status/463440424141459456");
    default: return HomePage(); //default page

  }


}

 

/* *********************************** */
/*                                     */
/*              SIDE MENU              */
/*                                     */
/* *********************************** */

Widget _crearMenu(){
  
  return Drawer
  (
    child: ListView
    (
     padding: EdgeInsets.zero,
      children: <Widget>
      [
          DrawerHeader
          (
            child: Container(),
             decoration: BoxDecoration
             (
                image: DecorationImage
                (
                  image: AssetImage('assets/logo.jpg'),
                  fit:BoxFit.cover
                )
             )

          ),

          _listaMenu()

      ],
    ),
  );


}

/* *********************************** */
/*                                     */
/*         ELEMENTOS DEL MENU          */
/*                                     */
/* *********************************** */

Widget _listaMenu(){

  //traemos los datos del provider
  MenuProvider menuProvider = new MenuProvider();
  menuProvider.getSubMenu();
  return FutureBuilder(
    future: menuProvider.getSubMenu(),
      builder: (BuildContext context, AsyncSnapshot snapshot)
      {
        if( snapshot.hasData )
        {
          
          return ListView.builder
            (
                     //scrollDirection: Axis.vertical, //sin estas lineas no sirve
              shrinkWrap: true, //sin estas lineas no sirve
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index)
              {
                return GestureDetector(
                    onTap: () => print(snapshot.data[index].url),
                    child: ListTile
                    (
                      title: Text( snapshot.data[index].displayname ),
                    ),
                );

              },
            );
        }else 
        {
                  
          return CircularProgressIndicator();

        }
      },
  );
}


/* *********************************** */
/*                                     */
/*                 TABS                */
/*                                     */
/* *********************************** */

List<TabItem> tabItems = List.of([
    new TabItem(Icons.art_track,      "Home", Colors.blue),
    new TabItem(Icons.access_time,    "MXM", Colors.orange),
    new TabItem(Icons.ondemand_video, "Video", Colors.red),
    new TabItem(Icons.camera_alt,     "Galeria", Colors.cyan),
]);



Widget _carousel(){

  return CarouselSlider
         (
            height: 400.0,
            //aspectRatio: 16/9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            //enlargeCenterPage: true, //efecto de carousel

            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                         children:<Widget>[
                            Card
                            (
                              elevation: 15.0,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, 'notaDetail' );
                                },
                                child: Container(
                                height: 350,
                                width: 295,
                                decoration: BoxDecoration(
                                  
                                  color: const  Color.fromRGBO(0, 83, 130, 0.7), //Color(0xff7c94b6),
                                  image: DecorationImage(
                                  
                                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                                    image: AssetImage('assets/rosario_robles_0.jpg'),
                                    fit: BoxFit.cover,

                                  ),
                                  
                                  border: Border.all(width: 1.0,color: Colors.white),
                                  //image: AssetImage('assets/logo.jpg') //Image.network('https://ep01.epimg.net/especiales/2013/resumen-anual/img/secciones/16noticias.jpg'),
                                ),
                                child: null

                                ),
                              ),

                              
                            ),

                          
                          Container(
                            height: 350,
                            // child: Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Text('Texto'),

                            // ),

                            margin: const EdgeInsets.only(bottom:80.0, left: 10.0 , right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                    'Así pasó Rosario Robles sus últimas horas de libertad',
                                    style: TextStyle(color:Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),  
                                  ),
                                
                                Text(
                                  'las 4:56 horas de este martes, la suerte de Rosario Robles estaba echada, fue vinculada a proceso y esta noche dormirá en el penal de Santa Martha',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color:Colors.white,fontSize: 12.0),  
                                ),
                              ],
                            ),


                          ),

                         ]
                         
                        
                  );
                },
              );
            }).toList(),
         );


}



void _agregar10(){

  for (var i = 1; i < 10; i++){

    _ultimoItem++;
    _listaNumeros.add( _ultimoItem );

  }

  setState(() {
    
  });

}

Future _fetchData(){

  _isLoading = true;


  setState((){});

}



Widget _cardNota(){

  // return ListView.builder(
  //   controller: _scrollController,
  //   itemCount: _listaNumeros.length,
  //   itemBuilder: (BuildContext context, int index){

  //     return CardNote();

  //   },


  // );

  //print(portadaProvider.getPortada());
  return FutureBuilder(
    future: portadaProvider.getPortada(),
    // initialData: InitialData,
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    
      if( snapshot.hasData ){
        //return CardNote( notas: snapshot.data );
        return CardDos(notas : snapshot.data);

        
        // return ListView.builder(
        //   controller: _scrollController,
        //   itemCount: snapshot.data.length,
        //   itemBuilder: (BuildContext context, int index){
          
  
        //   },


        // );



      } else {
        
        return Container();

      }

    
    },
  );

  

  // return GestureDetector(
  //     onTap: (){
  //       Navigator.pushNamed(context, 'notaDetail');
  //     },
  //     child: Card
  //     (
  //       elevation: 15.0,
  //       //margin: const EdgeInsets.only(top: 15.0),
  //       child:Column
  //       (
  //         children: <Widget>
  //         [
  //           Stack(
  //               children:<Widget>[

  //                 /* CONTAINER DE LA IMAGEN */
  //                 Container
  //                 (
  //                   height: 200.0,
  //                   width: double.infinity,
  //                   decoration: BoxDecoration
  //                   (
  //                       image: DecorationImage
  //                       (
  //                         //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
  //                         image: NetworkImage('https://www.eluniversal.com.mx/sites/default/files/styles/f03-651x400/public/2019/08/14/banorte_sucursal_falla.jpg?itok=CkiMDyM7'), 
  //                         fit: BoxFit.cover,
  //                       ),
  //                   ),
  //                 ),

  //                 /* CONTAINER DEL DEGRADADO */
  //                 Container
  //                 (
  //                   height: 200.0,
  //                   width: double.infinity,
  //                   decoration: BoxDecoration
  //                   (
  //                     color: const  Color.fromRGBO(0, 83, 130, 0.7),
  //                     gradient: LinearGradient(
  //                       begin: FractionalOffset.topCenter,
  //                       end: FractionalOffset.bottomCenter,
  //                       colors: 
  //                       [
  //                         Colors.grey.withOpacity(0.0),
  //                         Colors.black,
  //                       ],
  //                       stops: 
  //                       [
  //                         0.0,              
  //                         1.0
  //                       ]),
  //                   ),
  //                 ),


  //                // Text('Cartera', style: TextStyle(color: Colors.black),),
                    
  //                 Container
  //                   (
  //                     padding: const EdgeInsets.only(left: 5.0 , top: 5.0),
  //                     color: Color.fromRGBO(237, 33, 33, 1),
  //                     width: 100.0,
  //                     height: 25.0,
  //                     child: Text("ESTADOS", style: TextStyle(color: Colors.white, fontSize: 14.0),),
  //                     // child: FittedBox
  //                     // (
  //                     //   fit: BoxFit.contain,
  //                     //   child: Text("ESTADOS", style: TextStyle(color: Colors.white, fontSize: 10.0)),
  //                     // ),
  //                   ),
                  

  //               ]
                       
  //           ),

            
  //           Container
  //           (
  //             padding: EdgeInsets.all(10.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0),
  //                   child: Text(
  //                     'Tras falla, Banorte restablece todos sus servicios',
  //                     style: TextStyle(color:Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),  
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0),
  //                   child: Text( 
  //                     '14/08/2019 | 08:56',
  //                     textAlign: TextAlign.left,
  //                     style: TextStyle(color:Color.fromRGBO(158, 158, 158, 1),fontSize: 10.0,),  
  //                   ),
  //                 ),
  //                 Text( 
  //                   'La noche de este martes, el banco registró una falla en sus servicios de cómputo; lamentó las inconvenientes ocasionados',
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(color:Colors.black,fontSize: 13.0,),  
  //                 ),
                   
  //               ],
  //             ),
  //           )
  //         ],
  //       ),

  //     ),
  // );


}



















Widget _cardNotaCarousel(){


  return Stack(
    children: <Widget>[
        FadeInImage
            (

              image: NetworkImage('https://ep01.epimg.net/especiales/2013/resumen-anual/img/secciones/16noticias.jpg'),
              placeholder: AssetImage('assets/logo.jpg'),
              fadeOutDuration: Duration(seconds: 5),
              fit: BoxFit.cover,

            ),
        Center(child: Text("someText")),
    ]
);
  // return Card
  //   (

  //    child: FadeInImage
  //           (

  //             image: NetworkImage('https://ep01.epimg.net/especiales/2013/resumen-anual/img/secciones/16noticias.jpg'),
  //             placeholder: AssetImage('assets/logo.jpg'),
  //             fadeOutDuration: Duration(seconds: 5),
  //             fit: BoxFit.cover,

  //           ),
  //   );

}










}//llave de la clase
