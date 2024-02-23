import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProperty extends StatefulWidget {
  const ViewProperty({super.key});

  @override
  State<ViewProperty> createState() => _ViewPropertyState();
}

class _ViewPropertyState extends State<ViewProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      width: 425,
                      height: 350,
                      color: Colors.lightBlue,
                      child: FittedBox(
                        child: Image(
                            image: NetworkImage(
                                "https://thearchitectsdiary.com/wp-content/uploads/2020/06/Property-.jpg")),
                        fit: BoxFit.fill,
                      ) //Image(image: NetworkImage("https://thearchitectsdiary.com/wp-content/uploads/2020/06/Property-.jpg")),

                      ),
                  Positioned(
                      bottom: -60,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(15),
                        height: 100,
                        width: 383,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5)),
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 20,
                                left: 30,
                                child: Text("Sirimal Uyana Property",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17))),
                            Positioned(
                                top: 55,
                                left: 30,
                                child: Text("3 Bed Rooms, 2 Bath Rooms",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15))),
                            Positioned(
                                top: 30,
                                left: 250,
                                child: Text("Rs.30 000",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 23))),
                          ],
                        ),
                        //color: Colors.black,
                      ))
                ],
              ),
            ),
            Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
            Positioned(
                top: 20,
                left: 350,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.dehaze,
                      color: Colors.white,
                    ))),
            Positioned(
                top: 400,
                child: Container(
                  margin: EdgeInsets.all(15),
                  height: 300,
                  width: 383,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(5, 5)),
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(-5, -5))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 30,
                          left: 30,
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Special Features",
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 70,
                          left: 30,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FittedBox(
                                    child: Image(
                                        image: NetworkImage(
                                            "https://backyardpoolpatio.com/wp-content/uploads/2022/08/Leisure-Pools-Supreme-Graphite-Grey-leisure-pools-inside.webp")),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                          top: 70,
                          left: 203,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FittedBox(
                                    child: Image(
                                        image: NetworkImage(
                                            "https://www.premierbuiltgarages.ca/wp-content/uploads/2021/05/Detached-Garage-with-open-door-and-unfinished-interior.jpg")),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                          top: 235,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                              ),
                              Icon(Icons.pool),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Pool"),
                              SizedBox(
                                width: 113,
                              ),
                              Icon(Icons.pool),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Garage"),
                            ],
                          ))
                    ],
                  ),
                )),
            Positioned(
                top: 750,
                child: Row(children: [
                  SizedBox(
                    width: 135,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Current Tenant",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ))
                ]))
          ],
        ),
      ),
    );
  }
}
