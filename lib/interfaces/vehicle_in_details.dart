import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewVehicle extends StatefulWidget {
  const ViewVehicle({super.key});

  @override
  State<ViewVehicle> createState() => _ViewVehicleState();
}

class _ViewVehicleState extends State<ViewVehicle> {
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
                      width: 400,
                      height: 350,
                      color: Color.fromARGB(255, 39, 5, 112),
                      child: FittedBox(
                        child: Image(
                            image: NetworkImage(
                                "https://www.casons.lk/thumbnailer.php?url=https://lrnawbodbhe5.objectstorage.uk-london-1.oci.customer-oci.com/p/wu2xha0pJLtGGKV3DjZMer1qsOsjrkKx5tWZK2krsza1dvQdDoOZvqNSQLjcG8sk/n/lrnawbodbhe5/b/ImageStorage/o/casons.lk/VehicleModelmodel/24/thumbnail.png")),
                        fit: BoxFit.fill,
                      ) //Image(image: NetworkImage("https://thearchitectsdiary.com/wp-content/uploads/2020/06/Property-.jpg")),

                      ),
                  Positioned(
                      bottom: -60,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(15),
                        height: 100,
                        width: 360,
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
                                child: Text("Mercedes Benz E 200",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17))),
                            Positioned(
                                top: 55,
                                left: 30,
                                child: Text("SELF DRIVEN",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 95, 46, 46),
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
                  height: 370,
                  width: 360,
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
                    color: Color.fromARGB(108, 226, 222, 222),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 30,
                        child: Container(
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Special Features",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.people),
                                  SizedBox(width: 10),
                                  Text("5 Passengers"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.event_seat),
                                  SizedBox(width: 10),
                                  Text("5 Seats"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.shopping_bag),
                                  SizedBox(width: 10),
                                  Text("2 bags"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.door_sliding),
                                  SizedBox(width: 10),
                                  Text("5 Doors"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.directions_car),
                                  SizedBox(width: 10),
                                  Text("Auto"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.ac_unit),
                                  SizedBox(width: 10),
                                  Text("Air conditioning"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.attach_money),
                                  SizedBox(width: 10),
                                  Text("1.01 USD Per Extra Km"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.local_gas_station),
                                  SizedBox(width: 10),
                                  Text("Free mileage: 300 KM"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.settings),
                                  SizedBox(width: 10),
                                  Text("24/7 Road Side Assistance"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.visibility_off),
                                  SizedBox(width: 10),
                                  Text("No Hidden Charges"),
                                ],
                              ),
                              Text(
                                "* Tax excluded Rates",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
