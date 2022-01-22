import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:team360/task_list/model/model1.dart';
import 'package:team360/touchbase/model/complete_task_request.dart';
import 'package:team360/util/utils.dart';
import 'package:http/http.dart' as http;

class ItemTask extends StatefulWidget {
  const ItemTask({Key? key,required this.data }) : super(key: key);
  final ResponseList data;

  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(left: 5, right: 5),
      alignment: Alignment.center,
      child: Column(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text(
                widget.data.taskType,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.only(left: 10, top: 2, bottom: 2),
                child: CheckboxListTile(
                    value: widget.data.tasks[index].isComplete == "Y",
                    title: Text(
                      widget.data.tasks[index].taskName,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: widget.data.tasks[index].isComplete == "Y"
                            ? TextDecoration.lineThrough
                            : null,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    onChanged: (newVal) {
                      setState(() {
                        widget.data.tasks[index].isComplete = newVal??false ? "Y" : "N";
                        final body = CompleteTaskRequest();
                        if(newVal??false){
                          body.isComplte = 1;
                        }else{
                          body.isComplte = 0;
                        }
                        callCompleteApi(body,widget.data.tasks[index].salesmanTaskId);
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading),
              );
            },
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.data.tasks.length,
          )
        ],
      ),
    );
  }
  Future<void> callCompleteApi(CompleteTaskRequest body,int taskId)async {
    Fimber.i("$taskId --${body.toJson()}");
    final completeTask = await returnResponse(await http.put(Uri.parse(
        baseUrl + "bakes_and_cakes/BakesAndCakes/updateTask/$taskId"),
        headers: headers, body: jsonEncode(body)));
    Fimber.i("$completeTask");
  }
}
