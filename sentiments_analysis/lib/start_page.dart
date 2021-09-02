import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentiments_analysis/classifier.dart';


class EconcPage extends StatefulWidget {

  @override
  _EconcPageState createState() => _EconcPageState();
}

class _EconcPageState extends State<EconcPage> {

  late TextEditingController _controller;
  late Classifier _classifier;
  late List<Widget> _children;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _classifier = Classifier();
    _children = [];
    _children.add(Container());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Mes sentiments'),
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                    itemCount: _children.length,
                    itemBuilder: (_, index) {
                      return _children[index];
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent)),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'Taper ici'),
                      controller: _controller,
                    ),
                  ),
                  TextButton(
                    child: const Text('Classifier'),
                    onPressed: () {
                      final text = _controller.text;
                      final prediction = _classifier.classify(text);
                      setState(() {
                        _children.add(Dismissible(
                          key: GlobalKey(),
                          onDismissed: (direction) {},
                          child: Card(
                            shadowColor: Colors.amber,
                            clipBehavior: Clip.antiAlias,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.indigo , Colors.black],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight
                                )
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Message : $text",
                                    style: TextStyle(fontSize: 16 , color: Colors.white),
                                  ),
                                  SizedBox(height : 12),
                                  Text(
                                    "Prédiction:",
                                    style: TextStyle(fontSize: 14 , color: Colors.white54),
                                  ),
                                  SizedBox(height : 10),

                                  Text(
                                    prediction[0] > 0.40 ? "Positive avec un score de : ${(prediction[0]*100).toStringAsFixed(2)}%" :
                                    "Négative avec un score de ${(prediction[0]*100).toStringAsFixed(2)}%",
                                    style: TextStyle(fontSize: 16 ,

                                        color : prediction[0] > 0.40
                                      ? Colors.lightGreen
                                      : Colors.redAccent,),
                                  ),
                                  Icon(
                                    prediction[0] > 0.40 ? Icons.sentiment_satisfied_rounded : Icons.sentiment_dissatisfied_sharp,
                                    color : prediction[0] > 0.40
                                        ? Colors.green
                                        : Colors.yellow,
                                    size: 20.0,
                                  ),
                                  SizedBox(height : 8),
                                  TextButton(
                                      onPressed: (){

                                      },
                                      child: Text('Supprimer'))
                                ],
                              ),
                            ),

                          ),
                        ));
                        _controller.clear();
                      });
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}