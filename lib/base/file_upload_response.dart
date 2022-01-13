

class FileUploadResponse {
  FileUploadResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final List<ResponseList> responseList;

  FileUploadResponse.fromJson(Map<String, dynamic> json){
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
    required this.status,
  });
  late final String status;

  Attributes.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    return _data;
  }
}

class ResponseList {
  ResponseList({
    required this.FilePath,
    required this.FileName,
  });
  late final String FilePath;
  late final String FileName;

  ResponseList.fromJson(Map<String, dynamic> json){
    FilePath = json['FilePath'];
    FileName = json['FileName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['FilePath'] = FilePath;
    _data['FileName'] = FileName;
    return _data;
  }
}