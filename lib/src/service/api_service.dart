import 'package:faker_person_api/src/constant/service_path.dart';

import './api_base_service.dart';

class ApiService extends ApiBaseService {
  factory ApiService() => _instance ??= ApiService._();

  ApiService._() : super(ServicePathConstant.apiServicePath);

  static ApiService? _instance;
}
