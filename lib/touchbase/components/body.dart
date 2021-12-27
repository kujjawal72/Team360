import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 8),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      height: size.height,
      decoration: const BoxDecoration(
        color: Color(0xe6252139),
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 5),
              alignment: Alignment.center,
              child: Text("Welcome Touchbase", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
          
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(bottom: 21),
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(4),
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Image.asset(
                "assets/icons/selfie.png",
                width: 80,
                height: 80,
              ),
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/icons/location_big.png",
                width: 80,
                height: 80,
              ),
            ),
          ),

          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 5),
            decoration: BoxDecoration(
              color: Color(0xFF28c800),
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Align(
              alignment: Alignment.center,
                child: Text("Check-In",style: TextStyle(fontSize: 22,color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
