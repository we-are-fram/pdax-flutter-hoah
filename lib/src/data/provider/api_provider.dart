import 'package:faker_person_api/src/service/api_service.dart';
import 'package:get/get_connect.dart';

import '../bean/person/response_bean.dart';

class ApiProvider {
  ApiProvider() : _apiService = ApiService();

  ApiProvider.withMocks(this._apiService);

  final ApiService _apiService;

  Future<PersonResponseBean> getPersons(int quantity) async {
    try {
      final Response response =
          await _apiService.callGet('/v1/persons?_quantity=$quantity');

      return PersonResponseBean.fromJson(response.body);
    } on Exception {
      rethrow;
    }
  }
}
