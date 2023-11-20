import 'package:faker_person_api/src/constant/service_path.dart';
import 'package:faker_person_api/src/service/api_service.dart';
import 'package:test/test.dart';

void main() {
  group('ApiService', () {
    final ApiService apiService = ApiService();
    test('instance has correct path', () {
      expect(apiService.servicePath, ServicePathConstant.apiServicePath);
    });
  });
}
