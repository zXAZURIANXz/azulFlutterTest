
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

/*PAGES*/

import 'package:eluniversal_test_tres/src/pages/home_page.dart';
import 'package:eluniversal_test_tres/src/pages/detail_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El universal Test',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

      ],
      supportedLocales: [
        const Locale('es', 'ES'), // Epañol
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      initialRoute: '/',
      routes: <String, WidgetBuilder> {

        '/' : ( BuildContext contex ) => HomePage(),
        '/notaDetail' : ( BuildContext contex ) => DetailPage()
          
      },
    );
  }
}