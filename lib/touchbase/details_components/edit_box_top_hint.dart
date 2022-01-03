import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditBoxTopHintWhiteRounded extends StatefulWidget {
  String hint;
  String preText;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  Color boxColor;
  ValueChanged<String>? onChanged;

  EditBoxTopHintWhiteRounded(
      {Key? key,
      this.hint = "",
      this.preText = "",
      this.padding =
          const EdgeInsets.only(left: 15, right: 10, top: 1, bottom: 1),
      this.margin = const EdgeInsets.only(left: 3, right: 5, top: 2, bottom: 2),
      this.boxColor = Colors.white,
      this.onChanged})
      : super(key: key);

  @override
  _EditBoxTopHintWhiteRoundedState createState() =>
      _EditBoxTopHintWhiteRoundedState();
}

class _EditBoxTopHintWhiteRoundedState
    extends State<EditBoxTopHintWhiteRounded> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            widget.hint,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Container(
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: widget.boxColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 1.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              ),
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 1.0,
                offset: Offset(-1.0, -1.0), // shadow direction: bottom right
              )
            ],
          ),
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 18),
            obscureText: false,
            autofocus: false,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
