import 'package:faker_person_api/src/data/bean/person/person_detail_response_bean.dart';
import 'package:test/test.dart';

void main() {
  test('can create from json', () {
    final PersonDetailResponseBean bean =
        PersonDetailResponseBeanSample.createFromJson();
    expect(bean.id, 1);
    expect(bean.firstname, 'Eddie');
    expect(bean.lastname, 'Raynor');
    expect(bean.email, 'lgutmann@goodwin.info');
    expect(bean.birthday, DateTime(1987, 3, 12));
    expect(bean.gender, 'male');
    expect(bean.website, 'http://grady.com');
    expect(bean.image, 'http://placeimg.com/640/480/people');

    expect(bean.address?.id, 0);
    expect(bean.address?.street, '2521 Mertz Prairie');
    expect(bean.address?.streetName, 'Rempel Ramp');
    expect(bean.address?.buildingNumber, '9750');
    expect(bean.address?.city, 'Khalilmouth');
    expect(bean.address?.zipcode, '81299-1014');
    expect(bean.address?.country, 'Jamaica');
    expect(bean.address?.countyCode, 'SO');
    expect(bean.address?.latitude, -74.929233);
    expect(bean.address?.longitude, 11.358493);
  });
}

class PersonDetailResponseBeanSample {
  PersonDetailResponseBeanSample();

  static Map<String, dynamic> defaultJson() => <String, dynamic>{
        'id': 1,
        'firstname': 'Eddie',
        'lastname': 'Raynor',
        'email': 'lgutmann@goodwin.info',
        'phone': '+9573354636780',
        'birthday': '1987-03-12',
        'gender': 'male',
        'address': {
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
        },
        'website': 'http://grady.com',
        'image': 'http://placeimg.com/640/480/people'
      };

  static PersonDetailResponseBean createFromJson() =>
      PersonDetailResponseBean.fromJson(defaultJson());
}
