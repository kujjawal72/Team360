

class TaskAtRetailer{
  String _name;
  bool _completed;

  TaskAtRetailer(this._name, this._completed);

  bool get completed => _completed;

  String get name => _name;

  set completed(bool value) {
    _completed = value;
  }
}

List<TaskAtRetailer> dummy() => [TaskAtRetailer("Payment Received", true),TaskAtRetailer("Order Placed", false),TaskAtRetailer("Order Delivered", false)];
