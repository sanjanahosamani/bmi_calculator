import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result = null ;
  String bmi="";

  void Calculate() {
    setState(() {
      int age = int.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      if ((_ageController.toString().isNotEmpty && age > 0) || (_weightController.toString().isNotEmpty && weight > 0) || (_heightController.toString().isNotEmpty && height > 0)) {
        _result = (703* weight) / pow(height * 12, 2);
      }
      if (_result >= 25.0 && _result < 29.9) {
        bmi = "Overweight";
      }
      else if (_result >= 18.5 && _result < 25.0) {
        bmi = "Healty";
      }
      else if (_result >= 29.9) {
        bmi = "Obese";
      }
      else {
        bmi = "Underweight";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index", style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold,
            color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: EdgeInsets.all(5.0),
            children: <Widget>[
              Image.asset(
                "assets/logo/bmi.png", height: 80, width: 85,
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text("YOUR PERSONAL INFORMATION",
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Container(
                            child:
                            Image.asset("assets/logo/age.png",width: 30,),
                          ),
                          Spacer(),

                          Container(
                            width: MediaQuery.of(context).size.width*0.75,
                            child: TextField(

                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Age",
                                hintText: "Enter your age",

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[

                          Container(
                            child: Image.asset(
                              "assets/logo/height.png", width: 30,),
                          ),
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width*0.75,

                            child: TextField(

                              controller: _heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Height",
                                hintText: "in feet",

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[

                          Container(
                            child: Image.asset(
                              "assets/logo/weight.jpg", width: 30,),
                          ),
                          Spacer(),

                          Container(
                            width: MediaQuery.of(context).size.width*0.75,

                            child: TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Weight",
                                hintText: "in lbs",

                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: (){
                              Calculate();

                            },
                            child: Container(
                              height: 40,
                              width: 120,


                              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10),),
                              child: Center(child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.bold),)),

                            ),
                          )
                      ),
                    ],
                  )),

              _result==null?Container():Center(
                  child: Text("Your BMI is ${_result.toStringAsFixed(0)}",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),
                  )
              ),
              Center(
                child: Text(
                  "$bmi",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
                    color:Colors.red),
                ),
              )
            ],
          )
      ),
    );
  }
}

