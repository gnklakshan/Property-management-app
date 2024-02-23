import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rentpropertymanage/interfaces/logging_interface.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'package:rentpropertymanage/interfaces/appframe.dart';
import 'package:rentpropertymanage/interfaces/notification_interface.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 23, 61),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          //  back button
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const appframe()),
            );
          },
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Use white arrow back icon
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const notification_interface()),
                );
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {
                const url =
                    'https://drive.google.com/file/d/1PRxec2C5BES0tMyA-QmEGvST8PbqiRdP/view?usp=drive_link';
                launch(url);
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Do you want to logout',
                  confirmBtnText: 'Yes',
                  cancelBtnText: 'No',
                  confirmBtnColor: Colors.green,
                  onConfirmBtnTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const logging_interface(),
                    ));
                  },
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
    );
  }
}
