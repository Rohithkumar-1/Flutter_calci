import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
 String inputValue = "";
 String calvalue = "";
 String operator = "";

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.black,
      body:Column(

        children: [

        Container(
          alignment: Alignment.bottomRight,
          child: Text(inputValue,
        style: TextStyle(color: Colors.white,fontSize: 75),
        ),
        ),

          Column(
            children: [
              Row(
                children: [
                  calcibutton("7", Colors.white38),
                  calcibutton("8", Colors.white38),
                  calcibutton("9", Colors.white38),
                  calcibutton("/", Colors.orange),   
                ],
              ),
              Row(
                children: [
                  calcibutton("4", Colors.white38),
                  calcibutton("5", Colors.white38),
                  calcibutton("6", Colors.white38),
                  calcibutton("*", Colors.orange),   
                ],
              ),
              Row(
                children: [
                  calcibutton("1", Colors.white38),
                  calcibutton("2", Colors.white38),
                  calcibutton("3", Colors.white38),
                  calcibutton("-", Colors.orange),   
                ],
              ),
              Row(
                children: [
                  calcibutton("0", Colors.white38),
                  calcibutton(".", Colors.white38),
                  calcibutton("=", Colors.orange),
                  calcibutton("+", Colors.orange),   
                ],
              )
            ],
          ),
            calcibutton("Clear",Colors.black),
        ],
      ),
      ),
    );
  }

  Widget calcibutton(String text, Color bgcolor){
    return InkWell(
      onTap: () {
        if(text=="Clear"){
         setState(() {
           inputValue = "";
           operator = "";
           calvalue = "";
         });
        }
        else if(text == "+"|| text=="-"||text=="*"||text=="/"){
          setState(() {
            calvalue = inputValue;
            inputValue = "";
            operator = text;
          });
        }
        else if(text=="="){
          setState(() {
            double cal = double.parse(calvalue);
            double val = double.parse(inputValue);
            if(operator=="+"){
             inputValue = (cal + val).toString();
          }
          else if(operator=="-"){
             inputValue = (cal - val).toString();
          }
          else if(operator=="*"){
             inputValue = (cal * val).toString();
          }
          else if(operator=="/"){
             inputValue = (cal / val).toString();
          } 
          });
        }
        else{
        setState(() {
          inputValue = inputValue+text;
        });
        }
      },
      child: Container(
                      decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      margin: EdgeInsets.all(10),
                      height:MediaQuery.of(context).size.width/7,
                      width: MediaQuery.of(context).size.width/5,
                      alignment: Alignment.center ,
                      child: Text(text,
                      style: TextStyle(color: Colors.white ,fontSize: 30),
                      ),
                    ),
    );
  }
}
