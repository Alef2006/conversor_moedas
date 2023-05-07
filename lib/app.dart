






import 'package:conversor_moedas/pages/tela_principal.dart';
import 'package:flutter/material.dart';



class ConversorDeMoedas extends StatelessWidget {
  const ConversorDeMoedas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: '/principal',
       routes: {
        '/principal':(context) =>const TelaPrincipal(),
       },
         theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white,
      inputDecorationTheme:const  InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        hintStyle: TextStyle(color: Colors.amber),
      )),
    );
  }
}