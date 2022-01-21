class TouchBaseResponse {
  TouchBaseResponse({
    required this.attributes,
    required this.responseList,
  });
  late final Attributes attributes;
  late final ResponseList responseList;

  TouchBaseResponse.fromJson(Map<String, dynamic> json){
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
    required this.retailerId,
    required this.name,
    required this.ownerName,
    required this.logo,
    required this.phoneno,
    required this.whatsappNo,
    required this.email,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.comments,
    required this.city,
    required this.state,
    required this.pincode,
    required this.status,
    required this.lastUpdateTs,
    required this.salesmanId,
    required this.retailerDocuments,
    required this.salesmanTouchbaseId,
    required this.retailerTouchbaseLatitude,
    required this.retailerTouchbaseLongitutde,
    required this.salesmanSelfyImage,
    required this.startTime,
    required this.endTime,
    required this.totalTimeSpent,
    required this.lifetimeValue,
    required this.paymentPending,
    required this.taskList,
    required this.productPurchase,
    required this.mtd,
    required this.lmtd,
    required this.credit,
  });
  late final int retailerId;
  late final String name;
  late final String ownerName;
  late final String logo;
  late final String phoneno;
  late final String whatsappNo;
  late final String email;
  late final String location;
  late final String latitude;
  late final String longitude;
  late final String comments;
  late final String city;
  late final String state;
  late final String pincode;
  late final int status;
  late final String lastUpdateTs;
  late final int salesmanId;
  late final List<RetailerDocuments> retailerDocuments;
  late final int salesmanTouchbaseId;
  late final String retailerTouchbaseLatitude;
  late final String retailerTouchbaseLongitutde;
  late final String salesmanSelfyImage;
  late final String startTime;
  late final String endTime;
  late final String totalTimeSpent;
  late final int lifetimeValue;
  late final int paymentPending;
  late final List<TaskList> taskList;
  late final int productPurchase;
  late final int sales_order_count;
  late final int mtd;
  late final int lmtd;
  late final int credit;

  ResponseList.fromJson(Map<String, dynamic> json){
    retailerId = json['retailer_id'];
    name = json['name'];
    ownerName = json['owner_name'];
    logo = json['logo'];
    phoneno = json['phoneno'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    comments = json['comments'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    status = json['status'];
    lastUpdateTs = json['last_update_ts'];
    salesmanId = json['salesman_id'];
    sales_order_count = json['sales_order_count'];
    retailerDocuments = List.from(json['retailer_documents']).map((e)=>RetailerDocuments.fromJson(e)).toList();
    salesmanTouchbaseId = json['salesman_touchbase_id'];
    retailerTouchbaseLatitude = json['retailer_touchbase_latitude'];
    retailerTouchbaseLongitutde = json['retailer_touchbase_longitutde'];
    salesmanSelfyImage = json['salesman_selfy_image'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    totalTimeSpent = json['total_time_spent'];
    lifetimeValue = json['lifetime_value'];
    paymentPending = json['payment_pending'];
    taskList = List.from(json['task_list']).map((e)=>TaskList.fromJson(e)).toList();
    productPurchase = json['product_purchase'];
    mtd = json['mtd'];
    lmtd = json['lmtd'];
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['retailer_id'] = retailerId;
    _data['name'] = name;
    _data['owner_name'] = ownerName;
    _data['logo'] = logo;
    _data['phoneno'] = phoneno;
    _data['whatsapp_no'] = whatsappNo;
    _data['email'] = email;
    _data['location'] = location;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['comments'] = comments;
    _data['city'] = city;
    _data['sales_order_count'] = sales_order_count;
    _data['state'] = state;
    _data['pincode'] = pincode;
    _data['status'] = status;
    _data['last_update_ts'] = lastUpdateTs;
    _data['salesman_id'] = salesmanId;
    _data['retailer_documents'] = retailerDocuments.map((e)=>e.toJson()).toList();
    _data['salesman_touchbase_id'] = salesmanTouchbaseId;
    _data['retailer_touchbase_latitude'] = retailerTouchbaseLatitude;
    _data['retailer_touchbase_longitutde'] = retailerTouchbaseLongitutde;
    _data['salesman_selfy_image'] = salesmanSelfyImage;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    _data['total_time_spent'] = totalTimeSpent;
    _data['lifetime_value'] = lifetimeValue;
    _data['payment_pending'] = paymentPending;
    _data['task_list'] = taskList.map((e)=>e.toJson()).toList();
    _data['product_purchase'] = productPurchase;
    _data['mtd'] = mtd;
    _data['lmtd'] = lmtd;
    _data['credit'] = credit;
    return _data;
  }
}

class RetailerDocuments {
  RetailerDocuments({
    required this.documentTypeName,
    required this.documentLink,
  });
  late final String documentTypeName;
  late final String documentLink;

  RetailerDocuments.fromJson(Map<String, dynamic> json){
    documentTypeName = json['document_type_name'];
    documentLink = json['document_link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['document_type_name'] = documentTypeName;
    _data['document_link'] = documentLink;
    return _data;
  }
}

class TaskList {
  TaskList({
    required this.retailerTaskTypeId,
    required this.retailerTaskType,
    required this.isComplete,
  });
  late final int retailerTaskTypeId;
  late final String retailerTaskType;
  int isComplete = 0;

  TaskList.fromJson(Map<String, dynamic> json){
    retailerTaskTypeId = json['retailer_task_type_id'];
    retailerTaskType = json['retailer_task_type'];
    isComplete = json['is_complete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['retailer_task_type_id'] = retailerTaskTypeId;
    _data['retailer_task_type'] = retailerTaskType;
    _data['is_complete'] = isComplete;
    return _data;
  }
}