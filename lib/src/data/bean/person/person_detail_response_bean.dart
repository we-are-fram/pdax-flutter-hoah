import 'package:faker_person_api/src/data/bean/person/address_response_bean.dart';

class PersonDetailResponseBean {
  final int id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final DateTime? birthday;
  final String? gender;
  final AddressResponseBean? address;
  final String? website;
  final String? image;

  PersonDetailResponseBean({
    required this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  factory PersonDetailResponseBean.fromJson(Map<String, dynamic> json) =>
      PersonDetailResponseBean(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        phone: json['phone'],
        birthday:
            json['birthday'] == null ? null : DateTime.parse(json['birthday']),
        gender: json['gender'],
        address: json['address'] == null
            ? null
            : AddressResponseBean.fromJson(json['address']),
        website: json['website'],
        image: json['image'],
      );
}
