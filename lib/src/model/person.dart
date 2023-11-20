import '../data/bean/person/person_detail_response_bean.dart';
import 'address.dart';

class Person {
  Person({
    required this.id,
    required this.firstname,
    required this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  late final int id;
  late final String firstname;
  late final String lastname;
  late final String? email;
  late final String? phone;
  late final DateTime? birthday;
  late final String? gender;
  late final Address? address;
  late final String? website;
  late final String? image;

  String get name {
    final String name = '$firstname $lastname'.trim();
    return name.isEmpty ? '-' : name;
  }

  String get firstLetterName {
    String firstLetterFirstName = 'A';
    String firstLetterLastName = 'A';
    if (firstname.isNotEmpty) {
      firstLetterFirstName = firstname.substring(0, 1);
    }
    if (lastname.isNotEmpty) {
      firstLetterLastName = lastname.substring(0, 1);
    }
    return '$firstLetterFirstName$firstLetterLastName';
  }

  Person.fromSource(PersonDetailResponseBean person) {
    id = person.id;
    firstname = person.firstname ?? '';
    lastname = person.lastname ?? '';
    email = person.email;
    phone = person.phone;
    birthday = person.birthday;
    gender = person.gender;
    address =
        person.address == null ? null : Address.fromSource(person.address!);
    website = person.website;
    image = person.image;
  }
}
