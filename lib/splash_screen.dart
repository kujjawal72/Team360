import 'package:flutter/material.dart';
import 'package:team360/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _makeDelay();
  }

  _makeDelay() async{
    await Future.delayed(const Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(child: Image(image: Image.asset("assets/icons/team_image1.png").image),top: 0,left: 0),
          Center(
            child:  SizedBox(
              width: 200,height: 200,child:  Image(image: Image.asset("assets/icons/team_logo.png").image),
            )
          )
        ],
      )
    );
  }
}
