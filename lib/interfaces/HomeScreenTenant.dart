import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'navigationbar.dart';
import 'new.dart';
import 'add_buttons/Add_house_screen.dart';
import 'add_buttons/Add_Vehicle_screen.dart';
import 'add_buttons/Add_room_screen.dart';

class HomeScreenTenant extends StatefulWidget {
  const HomeScreenTenant({Key? key}) : super(key: key);

  @override
  State<HomeScreenTenant> createState() => _HomeScreenTenantState();
}

class _HomeScreenTenantState extends State<HomeScreenTenant> {
  int _currentIndex = 0;

  List<Widget> _list = [
    // HomeScreenTenant(),
    newWindow(),
    newWindow(),
    newWindow(),
    newWindow(),
    //signup(),
    // YourSecondWidget(),
    // YourThirdWidget(),
    // YourFourthWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
      bottomNavigationBar: FABBottomAppBar(
        color: Color.fromARGB(255, 207, 187, 221),
        backgroundColor: Color.fromARGB(255, 123, 120, 170),
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'HOME'),
          FABBottomAppBarItem(iconData: Icons.search, text: 'SEARCH'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'ACCOUNT'),
          FABBottomAppBarItem(iconData: Icons.more_horiz, text: 'MORE'),
        ],
      ),
      body: _list[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Add',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.home),
            backgroundColor: Colors.red,
            label: 'Add House',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Add_house_Screen()),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.car_rental),
            backgroundColor: Colors.blue,
            label: 'Add vehicle',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_vehical_Screen()),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.apartment),
            backgroundColor: Colors.green,
            label: 'Add Room',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_room_Screen()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
