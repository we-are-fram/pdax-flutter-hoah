import 'package:faker_person_api/src/data/bean/person/address_response_bean.dart';
import 'package:test/test.dart';

void main() {
  test('can create from json', () {
    final AddressResponseBean bean = AddressResponseBeanSample.createFromJson();
    expect(bean.id, 0);
    expect(bean.street, '2521 Mertz Prairie');
    expect(bean.streetName, 'Rempel Ramp');
    expect(bean.buildingNumber, '9750');
    expect(bean.city, 'Khalilmouth');
    expect(bean.zipcode, '81299-1014');
    expect(bean.country, 'Jamaica');
    expect(bean.countyCode, 'SO');
    expect(bean.latitude, -74.929233);
    expect(bean.longitude, 11.358493);
  });
}

class AddressResponseBeanSample {
  AddressResponseBeanSample();

  static Map<String, dynamic> defaultJson() => <String, dynamic>{
        'id': 0,
        'street': '2521 Mertz Prairie',
        'streetName': 'Rempel Ramp',
        'buildingNumber': '9750',
        'city': 'Khalilmouth',
        'zipcode': '81299-1014',
        'country': 'Jamaica',
        'county_code': 'SO',
        'latitude': -74.929233,
        'longitude': 11.358493
      };

  static AddressResponseBean createFromJson() =>
      AddressResponseBean.fromJson(defaultJson());
}
