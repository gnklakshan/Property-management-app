// // ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:rentpropertymanage/backend/authentication.dart';
import 'package:rentpropertymanage/interfaces/testing.dart';
import 'package:rentpropertymanage/update_interface/owner_dashboard.dart';
import 'signup_interface.dart';
import 'appframe.dart';

// class logging_interface extends StatefulWidget {
//   const logging_interface({Key? key}) : super(key: key);

//   @override
//   State<logging_interface> createState() => _logging_interfaceState();
// }

// class _logging_interfaceState extends State<logging_interface> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   bool _isPasswordVisible = false;
//   bool _rememberMe = false;
//   bool isTenant = true; // Default value changed to true

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Color.fromRGBO(10, 9, 24, 1),
//             Color.fromRGBO(25, 23, 61, 1),
//           ]),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 160.0),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             LiteRollingSwitch(
//               onTap: () {
//                 print('Single tap occurred');
//                 // Add your code for single tap action here
//               },
//               onDoubleTap: () {
//                 print('double tap occurred');
//                 // Add your code for single tap action here
//               },
//               onSwipe: () {
//                 print('swipe occurred');
//                 // Add your code for single tap action here
//               },
//               value: true,
//               textOn: 'Tenant',
//               textOff: 'Owner',
//               colorOn: Colors.blue,
//               colorOff: Colors.cyan,
//               iconOn: Icons.done,
//               iconOff: Icons.remove_circle_outline,
//               textSize: 16.0,
//               onChanged: (bool state) {
//                 setState(() {
//                   isTenant = state;
//                 });
//               },
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               child: Form(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: usernameController,
//                       decoration: InputDecoration(
//                         hintText: 'Username',
//                         hintStyle: TextStyle(color: Colors.white),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         prefixIcon: Icon(Icons.person, color: Colors.white),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: !_isPasswordVisible,
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         hintStyle: TextStyle(color: Colors.white),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         prefixIcon: Icon(Icons.lock, color: Colors.white),
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _isPasswordVisible = !_isPasswordVisible;
//                             });
//                           },
//                           child: Icon(
//                             _isPasswordVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Checkbox(
//                               value: _rememberMe,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _rememberMe = value!;
//                                 });
//                               },
//                               fillColor: MaterialStateProperty.resolveWith(
//                                   (states) => Color.fromARGB(255, 61, 60, 60)),
//                             ),
//                             const Text(
//                               'Remember me',
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.white),
//                             ),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // Implement "Forgot Password?" functionality
//                           },
//                           child: const Text(
//                             'Forgot Password?',
//                             style: TextStyle(fontSize: 16, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 60),
//                     ElevatedButton(
//                       onPressed: () async {
//                         final message = await AuthService().login(
//                           email: usernameController.text,
//                           password: passwordController.text,
//                         );
//                         if (message!.contains('Success')) {
//                           if (isTenant) {
//                             Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                 builder: (context) => appframe(),
//                               ),
//                             );
//                           } else {
//                             Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     owner_dashboard(), //replace with owner dashbord interface
//                               ),
//                             );
//                           }
//                         }
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(message),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 9, horizontal: 96),
//                       ),
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 7, 5, 95),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Not a member?',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                     const SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => signup()),
//                         );
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           border: Border.all(color: Colors.white),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Create an Account',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class logging_interface extends StatefulWidget {
  const logging_interface({Key? key}) : super(key: key);

  @override
  State<logging_interface> createState() => _logging_interfaceState();
}

class _logging_interfaceState extends State<logging_interface> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool isTenant = true; // Default value changed to true

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(10, 9, 24, 1),
            Color.fromRGBO(25, 23, 61, 1),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 160.0),
            ),
            const SizedBox(
              height: 60,
            ),
            LiteRollingSwitch(
              onTap: () {
                print('Single tap occurred');
                // Add your code for single tap action here
              },
              onDoubleTap: () {
                print('double tap occurred');
                // Add your code for single tap action here
              },
              onSwipe: () {
                print('swipe occurred');
                // Add your code for single tap action here
              },
              value: true,
              textOn: 'Tenant',
              textOff: 'Owner',
              colorOn: Colors.blue,
              colorOff: Colors.cyan,
              iconOn: Icons.done,
              iconOff: Icons.remove_circle_outline,
              textSize: 16.0,
              onChanged: (bool state) {
                setState(() {
                  isTenant = state;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Color.fromARGB(255, 61, 60, 60)),
                            ),
                            const Text(
                              'Remember me',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Implement "Forgot Password?" functionality
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () async {
                        final message = await AuthService().login(
                          email: usernameController.text,
                          password: passwordController.text,
                        );
                        if (message!.contains('Success')) {
                          if (isTenant) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    appframe(), //// tenant dashbord interface
                              ),
                            );
                          } else {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    owner_dashboard(), // owner dashbord interface
                              ),
                            );
                          }
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 96),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 7, 5, 95),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Not a member?',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Center(
                          child: Text(
                            'Create an Account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
