import 'package:flutter/material.dart';

class DetailsInfoCard extends StatelessWidget {
  String header;
  String footer;
  IconData? icon;
  DetailsInfoCard({Key? key,required this.header,required this.footer,this.icon = Icons.attach_money}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.42,
      padding: EdgeInsets.only(bottom: 5,),
      margin: EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(5.0, 5.0), // shadow direction: bottom right
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            color: Color(0xFFe6e6e6),
            child: Text(header,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                Text(footer,style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
