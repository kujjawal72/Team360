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
