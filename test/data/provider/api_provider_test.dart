import 'package:faker_person_api/src/data/bean/person/response_bean.dart';
import 'package:faker_person_api/src/data/provider/api_provider.dart';
import 'package:faker_person_api/src/service/api_service.dart';
import 'package:get/get_connect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late MockApiService mockApiService;
  late ApiProvider apiProvider;

  setUp(() {
    mockApiService = MockApiService();
    apiProvider = ApiProvider.withMocks(mockApiService);
  });

  group('createHelpdeskCase', () {
    test('success', () async {
      when(() => mockApiService.callGet('/v1/persons?_quantity=1')).thenAnswer(
        (_) => Future<Response>.value(
          const Response(
            statusCode: 200,
            body: {
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
                    'city': 'HCMC',
                    'zipcode': '15666-8986',
                    'country': 'Vietnam',
                    'county_code': 'TM',
                    'latitude': -43.579546,
                    'longitude': 105.012996
                  },
                  'website': 'http://hermann.com',
                  'image': 'http://placeimg.com/640/480/people'
                }
              ]
            },
          ),
        ),
      );
      final PersonResponseBean actual = await apiProvider.getPersons(1);
      expect(actual.status, 'OK');
      expect(actual.code, 200);
      expect(actual.total, 1);
      expect(actual.persons.length, 1);
      expect(actual.persons.first.firstname, 'Telly');
      expect(actual.persons.first.lastname, 'Balistreri');
      expect(actual.persons.first.address?.country, 'Vietnam');
    });
  });
}
