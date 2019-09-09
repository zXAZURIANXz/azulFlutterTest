
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eluniversal_test_tres/src/models/menu_model.dart';

class MenuProvider{


  Future<List<MenuResult>> getMenu() async {

    final url = Uri.https('api.eluniversal.com.mx','main-feeds/main.json');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    //print(decodedData['menu']);
    
    final menusresults = new MenusResults.fromJsonList(decodedData['menu']);
    //print(menusresults.items[1].name);
    
    return menusresults.items;


  }


  Future<List<SubmenuResult>> getSubMenu() async {

    final url = Uri.https('api.eluniversal.com.mx','main-feeds/main.json');
    final resp = await http.get(url);
    //decode para mostrar los acentos
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    //print(decodedData['menu'][2]['submenu']);
    final submenusresults = new SubmenuResults.fromJsonList(decodedData['menu'][2]['submenu']);
    //print(submenusresults.items[3].name);
    
    return submenusresults.items;


  }

 


}