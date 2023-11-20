import 'package:faker_person_api/src/data/bean/person/response_bean.dart';
import 'package:faker_person_api/src/data/provider/api_provider.dart';
import 'package:faker_person_api/src/model/person.dart';
import 'package:faker_person_api/src/repositories/person.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../data/bean/person/person_response_bean_test.dart';

class MockApiProvider extends Mock implements ApiProvider {}

void main() {
  late ApiProvider apiProvider;
  late PersonRepository personRepository;

  setUp(() {
    apiProvider = MockApiProvider();

    personRepository = PersonRepository.withMocks(apiProvider);
  });

  group('getPersons', () {
    test('Success', () async {
      final PersonResponseBean responseBean =
          PersonResponseBeanSample.createFromJson();

      when(() => apiProvider.getPersons(any())).thenAnswer(
        (_) => Future<PersonResponseBean>.value(responseBean),
      );

      final List<Person> persons = await personRepository.getPersons(1);
      expect(
        persons.length,
        1,
      );
      expect(
        persons.first.name,
        'Telly Balistreri',
      );
    });
  });
}
