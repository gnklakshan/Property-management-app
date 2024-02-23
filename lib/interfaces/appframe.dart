import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rentpropertymanage/backend/notificationservice.dart';
import 'package:rentpropertymanage/interfaces/propertyView_tenant/rentpropertyview_house_room.dart';
import 'package:rentpropertymanage/interfaces/records_interface.dart';
import 'navigator.dart';
import 'testing.dart';
import 'tenant_home.dart';
import 'package:rentpropertymanage/profile/profile_screen.dart';
import 'package:rentpropertymanage/models/popupmenu_propertyADD.dart';

// class appframe extends StatefulWidget {
//   const appframe({Key? key}) : super(key: key);

//   @override
//   State<appframe> createState() => _appframeState();
// }

// class _appframeState extends State<appframe> {
//   int _currentIndex = 0;

//   List<Widget> _list = [
//     tenantHome(),
//     //PropertyDetails(),
//     record_interface(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(25, 23, 61, 1),
//       bottomNavigationBar: FABBottomAppBar(
//         color: Color.fromARGB(255, 207, 187, 221),
//         backgroundColor: Color.fromARGB(255, 123, 120, 170),
//         selectedColor: Colors.red,
//         notchedShape: CircularNotchedRectangle(),
//         onTabSelected: _onTapped,
//         items: [
//           FABBottomAppBarItem(iconData: Icons.home, text: 'HOME'),
//           FABBottomAppBarItem(iconData: Icons.history, text: 'RECORDS'),
//           FABBottomAppBarItem(iconData: Icons.account_circle, text: 'ACCOUNT'),
//         ],
//       ),
//       body: _list[_currentIndex],
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: _currentIndex == 0
//           //_currentIndex != _list.length - 1 // Check if it's not the last tab
//           ? SpeedDial(
//               animatedIcon: AnimatedIcons.add_event,
//               animatedIconTheme: IconThemeData(size: 22.0),
//               closeManually: false,
//               curve: Curves.bounceIn,
//               overlayColor: Colors.black,
//               overlayOpacity: 0.5,
//               onOpen: () => print('OPENING DIAL'),
//               onClose: () => print('DIAL CLOSED'),
//               tooltip: 'Add',
//               heroTag: 'speed-dial-hero-tag',
//               backgroundColor: Color.fromARGB(255, 124, 183, 217),
//               foregroundColor: Colors.black,
//               elevation: 8.0,
//               shape: CircleBorder(),
//               children: [
//                 SpeedDialChild(
//                   child: Icon(Icons.home),
//                   backgroundColor: Colors.red,
//                   label: 'Rent House',
//                   labelStyle: TextStyle(fontSize: 18.0),
//                   onTap: () {
//                     opendialog(context, 'House');
//                   },
//                 ),
//                 SpeedDialChild(
//                   child: Icon(Icons.car_rental),
//                   backgroundColor: Colors.blue,
//                   label: 'Rent vehicle',
//                   labelStyle: TextStyle(fontSize: 18.0),
//                   onTap: () {
//                     opendialog(context, 'Vehicle');
//                   },
//                 ),
//                 SpeedDialChild(
//                   child: Icon(Icons.apartment),
//                   backgroundColor: Colors.green,
//                   label: 'Rent Room',
//                   labelStyle: TextStyle(fontSize: 18.0),
//                   onTap: () async {
//                     //opendialog(context, 'Room');
//                     opendialognotifi(context);
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (context) => window_screen_test()),
//                     // );
//                   },
//                 ),
//               ],
//             )
//           : null,
//     );
//   }

//   void _onTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }

class appframe extends StatefulWidget {
  const appframe({Key? key}) : super(key: key);

  @override
  State<appframe> createState() => _appframeState();
}

class _appframeState extends State<appframe> {
  int _currentIndex = 0;

  List<Widget> _list = [
    tenantHome(),
    //PropertyDetails(),
    record_interface(),
    ProfileScreen(),
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
          FABBottomAppBarItem(iconData: Icons.history, text: 'RECORDS'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'ACCOUNT'),
        ],
      ),
      body: _list[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _currentIndex == 0
          //_currentIndex != _list.length - 1 // Check if it's not the last tab
          ? SpeedDial(
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
              backgroundColor: Color.fromARGB(255, 124, 183, 217),
              foregroundColor: Colors.black,
              elevation: 8.0,
              shape: CircleBorder(),
              children: [
                SpeedDialChild(
                  child: Icon(Icons.home),
                  backgroundColor: Colors.red,
                  label: 'Rent House',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    opendialog(context, 'House');
                  },
                ),
                SpeedDialChild(
                  child: Icon(Icons.car_rental),
                  backgroundColor: Colors.blue,
                  label: 'Rent vehicle',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    opendialog(context, 'Vehicle');
                  },
                ),
                SpeedDialChild(
                  child: Icon(Icons.apartment),
                  backgroundColor: Colors.green,
                  label: 'Rent Room',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () async {
                    opendialog(context, 'Room');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => window_screen_test()),
                    // );
                  },
                ),
              ],
            )
          : null,
    );
  }

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
