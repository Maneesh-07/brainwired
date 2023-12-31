import 'package:brainwired/views/login/auth_page.dart';
import 'package:brainwired/views/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppbarWidget extends StatelessWidget {
  final String title;

  const AppbarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstLetter = title.isNotEmpty ? title[0] : '';
    final restOfTitle = title.substring(1);

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 213, 168, 45),
      // leading: IconButton(
      //   onPressed: () {
      //     Get.back();
      //   },
      //   icon: const Icon(
      //     Icons.arrow_back,
      //     color: backgroundcolor,
      //   ),
      // ),
      title: Row(
        children: [
          RichText(
            text: TextSpan(
                text: firstLetter,
                style: GoogleFonts.robotoSlab(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 4,
                  ),
                ),
                children: [
                  TextSpan(
                    text: restOfTitle,
                    style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                  ),
                ]),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              showLogoutDialog(context);
            },
            icon: const Icon(
              Icons.logout,
              size: 25,
              color: Colors.black,
            ))
      ],
    );
  }

  Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to log out?'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                // Perform the logout action here
                final audioPlayerProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                audioPlayerProvider.signOut();

                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                    (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
