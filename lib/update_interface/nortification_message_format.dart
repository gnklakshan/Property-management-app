import 'package:flutter/material.dart';

class NM_format extends StatelessWidget {
  final String date;
  final String time;
  final String tenant_name;
  final String message_type;
  final String messsage_note;
  const NM_format({
    Key? key,
    required this.date,
    required this.time,
    required this.tenant_name,
    required this.message_type,
    required this.messsage_note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 180,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          //color: Color(0xFF4fc3f7),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color(0xFF000076),
              Color(0xFF0000a4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                message_type,
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 116, 238),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFF000076),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.white, width: 1.0)),
                child: Text(
                  tenant_name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            messsage_note,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '',
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 19, 236),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 250,
              ),
              Text(
                date,
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 116, 238),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                '',
                style: TextStyle(
                  color: Color(0xFFffffff),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 250,
              ),
              Text(
                time,
                style: TextStyle(
                  color: Color(0xFFffffff),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
