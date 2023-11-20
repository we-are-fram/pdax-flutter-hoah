import 'package:faker_person_api/src/data/bean/person/response_bean.dart';
import 'package:test/test.dart';

void main() {
  test('can create from json', () {
    final PersonResponseBean bean = PersonResponseBeanSample.createFromJson();
    expect(bean.status, 'OK');
    expect(bean.code, 200);
    expect(bean.total, 1);
    expect(bean.persons.length, 1);
  });
}

class PersonResponseBeanSample {
  PersonResponseBeanSample();

  static Map<String, dynamic> defaultJson() => <String, dynamic>{
        'status': 'OK',
        'code': 200,
        'total': 1,
        'data': [
          {
            'id': 1,
            'firstname': 'Telly',
            'lastname': 'Balistreri',
            'email': 'jschuppe@hotmail.com',
            'phone': '+1884298799192',
            'birthday': '1969-03-22',
            'gender': 'female',
            'address': {
              'id': 0,
              'street': '6211 Kiara Ridge Suite 085',
              'streetName': 'Sauer Walk',
              'buildingNumber': '1116',
              'city': 'Pearlieton',
              'zipcode': '15666-8986',
              'country': 'Mauritius',
              'county_code': 'TM',
              'latitude': -43.579546,
              'longitude': 105.012996
            },
            'website': 'http://hermann.com',
            'image': 'http://placeimg.com/640/480/people'
          }
        ]
      };

  static PersonResponseBean createFromJson() =>
      PersonResponseBean.fromJson(defaultJson());
}
