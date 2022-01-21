import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);


  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
        setState(() {
          _start++;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if(_timer == null){
      startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text("${(_start ~/ 60).toString().padLeft(2,'0')}:${( _start % 60).toString().padLeft(2,'0')}",style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
    );
  }
}
