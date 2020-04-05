
import 'package:flutter/material.dart';

class Cardslot extends StatelessWidget {



  Cardslot({@required this.colour, this.cardchild,this.onpressed});
  final Color colour;
  final Widget cardchild;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: onpressed,
          child: Container(
        child: cardchild,
        margin: EdgeInsets.all(11.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: colour),
      ),
    );
  }
}
