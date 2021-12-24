import 'package:flutter/material.dart';
import 'package:team360/home/model/models.dart';

class ItemTask extends StatefulWidget {
  final TaskList data;

  const ItemTask({Key? key, required this.data}) : super(key: key);

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
                    child: Text(widget.data.name,style: TextStyle(fontSize: 18),),
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
                                    "${widget.data.completedTask}",
                                    style: const TextStyle(fontSize: 12),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: Text(
                                    "${widget.data.subTasks.length}",
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
                        value: widget.data.subTasks[index].isCompleted,
                        title: Text(
                          widget.data.subTasks[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            decoration: widget.data.subTasks[index].isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        dense: true,
                        onChanged: (newVal) {
                          setState(() {
                            widget.data.subTasks[index].isCompleted = newVal!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading);
                  },
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.data.subTasks.length,
                )
              : const Padding(padding: EdgeInsets.all(2))
        ],
      ),
    );
  }
}
