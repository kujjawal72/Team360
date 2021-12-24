

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