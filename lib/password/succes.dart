// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, file_names, avoid_print

import 'package:app_monitoring_cs/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  //btn check email
  Widget _buildContinueBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 250,
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFFFF8E1)),
          elevation: MaterialStateProperty.all(5.0),
          padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            color: Color(0xFFC52424),
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

// btn kembali ke sign in
  Widget _buildBackBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 250,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFFFF8E1)),
          elevation: MaterialStateProperty.all(5.0),
          padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: const Text(
          'Back To Sign In ',
          style: TextStyle(
            color: Color(0xFFC52424),
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Color(0xFFF54643),
                      Color(0xFFEC3427),
                      Color(0xFFD61B17),
                      Color(0xFFC52424),
                    ],
                    stops: const [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 45)),
                      const Text(
                        'Successfully',
                        style: TextStyle(
                          color: Color(0xFFFFF8E1),
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        top: 30,
                      )),
                      const Text(
                        'password anda sudah diperbaharui, silahkan ganti password anda secara teratur untuk menghindari hal ini',
                        style: TextStyle(
                          color: Color(0xFFFFF8E1),
                          fontFamily: 'OpenSans',
                          fontSize: 15.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        top: 10,
                      )),
                      const Text(
                        '',
                        style: TextStyle(
                          color: Color(0xFFFFF8E1),
                          fontFamily: 'OpenSans',
                          fontSize: 15.0,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        top: 10,
                      )),
                      _buildContinueBtn(),
                      _buildBackBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
