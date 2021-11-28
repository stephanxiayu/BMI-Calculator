import 'package:angela_bmi_5/constants.dart';
import 'package:angela_bmi_5/input_page.dart';
import 'package:angela_bmi_5/new_card.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 9,
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              child: Center(
                  child: Text(
                "Dein Ergebnis",
                style: kTitleText,
              )),
            )),
            Expanded(
              flex: 5,
              child: NewCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Normal",
                      style: kResultTextStyle,
                    ), Text("28.3", style: kBMIText,), 
                    Text("Dein BMI Ergebnis ist hoch, du solltes, weniger essen!", style:kBodyMI ,
                    textAlign: TextAlign.center,), 
                          
                  ],
                ),
              ),
            ), 
              GestureDetector(onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));

        },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              child: Center(child: Text("Neu Berechnen",style:kLargeButton ,)),
              color: bottonContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
            ),
          ),
        ),
          ],
        ));
  }
}
