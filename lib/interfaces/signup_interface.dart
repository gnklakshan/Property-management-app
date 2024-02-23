// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:rentpropertymanage/backend/authentication.dart';
// import 'package:rentpropertymanage/interfaces/signup_success.dart';
// import 'logging_interface.dart';

// class signup extends StatefulWidget {
//   const signup({super.key});

//   @override
//   State<signup> createState() => _signupState();
// }

// // ignore: camel_case_types
// class _signupState extends State<signup> {
//   final nameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final contractdetailController = TextEditingController();
//   final confirmpasswordController = TextEditingController();
//   final accounttypeController = TextEditingController();
//   var type = "";

//   @override
//   Widget build(BuildContext context) {
//     var selectedAccountType;
//     return Scaffold(
//         body: Stack(
//       //thanks for watching
//       children: [
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color.fromRGBO(10, 9, 24, 1),
//               Color.fromRGBO(25, 23, 61, 1)
//             ]),
//           ),
//           child: const Padding(
//             padding: EdgeInsets.only(top: 60.0, left: 22),
//             child: Text(
//               'Reproma\nRegistration',
//               style: TextStyle(
//                   fontSize: 40,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 200.0),
//           child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40), topRight: Radius.circular(40)),
//               color: Color.fromARGB(204, 255, 255, 255),
//             ),
//             height: double.infinity,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 18.0, right: 18),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         suffixIcon: Icon(
//                           Icons.check,
//                           color: Color.fromARGB(116, 106, 109, 104),
//                         ),
//                         label: Text(
//                           'Last Name',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromRGBO(25, 23, 61, 1),
//                           ),
//                         )),
//                   ),
//                   DropdownButtonFormField<String>(
//                     value: selectedAccountType,
//                     decoration: const InputDecoration(
//                       labelText: 'Account type',
//                       labelStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromRGBO(25, 23, 61, 1),
//                       ),
//                     ),
//                     items: ['OWNER', 'TENANT']
//                         .map((type) => DropdownMenuItem(
//                               value: type,
//                               child: Text(type),
//                             ))
//                         .toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         selectedAccountType = newValue;
//                         type = selectedAccountType;
//                       });
//                     },
//                   ),

