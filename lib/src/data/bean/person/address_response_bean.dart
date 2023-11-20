class AddressResponseBean {
  final int id;
  final String? street;
  final String? streetName;
  final String? buildingNumber;
  final String? city;
  final String? zipcode;
  final String? country;
  final String? countyCode;
  final double? latitude;
  final double? longitude;

  AddressResponseBean({
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

  factory AddressResponseBean.fromJson(Map<String, dynamic> json) =>
      AddressResponseBean(
        id: json['id'],
        street: json['street'],
        streetName: json['streetName'],
        buildingNumber: json['buildingNumber'],
        city: json['city'],
        zipcode: json['zipcode'],
        country: json['country'],
        countyCode: json['county_code'],
        latitude: json['latitude']?.toDouble(),
        longitude: json['longitude']?.toDouble(),
      );
}
