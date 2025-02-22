class UserModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }
}
