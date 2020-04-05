import 'package:bmi_cal/input.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultPage extends StatelessWidget{
 final String bmiResult,resultText,interpretation;
 ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Your Result', style: iconLabel),
          Expanded(
            flex: 5,
            child: Cardslot(
              colour: activecolor,
              cardchild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(bmiResult.toUpperCase(),
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900)),
                    Text(
                      interpretation.toUpperCase(),
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                          ),
                          
                   
                  ],
                ),
              ),
            ),
          ),GestureDetector(
            onTap: () {
                Navigator.pop(context);
            },
            child: Container(
                child: Center(child: Text('Re-Calculate', style: iconLabel)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: activecolor),
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0),
                height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
