import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:team360/base/response.dart';
import 'package:team360/home/home.dart';
import 'package:team360/login/components/background.dart';
import 'package:team360/login/model/models.dart';
import 'package:team360/login/viewmodel/login_viewmodel.dart';
import 'package:team360/main.dart';
import 'package:team360/util/my_colors.dart';
import 'package:team360/util/profile_manager.dart';
import 'package:team360/util/utils.dart';

class Body extends StatefulWidget {
  final String2VoidCallback onLogin;
  const Body({Key? key,required this.onLogin}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            child: TextField(
              decoration: const InputDecoration(
                  labelText: 'User Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              obscureText: false,
              autofocus: false,
              controller: _usernameController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: size.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              obscureText: true,
              autofocus: false,
              controller: _passwordController,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            width: size.width * 0.9,
            height: 45,
            child: getSigninWidget(),
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

  getSigninWidget() {
    Response response = Provider.of<LoginViewModel>(context).loginResponse;
    Fimber.i("response ${response.status}");
    switch(response.status){

      case Status.ERROR:
        Fluttertoast.showToast(msg: "Failed to sign-in");
        return ElevatedButton(
          onPressed: (){
            final username = _usernameController.text.trim();
            final password = _passwordController.text.trim();
            if(username.isEmpty || password.isEmpty) return;

            widget.onLogin(username,password);
          },
          child: const Text("SIGN IN", style: TextStyle(fontSize: 15)),
          style: ElevatedButton.styleFrom(
            primary: MyColor.signInButton,
          ),
        );
      case Status.INITIAL:
        return ElevatedButton(
          onPressed: (){
            final username = _usernameController.text.trim();
            final password = _passwordController.text.trim();
            if(username.isEmpty || password.isEmpty) return;

            widget.onLogin(username,password);
          },
          child: const Text("SIGN IN", style: TextStyle(fontSize: 15)),
          style: ElevatedButton.styleFrom(
            primary: MyColor.signInButton,
          ),
        );
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        final res = response.data as LoginResponse;
        if(res.attributes.status == "success"){
          ProfileManager.createProfile(res.responseList);
          WidgetsBinding.instance!.addPostFrameCallback((_){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
          });
        }else{
          Fluttertoast.showToast(msg: "Failed to sign in");
        }
        return ElevatedButton(
          onPressed: (){
            final username = _usernameController.text.trim();
            final password = _passwordController.text.trim();
            if(username.isEmpty || password.isEmpty) return;

            widget.onLogin(username,password);
          },
          child: const Text("SIGN IN", style: TextStyle(fontSize: 15)),
          style: ElevatedButton.styleFrom(
            primary: MyColor.signInButton,
          ),
        );
    }
  }
}
