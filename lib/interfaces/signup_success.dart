// import 'package:flutter/material.dart';
// import 'package:rentpropertymanage/interfaces/logging_interface.dart';

// class SignupSuccessScreen extends StatelessWidget {
//   static String routeName = "/login_success";

//   const SignupSuccessScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const SizedBox(),
//         title: const Text("Login Success"),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 16),
//           Image.asset(
//             "assets/images/success.png",
//             height: MediaQuery.of(context).size.height * 0.4, //40%
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "Login Success",
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => logging_interface(),
//           ),
//         );
//               },
//               child: const Text("Back to home"),
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:rentpropertymanage/interfaces/logging_interface.dart';

class SignupSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const SignupSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
      body: Column(
        children: [
          const SizedBox(height: 106),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4, //40%
          ),
          const SizedBox(height: 16),
          const Text(
            "Sign up Success",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 229, 218, 218),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const logging_interface(),
                ));
              },
              child: const Text(
                "sign in",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 49, 48, 47),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
