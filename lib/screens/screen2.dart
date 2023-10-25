import 'package:flutter/material.dart';
import 'package:sidebar/utils/colors.dart';

class secondSecreen extends StatelessWidget {
  var button1="Button 1";
  var button2="Button 2";
  var button3="Button 3";
  var button4="Button 4";
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Number of columns in the grid
      children: [
        CustomTextButton(button1, Orange_Pantone),
        CustomTextButton(button2, Avocado),
        CustomTextButton(button3,Xanthous),
        CustomTextButton(button4,Citrine),
      ],
    );
  }
}
 
class CustomTextButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  CustomTextButton(this.text, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
              
                content: Text('$text pressed successfully.',style: TextStyle(color: pressedTextColor),),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          text,
          style: TextStyle(color:white),
        ),
      ),
    );
  }
}