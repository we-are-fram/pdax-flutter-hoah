import 'package:faker_person_api/src/data/provider/api_provider.dart';
import 'package:faker_person_api/src/model/person.dart';

class PersonRepository {
  PersonRepository(this._provider);

  PersonRepository.withMocks(this._provider);

  final ApiProvider _provider;

  Future<List<Person>> getPersons(int quantity) async {
    try {
      final response = await _provider.getPersons(quantity);
      return response.persons.map((e) => Person.fromSource(e)).toList();
    } on Exception {
      rethrow;
    }
  }
}
