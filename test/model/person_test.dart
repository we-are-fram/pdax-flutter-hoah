import 'package:faker_person_api/src/data/bean/person/person_detail_response_bean.dart';
import 'package:faker_person_api/src/model/address.dart';
import 'package:faker_person_api/src/model/person.dart';
import 'package:test/test.dart';

import '../data/bean/person/person_detail_response_bean_test.dart';

void main() {
  test('can set', () {
    final Person model = PersonModelSample.create();

    expect(model.id, 1);
    expect(model.firstname, 'Eddie');
    expect(model.lastname, 'Raynor');
    expect(model.email, 'lgutmann@goodwin.info');
    expect(model.birthday, DateTime(1987, 3, 12));
    expect(model.gender, 'male');
    expect(model.website, 'http://grady.com');
    expect(model.image, 'http://placeimg.com/640/480/people');

    expect(model.address?.id, 0);
    expect(model.address?.street, '2521 Mertz Prairie');
    expect(model.address?.streetName, 'Rempel Ramp');
    expect(model.address?.buildingNumber, '9750');
    expect(model.address?.city, 'Khalilmouth');
    expect(model.address?.zipcode, '81299-1014');
    expect(model.address?.country, 'Jamaica');
    expect(model.address?.countyCode, 'SO');
    expect(model.address?.latitude, -74.929233);
    expect(model.address?.longitude, 11.358493);
  });

  test('can convert from source', () {
    final PersonDetailResponseBean personResponseBean =
        PersonDetailResponseBeanSample.createFromJson();

    final Person model = Person.fromSource(personResponseBean);

    expect(model.id, 1);
    expect(model.firstname, 'Eddie');
    expect(model.lastname, 'Raynor');
    expect(model.email, 'lgutmann@goodwin.info');
    expect(model.birthday, DateTime(1987, 3, 12));
    expect(model.gender, 'male');
    expect(model.website, 'http://grady.com');
    expect(model.image, 'http://placeimg.com/640/480/people');

    expect(model.address?.id, 0);
    expect(model.address?.street, '2521 Mertz Prairie');
    expect(model.address?.streetName, 'Rempel Ramp');
    expect(model.address?.buildingNumber, '9750');
    expect(model.address?.city, 'Khalilmouth');
    expect(model.address?.zipcode, '81299-1014');
    expect(model.address?.country, 'Jamaica');
    expect(model.address?.countyCode, 'SO');
    expect(model.address?.latitude, -74.929233);
    expect(model.address?.longitude, 11.358493);
  });
}

class PersonModelSample {
  PersonModelSample();

  static Person create() => Person(
      id: 1,
      firstname: 'Eddie',
      lastname: 'Raynor',
      email: 'lgutmann@goodwin.info',
      phone: '+9573354636780',
      birthday: DateTime(1987, 3, 12),
      gender: 'male',
      address: Address(
          id: 0,
          street: '2521 Mertz Prairie',
          streetName: 'Rempel Ramp',
          buildingNumber: '9750',
          city: 'Khalilmouth',
          zipcode: '81299-1014',
          country: 'Jamaica',
          countyCode: 'SO',
          latitude: -74.929233,
          longitude: 11.358493),
      website: 'http://grady.com',
      image: 'http://placeimg.com/640/480/people');
}
