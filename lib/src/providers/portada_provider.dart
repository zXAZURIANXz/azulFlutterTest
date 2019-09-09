
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eluniversal_test_tres/src/models/portada_model.dart';


class PortadaProvider {

  Future<List<PortadaResult>> getPortada() async {

    final url = Uri.https('api.eluniversal.com.mx', 'v3/notes/eluniversal/mxm/json/home/portada');
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    //print(decodedData.length);

    final portadaresults = new PortadaResults.fromJsonList(decodedData);
    
    print(portadaresults.items[0].title);

    return portadaresults.items;

  }




}