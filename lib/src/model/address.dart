import 'package:faker_person_api/src/data/bean/person/address_response_bean.dart';

class Address {
  Address({
    required this.id,
    this.street,
    this.streetName,
    this.buildingNumber,
    this.city,
    this.zipcode,
    this.country,
    this.countyCode,
    this.latitude,
    this.longitude,
  });

  late final int id;
  late final String? street;
  late final String? streetName;
  late final String? buildingNumber;
  late final String? city;
  late final String? zipcode;
  late final String? country;
  late final String? countyCode;
  late final double? latitude;
  late final double? longitude;

  String? get fullAddress {
    final arr = [buildingNumber, street, streetName, city, zipcode, country];
    final fullAddr = arr.where((e) => e != null).toList().join(', ').trim();
    return fullAddr.isEmpty ? null : fullAddr;
  }

  Address.fromSource(AddressResponseBean address) {
    id = address.id;
    street = address.street;
    streetName = address.streetName;
    buildingNumber = address.buildingNumber;
    city = address.city;
    zipcode = address.zipcode;
    country = address.country;
    countyCode = address.countyCode;
    latitude = address.latitude;
    longitude = address.longitude;
  }
}
