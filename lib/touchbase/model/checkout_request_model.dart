class CheckoutRequest {
  CheckoutRequest({
    required this.salesmanRetailerTaskType,
    required this.note,
    required this.touchbaseEndTime,
    required this.totalTimeSpent,
  });
  late final List<SalesmanRetailerTaskType> salesmanRetailerTaskType;
  late final String note;
  late final String touchbaseEndTime;
  late final String totalTimeSpent;

  CheckoutRequest.fromJson(Map<String, dynamic> json){
    salesmanRetailerTaskType = List.from(json['salesman_retailer_task_type']).map((e)=>SalesmanRetailerTaskType.fromJson(e)).toList();
    note = json['note'];
    touchbaseEndTime = json['touchbase_end_time'];
    totalTimeSpent = json['total_time_spent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['salesman_retailer_task_type'] = salesmanRetailerTaskType.map((e)=>e.toJson()).toList();
    _data['note'] = note;
    _data['touchbase_end_time'] = touchbaseEndTime;
    _data['total_time_spent'] = totalTimeSpent;
    return _data;
  }
}

class SalesmanRetailerTaskType {
  SalesmanRetailerTaskType({
    required this.taskId,
    required this.status,
  });
  late final int taskId;
  late final int status;

  SalesmanRetailerTaskType.fromJson(Map<String, dynamic> json){
    taskId = json['task_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['task_id'] = taskId;
    _data['status'] = status;
    return _data;
  }
}