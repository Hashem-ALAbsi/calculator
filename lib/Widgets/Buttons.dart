import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String textbutton;
  final buttentapped;
  MyButton({this.color, this.textcolor, required this.textbutton,this.buttentapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttentapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textbutton,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
