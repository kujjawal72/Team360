

class TaskList{

  String _name;
  String _time;
  int _completedTask;
  List<SubTaskList> _subTasks;


  String get time => _time;

  TaskList(this._name, this._completedTask, this._subTasks, this._time);


  List<SubTaskList> get subTasks => _subTasks;

  set subTasks(List<SubTaskList> value) {
    _subTasks = value;
  }

  int get completedTask => _completedTask;

  set completedTask(int value) {
    _completedTask = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  
  static List<TaskList> getDummy(){
    
    return [
      TaskList("My Beat", 1, [SubTaskList("ABC Pvt Ltd",true,"03:15 PM"),SubTaskList("DCB Pvt Ltd",false,"04:15 PM"),SubTaskList("XYZ Pvt Ltd",false,"05:15 PM")],"03:12 PM"),
      TaskList("My Service Calls", 2, [SubTaskList("Call to Client Xyz",true,"03:15 PM"),SubTaskList("Call to client abc",true,"03:15 PM"),SubTaskList("Call to retailer mnp",false,"03:15 PM"),SubTaskList("Call to Ujjawal",false,"03:15 PM")],"05:45 PM"),
      TaskList("My Payment Calls", 0, [SubTaskList("ABC Store",false,"03:15 PM"),SubTaskList("DCB Medical",false,"03:15 PM"),SubTaskList("XYZ Care",false,"03:15 PM")],"07:32 PM")
    ];
  }
}

class SubTaskList{
  
  String _name;
  String _time;
  bool _isCompleted;


  String get time => _time;

  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
  }


  SubTaskList(this._name, this._isCompleted, this._time);

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

class SalesmanDashboard {
  SalesmanDashboard({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final ResponseList responseList;

  SalesmanDashboard.fromJson(Map<String, dynamic> json){
    attributes = Attributes.fromJson(json['attributes']);
    responseList = ResponseList.fromJson(json['responseList']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.toJson();
    _data['responseList'] = responseList.toJson();
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
    required this.totalAccounts,
    required this.totalActiveAccounts,
    required this.dailyRunRate,
    required this.askingRunRate,
  });
  late final int totalAccounts;
  late final int totalActiveAccounts;
  late final double dailyRunRate;
  late final int askingRunRate;

  ResponseList.fromJson(Map<String, dynamic> json){
    totalAccounts = json['total_accounts'];
    totalActiveAccounts = json['total_active_accounts'];
    dailyRunRate = json['daily_run_rate'];
    askingRunRate = json['asking_run_rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_accounts'] = totalAccounts;
    _data['total_active_accounts'] = totalActiveAccounts;
    _data['daily_run_rate'] = dailyRunRate;
    _data['asking_run_rate'] = askingRunRate;
    return _data;
  }
}
