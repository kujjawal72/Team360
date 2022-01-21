class CompleteTaskRequest {
  CompleteTaskRequest();
  int isComplte = 0;

  CompleteTaskRequest.fromJson(Map<String, dynamic> json){
    isComplte = json['is_complte'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_complte'] = isComplte;
    return _data;
  }
}