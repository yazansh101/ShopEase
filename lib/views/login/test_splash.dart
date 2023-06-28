// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'login_form.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool isSign = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: size.height,
                color: Colors.grey.shade300,
                child: LoginForm(),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            width: size.width,
            height: size.height,
            left: isSign ? size.width * 0.16 : size.width * 0.84,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSign = !isSign;
                });
                // print('a');
              },
              child: Container(
                color: Colors.blue,
                
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: size.width * 0.07,
            top: size.height * 0.1,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
