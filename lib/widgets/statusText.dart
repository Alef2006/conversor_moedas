
import 'package:flutter/cupertino.dart';

class StatusText extends StatefulWidget {
  const StatusText({
    super.key,
    required this.value,
    required this.colorValue,
    this.sizeValue
  });


  final String value;
  final Color colorValue;
  final double? sizeValue;

  @override
  State<StatusText> createState() => _StatusTextState();
}

class _StatusTextState extends State<StatusText> {
  @override
  Widget build(BuildContext context) {
    return   Center(child: Text(widget.value,
              style: TextStyle(
                color: widget.colorValue,
                fontSize: widget.sizeValue??25.0
              ),
              )
              );
            
  }
}