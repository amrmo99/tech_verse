
import 'package:session7test/utils/data/models/address.dart';

class User {
  String? id;
  String? email;
  String? lastName;
  String? firstName;
  num? points;
  String? phoneNumber;
  String? profileImage;
  Address? address;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
     this.points = 0,
    this.phoneNumber = '',
    this.profileImage = '',
    this.address,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    email = json['email'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    profileImage = json['profileImage'] as String?;
    points = json['points'] as num?;
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
      'profileImage': profileImage,
      'points': points,
      if(address != null)
        'address': address?.toJson(),
    };
  }
}
