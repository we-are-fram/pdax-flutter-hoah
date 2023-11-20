import 'package:faker/faker.dart' as f;
import 'package:faker_person_api/src/model/person.dart';
import 'package:faker_person_api/src/repositories/person.dart';
import 'package:mocktail/mocktail.dart';

f.Faker _f = f.Faker();

class MockPersonRepository extends Mock implements PersonRepository {
  @override
  Future<List<Person>> getPersons(int quantity) =>
      Future<List<Person>>.value(List.generate(quantity, (_) => fakePerson));

  Person get fakePerson => Person(
        id: _f.hashCode,
        firstname: _f.person.firstName(),
        lastname: _f.person.lastName(),
        email: _f.internet.email(),
        birthday: _f.date.dateTime(),
        phone: _f.phoneNumber.toString(),
        website: _f.internet.httpUrl(),
      );
}
