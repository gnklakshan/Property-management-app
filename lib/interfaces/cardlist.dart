import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() {
    return CardViewState();
  }
}

class CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          title: const Text('CardView',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              )),
        ),
        body: Card(
            elevation: 30,
            margin: const EdgeInsets.all(10),
            color: Colors.green.shade600,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                side: BorderSide(color: Colors.yellow.shade800, width: 2)),
            clipBehavior: Clip.antiAlias,
            child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Apple iPhone 14 Pro Max",
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Powerful A14 Bionic chip, 5G capability, and a stunning Super Retina XDR display.',
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  height: 1.3,
                                  fontWeight: FontWeight.w500,
                                ))
                          ])),
                ])));
  }
}
