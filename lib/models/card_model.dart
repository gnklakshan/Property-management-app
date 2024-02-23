import 'package:flutter/material.dart';
import 'package:rentpropertymanage/interfaces/propertyView_tenant/rentpropertyview_house_room.dart';
import 'package:rentpropertymanage/interfaces/propertyView_tenant/rentpropertyview_vehicle.dart';
import 'package:rentpropertymanage/interfaces/testing.dart';

class propertycard extends StatefulWidget {
  final String date;
  final String Name;
  final bool ispaid;
  final String startdate;
  final String enddate;
  final String type;

  const propertycard(
      {super.key,
      required this.date,
      required this.Name,
      required this.ispaid,
      required this.startdate,
      required this.enddate,
      required this.type});

  @override
  State<propertycard> createState() => _propertycardState();
}

class _propertycardState extends State<propertycard> {
  @override
  Widget build(BuildContext context) {
    String property_type = widget.type;
    return GestureDetector(
      onTap: () {
        if (property_type != 'Vehicle') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetails(
                propertyName: widget.Name,
                propertyDate: widget.date,
                propertyIsPaid: widget.ispaid,
                propertystartDate: widget.startdate,
                propertyendDate: widget.enddate,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetails_vehicle(
                propertyName: widget.Name,
                propertyDate: widget.date,
                propertyIsPaid: widget.ispaid,
                propertystartDate: widget.startdate,
                propertyendDate: widget.enddate,
              ),
            ),
          );
        }
      },
      // return GestureDetector(
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => window_screen_test(),
      //       ),
      //     );
      //   },
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: Stack(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: const LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Color.fromARGB(255, 11, 0, 40),
            //         Color.fromARGB(255, 15, 29, 99),
            //         Color.fromARGB(255, 10, 3, 41),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.circular(35),
            //   ),
            //   child: Row(
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: CircleAvatar(
            //           radius: 26,
            //           backgroundColor: Colors.transparent,
            //           backgroundImage: AssetImage('assets/images/new.jpg'),
            //           foregroundColor: Colors.white,
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             widget.Name,
            //             style: const TextStyle(
            //                 fontSize: 18.0,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.white70),
            //           ),
            //           Row(
            //             children: [
            //               Text(
            //                 widget.date,
            //                 style: TextStyle(
            //                     fontSize: 16.0,
            //                     fontWeight: FontWeight.w300,
            //                     color:
            //                         const Color.fromARGB(156, 255, 255, 255)),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 11, 0, 40),
                    Color.fromARGB(255, 15, 29, 99),
                    Color.fromARGB(255, 10, 3, 41),
                  ],
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                children: [
                  if (property_type == 'Vehicle')
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/car_02.jpg'),
                        foregroundColor: Colors.white,
                      ),
                    )
                  else if (property_type == 'Room')
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/room_1.jpg'),
                        foregroundColor: Colors.white,
                      ),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/hous_3.jpg'),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.Name,
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.date,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                                color:
                                    const Color.fromARGB(156, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              top: 10.0,
              right: 22.0,
              child: Container(
                height: 25,
                width: 60,
                child: Center(
                  child: Text(
                    widget.ispaid ? 'PAID' : 'PAY',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.ispaid
                        ? [
                            Color.fromARGB(255, 1, 48, 6),
                            Color.fromARGB(255, 12, 156, 86),
                            Color.fromARGB(255, 1, 48, 6)
                          ]
                        : [
                            Color.fromARGB(255, 75, 31, 7),
                            Color.fromARGB(255, 224, 29, 4),
                            Color.fromARGB(255, 48, 14, 1)
                          ],
                    // colors: [
                    //   Color.fromARGB(255, 1, 48, 6),
                    //   Color.fromARGB(255, 12, 156, 86),
                    //   Color.fromARGB(255, 1, 48, 6),
                    // ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
