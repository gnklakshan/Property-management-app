// //version 2-------------------------------------------
// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:circular_charts/circular_charts.dart';
// // import 'package:flutter/material.dart';

// // class newWindow extends StatefulWidget {
// //   const newWindow({super.key});

// //   @override
// //   State<newWindow> createState() => newWindowstate();
// // }

// // class newWindowstate extends State<newWindow> {
// //   int _currentIndex = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         backgroundColor: Color.fromRGBO(25, 23, 61, 1),
// //         appBar: AppBar(
// //           backgroundColor: Color.fromARGB(255, 25, 23, 61),
// //           leading: const Padding(
// //             padding: EdgeInsets.all(4.0),
// //             child: Material(
// //               shape: CircleBorder(),
// //               color: Colors.blueGrey,
// //             ),
// //           ),
// //           title: const Text(
// //             'Welcome back!\nNuwan',
// //             style: TextStyle(color: Colors.white),
// //           ),
// //           actions: <Widget>[
// //             IconButton(
// //               onPressed: () {
// //                 // Add button function
// //               },
// //               icon: const Icon(Icons.add_alert, color: Colors.white),
// //             ),
// //             IconButton(
// //               onPressed: () {
// //                 // Add another button function
// //               },
// //               icon: const Icon(Icons.more_vert, color: Colors.white),
// //             ),
// //           ],
// //         ),
// //         body: ClipPath(
// //           clipper: CustomClipPath(),
// //           child: Container(
// //             color: Color.fromARGB(124, 18, 17, 46),
// //             height: double.infinity,
// //           ),
// //         ));
// //   }
// // }

// //Version final
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class newWindow extends StatefulWidget {
//   const newWindow({Key? key}) : super(key: key);

//   @override
//   State<newWindow> createState() => newWindowstate();
// }

// class newWindowstate extends State<newWindow> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(25, 23, 61, 1),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 25, 23, 61),
//         leading: const Padding(
//           padding: EdgeInsets.all(4.0),
//           child: Material(
//             shape: CircleBorder(),
//             color: Colors.blueGrey,
//           ),
//         ),
//         title: const Text(
//           'Welcome back!\nNuwan',
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               // Add button function
//             },
//             icon: const Icon(Icons.add_alert, color: Colors.white),
//           ),
//           IconButton(
//             onPressed: () {
//               // Add another button function
//             },
//             icon: const Icon(Icons.more_vert, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: CustomClipPath(),
//             child: Container(
//               color: Color.fromARGB(124, 18, 17, 46),
//               height: double.infinity,
//             ),
//           ),
//           Positioned(
//             top: 25, // Adjust the position as needed
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 240, // Increase the height as needed
//               child: PieChart(
//                 PieChartData(
//                   sectionsSpace: 10,
//                   centerSpaceRadius: 80, // Adjust the center space radius
//                   sections: [
//                     PieChartSectionData(
//                       color: const Color(0xff0293ee),
//                       value: 40,
//                       title: '40%', // Add a label
//                       radius: 55,
//                       titleStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xffffffff),
//                       ),
//                     ),
//                     PieChartSectionData(
//                       color: const Color(0xfff8b250),
//                       value: 30,
//                       title: '30%', // Add a label
//                       radius: 55,
//                       titleStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xffffffff),
//                       ),
//                     ),
//                     PieChartSectionData(
//                       color: const Color(0xff845bef),
//                       value: 30,
//                       title: '30%', // Add a label
//                       radius: 55,
//                       titleStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xffffffff),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomClipPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;

//     // final path = Path();

//     // path.moveTo(w * 0.002, h * 1.002);
//     // path.lineTo(w * 1.004, h * 1.008);
//     // path.lineTo(w, h * 0.3);
//     // path.quadraticBezierTo(w * 0.85, h * 0.3015, w * 0.8, h * 0.302);
//     // path.cubicTo(w * 0.72504, h * 0.352215, w * 0.70532, h * 0.49536,
//     //     w * 0.50016, h * 0.50286);
//     // path.cubicTo(
//     //     w * 0.29946, h * 0.49904, w * 0.2964, h * 0.35072, w * 0.2, h * 0.3);
//     // path.quadraticBezierTo(w * 0.09188, h * 0.29836, w * -0.002, h * 0.302);
//     // path.lineTo(w * 0.002, h * 1.002);
//     // path.close();

//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.0010000, size.height * 0.2521667);
//     path_0.lineTo(size.width * 0.0010000, size.height * 1.0046667);
//     path_0.lineTo(size.width * 1.0043333, size.height * 1.0071667);
//     path_0.lineTo(size.width * 1.0076667, size.height * 0.2530000);
//     path_0.quadraticBezierTo(size.width * 0.9530000, size.height * 0.2534750,
//         size.width * 0.9276333, size.height * 0.2536333);
//     path_0.cubicTo(
//         size.width * 0.8293500,
//         size.height * 0.3054667,
//         size.width * 0.8899667,
//         size.height * 0.4184000,
//         size.width * 0.5059833,
//         size.height * 0.4502917);
//     path_0.cubicTo(
//         size.width * 0.0666000,
//         size.height * 0.4173833,
//         size.width * 0.1705833,
//         size.height * 0.2894667,
//         size.width * 0.0606167,
//         size.height * 0.2527833);
//     path_0.quadraticBezierTo(size.width * 0.0372667, size.height * 0.2530417,
//         size.width * 0.0010000, size.height * 0.2521667);
//     path_0.close();

//     return path_0;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class newWindow extends StatefulWidget {
  const newWindow({Key? key}) : super(key: key);

  @override
  State<newWindow> createState() => _NewWindowState();
}

class _NewWindowState extends State<newWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 23, 61),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Material(
            shape: CircleBorder(),
            color: Colors.blueGrey,
          ),
        ),
        title: const Text(
          'Welcome back!\nNuwan',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Add button function
            },
            icon: const Icon(Icons.add_alert, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              // Add another button function
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              color: Color.fromARGB(124, 18, 17, 46),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      gradient: LinearGradient(
                          colors: [Colors.amber, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          offset: Offset(5, 5),
                          blurRadius: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Container(
              height: 240,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 10,
                  centerSpaceRadius: 80,
                  sections: [
                    PieChartSectionData(
                      color: const Color(0xff0293ee),
                      value: 40,
                      title: '40%',
                      radius: 55,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    PieChartSectionData(
                      color: const Color(0xfff8b250),
                      value: 30,
                      title: '30%',
                      radius: 55,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    PieChartSectionData(
                      color: const Color(0xff845bef),
                      value: 30,
                      title: '30%',
                      radius: 55,
                      titleStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.0010000, size.height * 0.2521667);
    path.lineTo(size.width * 0.0010000, size.height * 1.0046667);
    path.lineTo(size.width * 1.0043333, size.height * 1.0071667);
    path.lineTo(size.width * 1.0076667, size.height * 0.2530000);
    path.quadraticBezierTo(size.width * 0.9530000, size.height * 0.2534750,
        size.width * 0.9276333, size.height * 0.2536333);
    path.cubicTo(
        size.width * 0.8293500,
        size.height * 0.3054667,
        size.width * 0.8899667,
        size.height * 0.4184000,
        size.width * 0.5059833,
        size.height * 0.4502917);
    path.cubicTo(
        size.width * 0.0666000,
        size.height * 0.4173833,
        size.width * 0.1705833,
        size.height * 0.2894667,
        size.width * 0.0606167,
        size.height * 0.2527833);
    path.quadraticBezierTo(size.width * 0.0372667, size.height * 0.2530417,
        size.width * 0.0010000, size.height * 0.2521667);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
