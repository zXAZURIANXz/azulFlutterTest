

import 'package:eluniversal_test_tres/src/models/portada_model.dart';
import 'package:flutter/material.dart';
import 'package:expandable_card/expandable_card.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tweet_webview/tweet_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';



class DetailPage extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {

    final PortadaResult nota = ModalRoute.of(context).settings.arguments;
    return  Scaffold(

        body: _cardPage(nota) //_contenidoNota(nota.body)//_cardPage(nota)
        
      );
  
  }





  Widget _bodyHTML(bodyHTML){

    var style = "<style>* { font-size:45px !important; } iframe[id^='twitter-widget-']{ width:100% !important;} </style>";
    return WebView
    (
                        
      initialUrl: 'https://www.google.com.mx',
      // initialUrl: Uri.dataFromString(
      //            style + bodyHTML,parameters: { 'charset' : 'utf-8' },
      //             mimeType: 'text/html'
      //             ).toString(),

      javascriptMode: JavascriptMode.unrestricted,
    
    );


  }


  Widget _contenidoNota(String contenidoNota){

    return ListView(children: <Widget>[

      Container(
        child: Text(contenidoNota)
        
      ),
      SizedBox(
        height: 600.0,
        child:WebView(

          initialUrl: 'https://www.instagram.com/p/B1qxaf2nvVv/',
          javascriptMode: JavascriptMode.unrestricted,
          
        ) ,

      )
      

    ]);


  
  
  
  }


  Widget _cardPage(nota){

    return ExpandableCardPage(
          page: Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: nota.id,
              child: Image.network
              (
                nota.image,
                height: 400,
                fit:BoxFit.cover
              ),
            )
          ),
          expandableCard: 
          
          
          ExpandableCard(
            

            backgroundColor: Colors.white,
            hasRoundedCorners: true,
            minHeight: 500,
            maxHeight: 700,
            children: <Widget>[

                
                  SizedBox(
                      height: 600.0,
                      child: 
                      _contenidoNota(nota.body)
                  ),
                  
                    //child: TweetWebView.tweetUrl("https://twitter.com/Interior/status/463440424141459456"),
                  // child: Html(
                  //         data: nota.bodyHtml,
                  //         //Optional parameters:
                  //         padding: EdgeInsets.all(8.0),
                          
                  //         defaultTextStyle: TextStyle(fontFamily: 'serif'),
                  //         linkStyle: const TextStyle(
                  //           color: Colors.redAccent,
                  //         ),
                  //         onLinkTap: (url) {
                  //           // open url in a webview
                  //         },
                  //         onImageTap: (src) {
                  //           // Display the image in large form.
                  //         },
                  //         //Must have useRichText set to false for this to work.
                        
                       // ),
                  //child: Text(nota.body),
                
               // ),
               
              
              
               
               SizedBox(height: 50.0)
              
            ],
          ),
        );


  }




}









































// import 'package:eluniversal_test_tres/src/models/portada_model.dart';

// import 'package:flutter/material.dart';


// class DetailPage extends StatelessWidget {
//   const DetailPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

    
//     final PortadaResult nota = ModalRoute.of(context).settings.arguments;
//     print(nota);
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           _crearAppbar( nota , context ),
//           SliverList(
//             delegate: SliverChildListDelegate(

//               [
//                 SizedBox(height: 10),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
//                 Text('asdasa'),
                
//               ]

//             ),
//           )
//         ],
//       )
//     );
//   }



//   Widget _crearAppbar(nota,context){ 
//     return SliverAppBar(
//       elevation: 2.0,
//       pinned: true,
//       floating:false,
//       backgroundColor: Colors.indigoAccent,
//       shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(0.0),
//               bottomRight: Radius.circular(50.0)
//             ),
//           ),
//       expandedHeight:400.0,
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text(nota.title),
//         background: FadeInImage(
//           image: NetworkImage(nota.image),
//           fadeInDuration: Duration(microseconds: 150),
//           placeholder: AssetImage(''),
//           fit: BoxFit.cover,
//         ),
//       ),
//       leading: IconButton(icon:Icon(Icons.arrow_back),
//           onPressed:() => Navigator.pop(context, false),
//       )
//     );

//   }
// }