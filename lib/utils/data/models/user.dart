
import 'package:session7test/utils/data/models/address.dart';

class User {
  String? id;
  String? email;
  String? lastName;
  String? firstName;
  String? phoneNumber;
  Address? address;

  User({
    required this.id,
    this.phoneNumber = '',
    required this.firstName,
    required this.lastName,
    required this.email,
    this.address,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    email = json['email'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    if (json['address'] != null) {
      address = Address.fromJson(json['address'] as Map<String, dynamic>);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      if(address != null)
        'address': address?.toJson(),
    };
  }
}
