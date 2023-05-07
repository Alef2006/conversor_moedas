
import 'package:flutter/material.dart';





class InputTextCV extends StatefulWidget {
  const InputTextCV({super.key,
  required this.inputName,
  required this.inputController,
  required this.symbol,
  this.changedFunc
  });
  
  final TextEditingController inputController;
  final String inputName;
  final String symbol;
  final void Function(String)? changedFunc;

  @override
  State<InputTextCV> createState() => _InputTextCVState();
}

class _InputTextCVState extends State<InputTextCV> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0,14.0,7.0,14.0),
      child: TextField(
        style:const  TextStyle(color: Colors.amber),
        keyboardType:const TextInputType.numberWithOptions(decimal:true),
        controller: widget.inputController,
        decoration: InputDecoration(
          prefixText: widget.symbol,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), 
            borderSide: const BorderSide(color: Color.fromRGBO(255, 195, 14, 1))
            ),
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 216, 99))
            //borderSide: BorderSide()
          ),
          label: Text(widget.inputName),
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Colors.amber,
          ),
        ),
        onChanged: widget.changedFunc,
      ),
    );
  }
}