//                   // TextField(
//                   //   controller: accounttypeController,
//                   //   decoration: const InputDecoration(
//                   //       suffixIcon: Icon(
//                   //         Icons.arrow_drop_down,
//                   //         color: Colors.grey,
//                   //       ),
//                   //       label: Text(
//                   //         'Account type',
//                   //         style: TextStyle(
//                   //           fontWeight: FontWeight.bold,
//                   //           color: Color.fromRGBO(25, 23, 61, 1),
//                   //         ),
//                   //       )),
//                   // ),
//                   TextField(
//                     controller: contractdetailController,
//                     decoration: const InputDecoration(
//                         suffixIcon: Icon(
//                           Icons.check,
//                           color: Colors.grey,
//                         ),
//                         label: Text(
//                           'Gmail',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromRGBO(25, 23, 61, 1),
//                           ),
//                         )),
//                   ),
//                   TextField(
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                         suffixIcon: Icon(
//                           Icons.visibility_off,
//                           color: Colors.grey,
//                         ),
//                         label: Text(
//                           'Password',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromRGBO(25, 23, 61, 1),
//                           ),
//                         )),
//                   ),
//                   TextField(
//                     controller: confirmpasswordController,
//                     decoration: const InputDecoration(
//                         suffixIcon: Icon(
//                           Icons.visibility_off,
//                           color: Colors.grey,
//                         ),
//                         label: Text(
//                           'Confirm Password',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromRGBO(25, 23, 61, 1),
//                           ),
//                         )),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(
//                     height: 70,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       final message = await AuthService().registration(
//                         email: contractdetailController.text,
//                         password: passwordController.text,
//                       );
//                       // //-------------------------------==========================================================
//                       // Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       //   builder: (context) => const SignupSuccessScreen(),
//                       // ));
//                       // //---------------------------------================================================================================

//                       if (message != null && message.contains('Success')) {
//                         // final uid = FirebaseAuth.instance.currentUser!.uid;
//                         // try {
//                         //   await FirebaseFirestore.instance
//                         //       .collection('users')
//                         //       .doc(uid)
//                         //       .set({
//                         //     'name': nameController.text,
//                         //     'Account type': type,
//                         //   });
//                         //   print('Data updated successfully');
//                         //   Navigator.of(context)
//                         //       .pushReplacement(MaterialPageRoute(
//                         //     builder: (context) => const SignupSuccessScreen(),
//                         //   ));
//                         // } catch (e) {
//                         //   print('Error updating data: $e');
//                         //   ScaffoldMessenger.of(context).showSnackBar(
//                         //     SnackBar(
//                         //       content: Text(
//                         //         'Error updating user data. Please try again.',
//                         //       ),
//                         //     ),
//                         //   );
//                         // }
//                         final uid = FirebaseAuth.instance.currentUser!.uid;
//                         final propertyDocId =
//                             '$uid-property'; // Concatenate UID with 'property'
//                         try {
//                           await FirebaseFirestore.instance
//                               .collection('users')
//                               .doc(uid)
//                               .set({
//                             'name': nameController.text,
//                             'Account type': type,
//                           }).then((_) async {
//                             // After setting the user data, create a subcollection
//                             FirebaseFirestore.instance
//                                 .collection('users')
//                                 .doc(uid)
//                                 .collection('properties')
//                                 .doc(
//                                     propertyDocId) // Use concatenated document ID
//                                 .set({
//                               // Your subcollection data
//                             }).then((_) {
//                               print('Subcollection created successfully');
//                             }).catchError((error) {
//                               print('Error creating subcollection: $error');
//                             });
//                           });

//                           print('Data updated successfully');
//                           Navigator.of(context)
//                               .pushReplacement(MaterialPageRoute(
//                             builder: (context) => const SignupSuccessScreen(),
//                           ));
//                         } catch (e) {
//                           print('Error updating data: $e');
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 'Error updating user data. Please try again.',
//                               ),
//                             ),
//                           );
//                         }
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(message ??
//                                 'Registration failed. Please try again.'),
//                           ),
//                         );
//                       }
//                     },
//                     child: Container(
//                       height: 55,
//                       width: 300,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         gradient: const LinearGradient(colors: [
//                           Color.fromRGBO(10, 9, 24, 1),
//                           Color.fromRGBO(25, 23, 61, 1),
//                         ]),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'SIGN UP',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 80,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentpropertymanage/backend/authentication.dart';
import 'package:rentpropertymanage/interfaces/signup_success.dart';
import 'logging_interface.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final contractdetailController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final accounttypeController = TextEditingController();
  var type = "";
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var selectedAccountType;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(10, 9, 24, 1),
                Color.fromRGBO(25, 23, 61, 1)
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Reproma\nRegistration',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Color.fromARGB(204, 255, 255, 255),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Color.fromARGB(116, 106, 109, 104),
                          ),
                          label: Text(
                            'Last Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(25, 23, 61, 1),
                            ),
                          )),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedAccountType,
                      decoration: const InputDecoration(
                        labelText: 'Account type',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(25, 23, 61, 1),
                        ),
                      ),
                      items: ['OWNER', 'TENANT']
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedAccountType = newValue;
                          type = selectedAccountType!;
                        });
                      },
                    ),
                    TextField(
                      controller: contractdetailController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Gmail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(25, 23, 61, 1),
                            ),
                          )),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(25, 23, 61, 1),
                        ),
                      ),
                    ),
                    TextField(
                      controller: confirmpasswordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          label: Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(25, 23, 61, 1),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final message = await AuthService().registration(
                          email: contractdetailController.text,
                          password: passwordController.text,
                        );

                        if (message != null && message.contains('Success')) {
                          final uid = FirebaseAuth.instance.currentUser!.uid;
                          final propertyDocId =
                              '$uid-property'; // Concatenate UID with 'property'
                          try {
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .set({
                              'name': nameController.text,
                              'Account type': type,
                            });
                            // .then((_) async {
                            //   // After setting the user data, create a subcollection
                            //   FirebaseFirestore.instance
                            //       .collection('users')
                            //       .doc(uid)
                            //       .collection('properties')
                            //       .doc(
                            //           propertyDocId) // Use concatenated document ID
                            //       .set({
                            //     // Your subcollection data
                            //   }).then((_) {
                            //     print('Subcollection created successfully');
                            //   }).catchError((error) {
                            //     print('Error creating subcollection: $error');
                            //   });
                            // });

                            print('Data updated successfully');
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const SignupSuccessScreen(),
                            ));
                          } catch (e) {
                            print('Error updating data: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Error updating user data. Please try again.',
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message ??
                                  'Registration failed. Please try again.'),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(10, 9, 24, 1),
                            Color.fromRGBO(25, 23, 61, 1),
                          ]),
                        ),
                        child: const Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
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
