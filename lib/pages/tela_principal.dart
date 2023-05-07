import 'package:conversor_moedas/pages/controller_tela_principal.dart';
import 'package:conversor_moedas/widgets/input.dart';
import 'package:conversor_moedas/widgets/statusText.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TelaPrincipalController controller = TelaPrincipalController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('\$ Conversor \$'),
          titleTextStyle: const TextStyle(
               decorationColor: Colors.black,
              fontSize: 22,
              //fontFamily: '',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0)),
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
            future: controller.getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const StatusText(
                    value: 'Carregando dados.....',
                    colorValue: Colors.amber,
                  );
                default:
                  if (snapshot.hasError) {
                    return const StatusText(
                      value: 'Erro ao carregar dados :(',
                      colorValue: Color.fromARGB(255, 180, 9, 9),
                    );
                  } else {
                    controller.dolar =
                        snapshot.data!['results']['currencies']['USD']['buy'];
                    controller.euros =
                        snapshot.data!['results']['currencies']['EUR']['buy'];

                    return ConteudoTelaPrincipal(
                      controller: controller,
                    );
                  }
              }
            }));
  }
}

class ConteudoTelaPrincipal extends StatefulWidget {
  const ConteudoTelaPrincipal({super.key, required this.controller});

  final TelaPrincipalController controller;

  @override
  State<ConteudoTelaPrincipal> createState() => _ConteudoTelaPrincipalState();
}

class _ConteudoTelaPrincipalState extends State<ConteudoTelaPrincipal> {
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController reaisController = TextEditingController();
  final TextEditingController eurosController = TextEditingController();

  void _realChanged(String value) {
     if(value.isEmpty){
      _reset();
   return;
    }
    double real = double.parse(value);
    dolarController.text = (real / widget.controller.dolar).toStringAsFixed(2);
    eurosController.text = (real / widget.controller.euros).toStringAsFixed(2);
  }

  void _euroChanged(String value) {
     if(value.isEmpty){
      _reset();
   return;
    }
    double euros = double.parse(value);
    reaisController.text = (euros *widget.controller.euros).toStringAsFixed(2);
    dolarController.text = (euros * widget.controller.euros/widget.controller.dolar).toStringAsFixed(2);
  }
  void _dolarChanged(String value) {
    if(value.isEmpty){
      _reset();
   return;
    }
    double dolar = double.parse(value);
    reaisController.text = (dolar * widget.controller.dolar).toStringAsFixed(2);
    eurosController.text = (dolar*widget.controller.euros/widget.controller.euros).toStringAsFixed(2);
  }

  void _reset(){
    dolarController.clear();
    eurosController.clear();
    reaisController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.monetization_on,
              size: 150.0,
              color: Colors.amber,
            ),
          ),
          InputTextCV(
            inputName: 'Reais',
            symbol: 'R\$',
            inputController: reaisController,
            changedFunc: _realChanged,
          ),
          InputTextCV(
              inputName: 'Euros',
              symbol: '€',
              inputController: eurosController,
              changedFunc: _euroChanged,
              ),
          InputTextCV(
              inputName: 'Dólares',
              symbol: 'US\$',
              inputController: dolarController,
              changedFunc: _dolarChanged,
              ),
        ],
      ),
    );
  }
}
