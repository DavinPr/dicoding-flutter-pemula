import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              'images/circle_profile.png',
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              "Aditya Davin Pradana",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
