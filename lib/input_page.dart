import 'package:angela_bmi_5/constants.dart';
import 'package:angela_bmi_5/icon_conten.dart';
import 'package:angela_bmi_5/new_card.dart';
import 'package:angela_bmi_5/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height = 180;
  int weight = 60;
  int age= 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 9,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: NewCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: "Mann",
                ),
                colour: selectedGender == Gender.male
                    ? activeCardColor
                    : inaktiveCardColor,
              ),
            ),
            Expanded(
              child: NewCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: "Frau",
                ),
                colour: selectedGender == Gender.female
                    ? activeCardColor
                    : inaktiveCardColor,
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: NewCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Größe",
                      style: labelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: zifferTextStyle),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.white,
                          thumbColor: bottonContainerColor,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        min: 120,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                colour: activeCardColor,
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: NewCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Gewicht",
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: zifferTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ])
                  ],
                ),
              ),
            ),
            Expanded(
              child: NewCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alter",
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: zifferTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ],
        )),
        GestureDetector(onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Results()));

        },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              child: Center(child: Text("Ergebnis",style:kLargeButton ,)),
              color: bottonContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
            ),
          ),
        ),
      ]),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const RoundIconButton(
      {Key key, @required this.onPressed, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 9,
      disabledElevation: 9,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey.shade700,
    );
  }
}
