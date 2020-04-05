import 'package:bmi_cal/Brain.dart';
import 'package:bmi_cal/result_page.dart';
import 'package:bmi_cal/round_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icons.dart';
import 'input.dart';
import 'constants.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Color femalecolor = inactivecolor;
  Color malecolor = inactivecolor;

  void colorchecker(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      malecolor = activecolor;
      femalecolor = inactivecolor;
    } else {
      femalecolor = activecolor;
      malecolor = inactivecolor;
    }
  }

  int weight = 40;
  int height = 180;
  int age = 10;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.add), Text('BMI Calculator')],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cardslot(
                    onpressed: () {
                      setState(() {
                        colorchecker(Gender.male);
                      });
                    },
                    colour: malecolor,
                    cardchild: IconData2(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: Cardslot(
                    onpressed: () {
                      setState(() {
                        colorchecker(Gender.female);
                      });
                    },
                    colour: femalecolor,
                    cardchild: IconData2(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Cardslot(
            colour: Color(0xffef6c00),
            cardchild:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'HEIGHT',
                style: TextStyle(fontSize: 25.0),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: iconLabel),
                    Text('cm')
                  ]),
              Slider(
                  min: 180.0,
                  max: 280,
                  value: height.toDouble(),
                  inactiveColor: Colors.black,
                  activeColor: Colors.white,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  })
            ]),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cardslot(
                    colour: Color(0xffef6c00),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          weight.toString(),
                          style: iconLabel,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Cardslot(
                    colour: Color(0xffef6c00),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          age.toString(),
                          style: iconLabel,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: cal.calculateBMI(),
                          resultText: cal.getResult(),
                          interpretation: cal.getInterpretation(),
                        )),
              );
            },
            child: Container(
              child: Center(child: Text('Calculate', style: iconLabel)),
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
