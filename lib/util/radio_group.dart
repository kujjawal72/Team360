import 'package:flutter/material.dart';

class RadioModel {
  final String _title;
  final int _id;

  RadioModel(this._title, this._id);

  int get id => _id;

  String get title => _title;
}

class RadioGroup extends StatefulWidget {
  List<RadioModel> data;

  RadioGroup({Key? key, required this.data}) : super(key: key);

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  late RadioModel _currentValue = widget.data[0];

  @override
  Widget build(BuildContext context) {
 //   Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      unselectedWidgetColor: Colors.white),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: widget.data[index],
                      groupValue: _currentValue,
                      onChanged: (RadioModel? newValue) {
                        setState(() {
                          _currentValue = newValue!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 9,
                fit: FlexFit.tight,
                child: TextButton(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.data[index]._title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color(0xFFc4c3c7), fontSize: 18),
                      )),
                  onPressed: () {
                    setState(() {
                      _currentValue = widget.data[index];
                    });
                  },
                ),
              )
            ],
          );
        },
        itemCount: widget.data.length,
        shrinkWrap: true,
      ),
    );
  }
}

