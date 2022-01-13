import 'package:flutter/material.dart';

class EditBoxWhiteRounded extends StatefulWidget {
  String hint;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  Color boxColor;
  TextEditingController? controller;


  EditBoxWhiteRounded(
      {Key? key,
      this.hint = "",
      this.padding = const EdgeInsets.only(left: 15, right: 10, top: 2, bottom: 2),
      this.margin = const EdgeInsets.only(left: 3,right: 5,top: 2,bottom: 2),
      this.boxColor = Colors.white,
      this.controller})
      : super(key: key);

  @override
  _EditBoxWhiteRoundedState createState() => _EditBoxWhiteRoundedState();
}

class _EditBoxWhiteRoundedState extends State<EditBoxWhiteRounded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          color: widget.boxColor,boxShadow: const [
        BoxShadow(
          color: Colors.blueGrey,
          blurRadius: 3.0,
          spreadRadius: 0.0,
          offset: Offset(3.0, 3.0), // shadow direction: bottom right
        )
      ],),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.hint,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        style: const TextStyle(fontSize: 18),
        obscureText: false,
        autofocus: false,
        controller: widget.controller,
      ),
    );
  }
}
