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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Text classification'),
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

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Container(

                              padding: const EdgeInsets.all(16),

                              color: prediction[0] > 0.40
                                  ? Colors.lightGreen
                                  : Colors.redAccent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Message : $text",
                                    style: const TextStyle(fontSize: 16 , color: Colors.white),

                                  ),
                                  Text("Prédiction :"),
                                  Text(
                                    prediction[0] > 0.40 ? "Positive avec un score de : ${prediction[0]*100}%" :
                                    "Négative avec un score de ${prediction[0]*100}%",

                                  ),

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