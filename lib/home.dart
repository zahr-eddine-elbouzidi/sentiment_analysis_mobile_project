import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentiments_analysis/start_page.dart';
import 'package:sentiments_analysis/utils/color.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /* Timer(const Duration(milliseconds: 4000), () {
    Navigator.push(
          context, MaterialPageRoute(builder: (context) => EconcPage()));
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [orangeColors, orangeLightColors],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
              ),

            ),
            SizedBox(height: 130.0),
            Center(
              child: Text(
                  'Analyse de sentiments',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
              ),
            ),
            SizedBox(height: 15.0),
            Hero(
                tag: "assetPath",
                child: Image(image: AssetImage('assets/fsr.png'),width: 100,height: 150,fit: BoxFit.contain,)
            ),
            /*Center(
              child: Text("cookieprice",
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),*/
            /*Center(
              child: Text("Informations",
                  style: TextStyle(
                      color: Colors.green[400],
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),*/
            SizedBox(height: 10.0),
            Center(
              child: Text("Ministère de l'Enseignement Supérieur",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontSize: 13.0)),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text("Université Mohammed V",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontSize: 13.0)),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text("Faculté des sciences Rabat",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontSize: 13.0)),
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text("Developpé par ",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                      fontSize: 12.0)),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text("AHMED-AMINE GUIIDAT ",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text("ZAHR-EDDINE  EL BOUZIDI ",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ),

            SizedBox(height: 60.0),
            Center(
              child: Text("Encadré par : Mr Prof. Abdelhak Mahmoudi  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text("Année universitaire: 2020-2021 ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0)),
            ),

    /*Center(
              child: Text("et de la Recherche Scientifique ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Arial',
                      fontSize: 13.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Full guide for Installation steps, Demonstration...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),*/
            SizedBox(height: 70.0),
            Center(

                child: Container(
                    /*width: MediaQuery.of(context).size.width - 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blueAccent
                    ),*/
                    child: Center(
                        child: RaisedButton(
                          onPressed: () => {
                          Navigator.push( context, MaterialPageRoute(builder: (context) => EconcPage()), )
                        },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                            child: Ink(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                            constraints:
                            BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                            "Mes sentiments - Version 1.0.0",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            ),

                            ),

                        )
                    )
                )
            ),
          ],
        ),


      ),

    );
  }
}