import 'package:faker_person_api/src/data/bean/person/address_response_bean.dart';
import 'package:faker_person_api/src/model/address.dart';
import 'package:test/test.dart';

import '../data/bean/person/address_response_bean_test.dart';

void main() {
  test('can set', () {
    final Address model = AddressModelSample.create();

    expect(model.id, 0);
    expect(model.street, '2521 Mertz Prairie');
    expect(model.streetName, 'Rempel Ramp');
    expect(model.buildingNumber, '9750');
    expect(model.city, 'Khalilmouth');
    expect(model.zipcode, '81299-1014');
    expect(model.country, 'Jamaica');
    expect(model.countyCode, 'SO');
    expect(model.latitude, -74.929233);
    expect(model.longitude, 11.358493);
  });

  test('can convert from source', () {
    final AddressResponseBean addressResponseBean =
        AddressResponseBeanSample.createFromJson();

    final Address model = Address.fromSource(addressResponseBean);

    expect(model.id, 0);
    expect(model.street, '2521 Mertz Prairie');
    expect(model.streetName, 'Rempel Ramp');
    expect(model.buildingNumber, '9750');
    expect(model.city, 'Khalilmouth');
    expect(model.zipcode, '81299-1014');
    expect(model.country, 'Jamaica');
    expect(model.countyCode, 'SO');
    expect(model.latitude, -74.929233);
    expect(model.longitude, 11.358493);
  });
}

class AddressModelSample {
  AddressModelSample();

  static Address create() => Address(
        id: 0,
        street: '2521 Mertz Prairie',
        streetName: 'Rempel Ramp',
        buildingNumber: '9750',
        city: 'Khalilmouth',
        zipcode: '81299-1014',
        country: 'Jamaica',
        countyCode: 'SO',
        latitude: -74.929233,
        longitude: 11.358493,
      );
}
