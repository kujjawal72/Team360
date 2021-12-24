import 'package:flutter/material.dart';
import 'package:team360/login/components/background.dart';
import 'package:team360/main.dart';
import 'package:team360/util/my_colors.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height*0.05,
          ),
          const Text(
            "Log In",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Image(
            image: Image.asset("assets/images/login_logo.png").image,
            height: size.height * 0.28,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            width: size.width * 0.9,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'User Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              obscureText: false,
              autofocus: false,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: size.width * 0.9,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              obscureText: true,
              autofocus: false,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            width: size.width * 0.9,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: const Text("SIGN IN", style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(
                primary: MyColor.signInButton,
              ),
            ),
          ),
          Container(
            width: size.width * 0.9,
            height: 45,
            margin: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: () {},
              child:
                  const Text("FORGOT PASSWORD", style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("By signing up, you agree to Photo’s"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Terms of Service",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                      Text(" and "),
                      Text("Privacy Policy.",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
