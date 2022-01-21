import 'package:flutter/material.dart';
import 'package:team360/util/utils.dart';

class RadioModel {
  final String _title;
  final int _id;

  RadioModel(this._title, this._id);

  int get id => _id;

  String get title => _title;
}

class RadioGroup extends StatefulWidget {
  List<RadioModel> data;
  String2VoidCallback s2v;
  Color primary;
  double fontSize;
  double scaleRadioBtn;
  bool isHorizontal;
  Color checkedColor;

  RadioGroup(
      {Key? key,
      required this.data,
      required this.s2v,
      this.primary = const Color(0xFFc4c3c7),
      this.fontSize = 18,
      this.scaleRadioBtn = 1.5,
      this.isHorizontal = false,
      this.checkedColor = Colors.red})
      : super(key: key);

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  RadioModel? _currentValue;

  @override
  Widget build(BuildContext context) {
    //   Size size = MediaQuery.of(context).size;
    return Container(
      margin: widget.isHorizontal?null:const EdgeInsets.all(8),
      height: widget.isHorizontal?80:null,
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Row(
            mainAxisSize: widget.isHorizontal?MainAxisSize.min:MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                fit: widget.isHorizontal?FlexFit.loose:FlexFit.tight,
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      unselectedWidgetColor: Colors.white),
                  child: Transform.scale(
                    scale: widget.scaleRadioBtn,
                    child: Radio(
                      value: widget.data[index],
                      groupValue: _currentValue,
                      onChanged: (RadioModel? newValue) {
                        setState(() {
                          _currentValue = newValue!;
                          widget.s2v(_currentValue!._title,
                              _currentValue!._id.toString());
                        });
                      },
                      activeColor: widget.checkedColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 9,
                fit: widget.isHorizontal?FlexFit.loose:FlexFit.tight,
                child: TextButton(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.data[index]._title,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: widget.primary, fontSize: widget.fontSize),
                      )),
                  onPressed: () {
                    setState(() {
                      _currentValue = widget.data[index];
                      widget.s2v(
                          _currentValue!._title, _currentValue!._id.toString());
                    });
                  },
                ),
              )
            ],
          );
        },
        itemCount: widget.data.length,
        shrinkWrap: true,scrollDirection: widget.isHorizontal?Axis.horizontal:Axis.vertical,
      ),
    );
  }
}
