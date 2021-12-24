

class Retailer{
  String _name;
  String _address;
  String _email;
  String _mobile;
  String _shopLogo;
  String _status;

  Retailer(this._name, this._address, this._email, this._mobile, this._shopLogo,
      this._status);

  String get status => _status;

  String get shopLogo => _shopLogo;

  String get mobile => _mobile;

  String get email => _email;

  String get address => _address;

  String get name => _name;
  
  static List<Retailer> dummys = [
    Retailer("Abc Pvt. Ltd.", "City center 1, Kolkata", "xyz@gmail.com", "+91 9804123456", "https://images.immediate.co.uk/production/volatile/sites/23/2021/08/Otters-OTTSEA_038002-8c7dda4.jpg?quality=90&resize=620,413", "0",),
    Retailer("XYZ Pvt. Ltd.", "City center 1, Kolkata", "xyz@gmail.com", "+91 9804123456", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnSGqgwS7u5I7lgDhQJjGbCR3ZDq3pKo1Cvw&usqp=CAU", "1",),
    Retailer("DCB Pvt. Ltd.", "City center 1, Kolkata", "xyz@gmail.com", "+91 9804123456", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfw5knTbCg-zeeTWiv2-msz99grSAHmmDNTIH5-YrgQBSNHA6fi4XynlkFVJI85EV8fG4&usqp=CAU", "1",),
    Retailer("GO India Pvt. Ltd.", "City center 1, Kolkata", "xyz@gmail.com", "+91 9804123456", "https://images.unsplash.com/photo-1497752531616-c3afd9760a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmFieSUyMGFuaW1hbHN8ZW58MHx8MHx8&w=1000&q=80", "0",),
  ];
}