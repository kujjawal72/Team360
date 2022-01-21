class AddRetailerRequest {
  AddRetailerRequest({
    this.retailerName = "",
    this.logo= "",
    this.latitude= "",
    this.longitude= "",
    this.pincode= "",
    this.city= "",
    this.statte= "",
    this.address= "",
    this.ownerName= "",
    this.whatsappNo= "",
    this.email= "",
    this.salesmanId= 0,
    this.documetType,
  });
  String retailerName = "";
  String logo = "";
  String latitude = "";
  String longitude = "";
  String pincode = "";
  String city = "";
  String statte = "";
  String address = "";
  String ownerName = "";
  String whatsappNo = "";
  String email = "";
  int salesmanId = 0;
  List<DocumetType>? documetType;

  AddRetailerRequest.fromJson(Map<String, dynamic> json){
    retailerName = json['retailer_name'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    pincode = json['pincode'];
    city = json['city'];
    statte = json['statte'];
    address = json['address'];
    ownerName = json['owner_name'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    salesmanId = json['salesman_id'];
    documetType = List.from(json['documet_type']).map((e)=>DocumetType.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['retailer_name'] = retailerName;
    _data['logo'] = logo;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['pincode'] = pincode;
    _data['city'] = city;
    _data['statte'] = statte;
    _data['address'] = address;
    _data['owner_name'] = ownerName;
    _data['whatsapp_no'] = whatsappNo;
    _data['email'] = email;
    _data['salesman_id'] = salesmanId;
    _data['documet_type'] = documetType?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DocumetType {
  DocumetType({
    required this.documentsTypeId,
    required this.documentLink,
    required this.documentNo,
  });
  late final int documentsTypeId;
  String documentLink = "";
  late final int documentNo;

  DocumetType.fromJson(Map<String, dynamic> json){
    documentsTypeId = json['documents_type_id'];
    documentLink = json['document_link'];
    documentNo = json['document_no'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['documents_type_id'] = documentsTypeId;
    _data['document_link'] = documentLink;
    _data['document_no'] = documentNo;
    return _data;
  }
}