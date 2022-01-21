import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:team360/home/model/salesman_task_by_date_model.dart';
import 'package:team360/touchbase/model/complete_task_request.dart';
import 'package:team360/util/utils.dart';

class ItemTask extends StatefulWidget {
  final ResponseList data;

  const ItemTask({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ItemTaskState createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          GestureDetector(
            child: SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      widget.data.taskType,
                      style: const TextStyle(fontSize: 18),
                    ),
                    flex: 7,
                    fit: FlexFit.tight,
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent,
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: Text(
                                    "${widget.data.completedCount}",
                                    style: const TextStyle(fontSize: 12),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: Text(
                                    "${widget.data.tasks.length}",
                                    style: const TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                        ),
                        Icon(isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          isExpanded
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        value: widget.data.tasks[index].isComplete == "Y",
                        title: Text(
                          widget.data.tasks[index].taskName,
                          style: TextStyle(
                            fontSize: 16,
                            decoration:
                                widget.data.tasks[index].isComplete == "Y"
                                    ? TextDecoration.lineThrough
                                    : null,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        dense: true,
                        onChanged: (newVal) {
                          setState(() {
                            widget.data.tasks[index].isComplete = newVal ?? false ? "Y" : "N";
                            final body = CompleteTaskRequest();
                            if(newVal??false){
                              widget.data.completedCount++;
                              body.isComplte = 1;
                            }else{
                              widget.data.completedCount--;
                              body.isComplte = 0;
                            }
                            callCompleteApi(body,widget.data.tasks[index].salesman_task_id);

                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading);
                  },
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.data.tasks.length,
                )
              : const Padding(padding: EdgeInsets.all(2))
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
