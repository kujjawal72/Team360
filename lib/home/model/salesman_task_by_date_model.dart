class SalesmanTaskByDateResponse {
  SalesmanTaskByDateResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  SalesmanTaskByDateResponse.fromJson(Map<String, dynamic> json){
    attributes = Attributes.fromJson(json['attributes']);
    responseList = List.from(json['responseList']).map((e)=>ResponseList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.toJson();
    _data['responseList'] = responseList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.statusDesc,
    required this.status,
  });
  late final String statusDesc;
  late final String status;

  Attributes.fromJson(Map<String, dynamic> json){
    statusDesc = json['status_desc'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_desc'] = statusDesc;
    _data['status'] = status;
    return _data;
  }
}

class ResponseList {
  ResponseList({
    required this.taskTypeId,
    required this.taskType,
    required this.lastUpdateId,
    required this.taskUpdateTs,
    required this.completedCount,
    required this.tasks,
  });
  late final int taskTypeId;
  late final String taskType;
  late final int lastUpdateId;
  late final String taskUpdateTs;
  int completedCount = 0;
  late final List<Tasks> tasks;

  ResponseList.fromJson(Map<String, dynamic> json){
    taskTypeId = json['task_type_id'];
    taskType = json['task_type'];
    lastUpdateId = json['last_update_id'];
    taskUpdateTs = json['task_update_ts'];
    completedCount = json['completed_count'];
    tasks = List.from(json['tasks']).map((e)=>Tasks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['task_type_id'] = taskTypeId;
    _data['task_type'] = taskType;
    _data['last_update_id'] = lastUpdateId;
    _data['task_update_ts'] = taskUpdateTs;
    _data['completed_count'] = completedCount;
    _data['tasks'] = tasks.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Tasks {
  Tasks({
    required this.salesman_task_id,
    required this.taskName,
    required this.isComplete,
    required this.assignDate,
    required this.dueDate,
    required this.taskTime,
  });
  late final int salesman_task_id;
  late final String taskName;
  String isComplete = "N";
  late final String assignDate;
  late final String dueDate;
  late final String taskTime;

  Tasks.fromJson(Map<String, dynamic> json){
    salesman_task_id = json['salesman_task_id'];
    taskName = json['task_name'];
    isComplete = json['is_complete'];
    assignDate = json['assign_date'];
    dueDate = json['due_date'];
    taskTime = json['task_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['salesman_task_id'] = salesman_task_id;
    _data['task_name'] = taskName;
    _data['is_complete'] = isComplete;
    _data['assign_date'] = assignDate;
    _data['due_date'] = dueDate;
    _data['task_time'] = taskTime;
    return _data;
  }
}