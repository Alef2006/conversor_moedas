
import 'dart:convert';
import 'package:http/http.dart' as http;

const request='https://api.hgbrasil.com/finance?format=json-cors&key=c00b251a';

  

class TelaPrincipalController{

late double dolar;
late double euros;

Future<Map> getData() async{
 http.Response response= await http.get(Uri.parse(request));
 return json.decode(response.body);
}

 


}