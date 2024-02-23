import 'package:flutter/material.dart';

class MPD_button extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final Function()? onTapvar;
  const MPD_button({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    this.onTapvar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: onTapvar,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF000076),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 36, 36, 164),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(iconImagePath),
                  ),
                ),
                /*
                SizedBox(
                  height: 2,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[200],
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
