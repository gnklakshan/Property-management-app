import 'package:flutter/material.dart';
import 'Add_property_screen.dart';
import 'property_data_model.dart';

class list_Screen extends StatelessWidget {
  list_Screen({super.key});

  static List<String> price_v = [
    'Rs. 90000',
    'Rs. 65000',
    'Rs. 18000/perday',
    'Rs. 9000'
  ];
  static List<String> url_v = [
    'assets/room_1.jpg',
    'assets/room_1.jpg',
    'assets/room_1.jpg',
    'assets/room_1.jpg'
  ];
  final List<propertyDataModel> price_data = List.generate(
      price_v.length,
      (index) => propertyDataModel('${price_v[index]}', '${url_v[index]}',
          '${price_v[index]} Description...'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Property List',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF19173d),
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xFF19173d),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/room_1.jpg'),
                      fit: BoxFit.cover)),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(300, 71),
                    primary: Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(width: 3, color: Colors.white)),
                child: Text(
                  'Add Property',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 252, 252, 252)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Add_property_Screen()));
                }),
          ],
        ));
  }
}
