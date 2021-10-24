
import 'package:angela_bmi_5/icon_conten.dart';
import 'package:angela_bmi_5/new_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inaktiveCardColor =Color(0xFF111328);
const bottonContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

Color maleCardColour= inaktiveCardColor;
Color femaleCardColour= inaktiveCardColor;

void updateColour (int gender){
if (gender==1){
  if (maleCardColour== inaktiveCardColor){
    maleCardColour= activeCardColor;
  }else{maleCardColour=inaktiveCardColor;}
}if (gender==2){
  if (femaleCardColour== inaktiveCardColor){
    femaleCardColour= activeCardColor;
  }else{femaleCardColour=inaktiveCardColor;}
}

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 9,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(1);
                  });
                },
                child: NewCard(
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,label: "Mann",
                  ),
                  colour: maleCardColour,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(onTap: (){
            
                    setState(() {
                      updateColour(2);
                    });
                  },
                child: NewCard(cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,label: "Frau",
                  ),
                  colour: femaleCardColour,
                ),
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
              ),
            ),
            Expanded(
              child: NewCard(
                colour: activeCardColor,
              ),
            ),
          ],
        )),
        Container(
          color: bottonContainerColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 80,
        ),
      ]),
    );
  }
}



