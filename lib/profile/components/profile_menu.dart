// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ProfileMenu extends StatelessWidget {
//   const ProfileMenu({
//     Key? key,
//     required this.text,
//     required this.icon,
//     this.press,
//   }) : super(key: key);

//   final String text, icon;
//   final VoidCallback? press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           foregroundColor: Color.fromRGBO(113, 58, 215, 0.808),
//           padding: const EdgeInsets.all(20),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           backgroundColor: const Color(0xFFF5F6F9),
//         ),
//         onPressed: press,
//         child: Row(
//           children: [
//             SvgPicture.asset(
//               icon,
//               color: Color.fromRGBO(113, 58, 215, 0.808),
//               width: 22,
//             ),
//             const SizedBox(width: 20),
//             Expanded(child: Text(text)),
//             const Icon(Icons.arrow_forward_ios),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color.fromRGBO(113, 58, 215, 0.808),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color.fromARGB(179, 246, 245, 247),
        ),
        onPressed: press,
        child: Row(
          children: [
            FutureBuilder<SvgPicture>(
              future: _loadSvg(icon),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else if (snapshot.hasError) {
                  // Handle the error gracefully
                  return Icon(Icons.error); // Placeholder for error icon
                } else {
                  return SizedBox(
                    width: 22,
                    height: 22,
                    child:
                        CircularProgressIndicator(), // Placeholder for loading indicator
                  );
                }
              },
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Future<SvgPicture> _loadSvg(String icon) async {
    final data = await rootBundle.load(icon);
    final svgString = String.fromCharCodes(data.buffer.asUint8List());
    return SvgPicture.string(
      svgString,
      color: const Color.fromRGBO(113, 58, 215, 0.808),
      width: 22,
    );
  }
}
